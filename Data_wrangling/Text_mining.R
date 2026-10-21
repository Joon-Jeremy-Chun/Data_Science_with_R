#Objectives, notes from the textbook.
#The tidytext package helps us convert free form text into a tidy table.
#Use unnest_tokens() to extract individual words and other meaningful chunks of text.
#Sentiment analysis assigns emotions or a positive/negative score to tokens. You can extract sentiments using get_sentiments(). Common lexicons for sentiment analysis are "bing", "afinn", "nrc" and "loughran".


# New 2026 minimal offline reference; does not require tidytext or a sentiment download.
token_counts <- function(text) {
  stopifnot(is.character(text))
  text <- text[!is.na(text)]
  tokens <- unlist(strsplit(tolower(text),"[^[:alpha:]]+"),use.names=FALSE)
  tokens <- tokens[nzchar(tokens)]
  counts <- sort(table(tokens),decreasing=TRUE)
  data.frame(token=names(counts), n=as.integer(counts), row.names=NULL)
}
if (sys.nframe()==0L) print(token_counts(c("Data needs clear questions.","Clear questions guide data work.")))
