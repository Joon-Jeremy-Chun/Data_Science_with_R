"""Run a reviewed subset in fresh R processes; excludes external/effectful lessons."""
import argparse
import concurrent.futures
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
LARGE={'section 1; enough number of simulations-Monty Carlo replicates.R',
       '3.1 Correlation is Not Causation-Spurious Correlation.R',
       'section 4; case study-the interest rates.R'}
EFFECTS=r'https?://|install.packages|update.packages|download.file|read_html|file.copy|file.remove|system\('


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rscript',default=shutil.which('Rscript'),help='Rscript executable path if absent from PATH')
    parser.add_argument('--workers',type=int,default=2)
    args=parser.parse_args()
    if not args.rscript:
        parser.error('Provide --rscript or add Rscript to PATH.')
    selected=[];skipped=[]
    for p in sorted(ROOT.rglob('*.R')):
        if p.relative_to(ROOT).parts[0] in {'tools','tests'}:
            continue
        code='\n'.join(s for s in p.read_text(encoding='utf-8-sig').splitlines() if not s.lstrip().startswith('#'))
        if re.search(EFFECTS,code) or p.name in LARGE:
            skipped.append(p.relative_to(ROOT).as_posix())
        else:
            selected.append(p)
    def run(p):
        try:
            result=subprocess.run([args.rscript,'--vanilla',str(ROOT/'tools/run_one_offline.R'),str(p)],
                cwd=tempfile.gettempdir(),capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=30)
            error=next((s for s in result.stdout.splitlines() if s.startswith('AUDIT_ERROR')),None)
            return {'file':p.relative_to(ROOT).as_posix(),'exit':result.returncode,'error':error}
        except subprocess.TimeoutExpired:
            return {'file':p.relative_to(ROOT).as_posix(),'exit':124,'error':'30-second timeout'}
    with concurrent.futures.ThreadPoolExecutor(max_workers=max(1,args.workers)) as pool:
        results=list(pool.map(run,selected))
    failures=[r for r in results if r['exit']]
    print(json.dumps({'attempted':len(results),'passed':len(results)-len(failures),
                      'failures':failures,'skipped':skipped},ensure_ascii=False,indent=2))
    return bool(failures)


if __name__=='__main__':
    raise SystemExit(main())
