# sampling with R (or other statistics programs) will generate the random numbers.
# It does mean that the result of code will differ every time.
# In order to have same result use the set.seed() function.


#?set.seed

set.seed(2)
set.seed(2, sample.kind="Rounding")    # will make R 3.6 generate a seed as in R 3.5

#Using the sample.kind="Rounding" argument will generate a message:
  
#non-uniform 'Rounding' sampler used