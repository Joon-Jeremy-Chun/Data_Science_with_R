# Small mathematics and probability investigations

[← Portfolio](../README.md) · [Full source catalog](../docs/SOURCE_CATALOG.md)

Use exact answers to check simulation and computation.

## Suggested reading order

1. Start with integer/square sums and compare against their closed forms.
2. Build a deck, inspect conditional card probabilities, then run the completed natural-blackjack reference.
3. Compare Monty Hall, birthday and roulette simulations with their assumptions and exact expectations.

## Data and prerequisites

Embedded vectors, a 52-card deck, uniform 365-day birthday assumptions and hypothetical roulette payouts; no external records.

## Lesson index

| Source | Focus / opening note | State |
|---|---|---|
| [basic random sampling.R](basic%20random%20sampling.R) | An important application of the mean function | [Repaired / reference](basic%20random%20sampling.R) |
| [Generating a deck of cards.R](Generating%20a%20deck%20of%20cards.R) | 'paste' joins two strings and inserts a space in between. | [Source inspected](Generating%20a%20deck%20of%20cards.R) |
| [Monte Carlo simulation-Blackjack_probability.R](Monte%20Carlo%20simulation-Blackjack_probability.R) | New 2026 reference: an ace and a ten-valued card in a two-card hand. | [Repaired / reference](../docs/cases/blackjack/README.md) |
| [Monty Hall problem-pick one of three doors.R](Monty%20Hall%20problem-pick%20one%20of%20three%20doors.R) | Monty Hall was the host of a game show called "Let's Make a Deal." | [Source inspected](Monty%20Hall%20problem-pick%20one%20of%20three%20doors.R) |
| [Roulette game-the risk of casino.R](Roulette%20game-the%20risk%20of%20casino.R) | Find the chance that the casino's total risks (Ex <= $0). with Monte Carlo simulations | [Source inspected](Roulette%20game-the%20risk%20of%20casino.R) |
| [Sum_of _integers.R](Sum_of%20_integers.R) | Sum of integers formula S = [n(n+1)]/2 | [Repaired / reference](Sum_of%20_integers.R) |
| [The birthday problem-duplicated birthdays in a group.R](The%20birthday%20problem-duplicated%20birthdays%20in%20a%20group.R) | checking for duplicated birthdays in one 50 person group | [Repaired / reference](../docs/cases/birthday/README.md) |

## Results and limitations

Natural blackjack means an ace plus a ten-valued card in two cards, not the full game. Birthday calculations omit leap-day/seasonality. Large loops are teaching experiments; comments are historical illustrative outputs.

Read [repair evidence](../docs/REPAIRS.md) and [reproduction/side effects](../docs/REPRODUCIBILITY.md). Historical numeric comments are preserved; a successful smoke run does not validate every statistical interpretation.

## Credits

The repository identifies HarvardX/Harvard data-science learning material, and several source notes cite Rafael A. Irizarry’s textbook. Treat this as coursework and study notes. Exact completion dates, credentials and personal/team contribution are unverified unless a specific source states them.
