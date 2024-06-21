#Correlations can be caused by outliers.
#The Spearman correlation is calculated based on the ranks of data.

# simulate independent X, Y and standardize all except entry 23
set.seed(1985)
x <- rnorm(100,100,1)
y <- rnorm(100,84,1)
x[-23] <- scale(x[-23])
y[-23] <- scale(y[-23])

# plot shows the outlier
qplot(x, y, alpha = 0.5)

# outlier makes it appear there is correlation
cor(x,y)
#[1] 0.9878382
cor(x[-23], y[-23])
#[1] -0.04419032

# use rank instead
qplot(rank(x), rank(y))
cor(rank(x), rank(y))
#[1] 0.002508251

# Spearman correlation with cor function
cor(x, y, method = "spearman")
#[1] 0.002508251