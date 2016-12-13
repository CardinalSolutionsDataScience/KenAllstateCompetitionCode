library(h2o)
library(car)
library(h2oEnsemble)
localH2o = h2o.init(nthreads=-1, max_mem_size = '50g')
filePath = "C:/Users/kmillard/Desktop/Kaggle/AllStateData/train_cleaned.csv"
d = h2o.importFile( path = filePath
                    , destination_frame='d'
                    , parse = TRUE
                    , sep = ','
)

#remove any outliers (~360 records)
outliers = scale(log(d$loss))>3 | scale(log(d$loss))< -3
outliersRemoved = !outliers
sum(outliers + outliersRemoved)



doutliers = d[outliers,]
d = d[outliersRemoved, ]


#split test and train set along cat80 -> A+D in one model B+C in another
d_AD <- d[d$cat80=='A'| d$cat80=='D', ]
d_BC <- d[d$cat80=='B'| d$cat80=='C', ]


#remove ID field from train set
d_AD = d_AD[,-1]
d_BC = d_BC[,-1]

#d_BC_split is VERY susceptible to outliers due to much smaller data set size and the number of predictors (it's only 25% of the data)
#remove anything more than 3 SDs from the mean AGAIN
outliers_BC = scale(log(d_BC$loss))>2 | scale(log(d_BC$loss))< -2
outliersRemoved_BC = !outliers_BC
sum(outliers_BC + outliersRemoved_BC)

#partition data
d_AD_split = h2o.splitFrame(d_AD, ratios = c(0.7, 0.1, 0.1))
d_BC_split = h2o.splitFrame(d_BC_noOut, ratios = c(0.7, 0.1, 0.1))






max_depths_to_test = c(1:20)
ntrees_to_test = seq(1000,10000,1000)
learn_rate_to_test = seq(0.1,1,0.01)
learn_rate_annealing_to_test = seq(0.1, 1, 0.1)
sample_rate_to_test = seq(0.1,1,0.1)
col_sample_rate_to_test = seq(0.1,1,0.1)
col_sample_rate_per_tree_to_test = seq(0.1,1,0.1)
nbins_to_test = seq(20,100,10)
nbins_cats_to_test = seq(1024,7000,100)
categorical_encoding_to_test = c('OneHotExplicit', 'Binary', 'Eigen', 'Enum')



h2o.glm.1 <- function(..., alpha = 0.0) h2o.glm.wrapper(..., alpha = alpha)
h2o.glm.2 <- function(..., alpha = 0.5) h2o.glm.wrapper(..., alpha = alpha)
h2o.glm.3 <- function(..., alpha = 1.0) h2o.glm.wrapper(..., alpha = alpha)
h2o.randomForest.1 <- function(..., ntrees = 2000, nbins = 50, max_depth = 8, seed = 1) h2o.randomForest.wrapper(..., ntrees = ntrees, nbins = nbins, seed = seed, max_depth = max_depth)
h2o.randomForest.2 <- function(..., ntrees = 2000, sample_rate = 0.8, max_depth = 6, seed = 1) h2o.randomForest.wrapper(..., ntrees = ntrees, sample_rate = sample_rate, seed = seed, max_depth = max_depth)
h2o.randomForest.3 <- function(..., ntrees = 4000, sample_rate = 0.85, max_depth = 10, seed = 1) h2o.randomForest.wrapper(..., ntrees = ntrees, sample_rate = sample_rate, seed = seed, max_depth = max_depth)
h2o.randomForest.4 <- function(..., ntrees = 4000, nbins = 50, max_depth = 6, seed = 1) h2o.randomForest.wrapper(..., ntrees = ntrees, nbins = nbins, seed = seed, max_depth = max_depth)
h2o.randomForest.5 <- function(..., ntrees = 200, nbins = 50, max_depth = 5, seed = 1) h2o.randomForest.wrapper(..., ntrees = ntrees, nbins = nbins, seed = seed, max_depth = max_depth)
h2o.gbm.1 <- function(..., ntrees = 1000, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, seed = seed)
h2o.gbm.2 <- function(..., ntrees = 2000, nbins = 50, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, nbins = nbins, seed = seed)
h2o.gbm.3 <- function(..., ntrees = 7000, max_depth = 10, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, max_depth = max_depth, seed = seed)
h2o.gbm.4 <- function(..., ntrees = 7000, max_depth = 10, col_sample_rate = 0.8, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, col_sample_rate = col_sample_rate, seed = seed, max_depth = max_depth)
h2o.gbm.5 <- function(..., ntrees = 1000, max_depth = 6, col_sample_rate = 0.7, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, col_sample_rate = col_sample_rate, seed = seed, max_depth = max_depth)
h2o.gbm.6 <- function(..., ntrees = 1000, max_depth = 8, col_sample_rate = 0.6, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, col_sample_rate = col_sample_rate, seed = seed, max_depth = max_depth)
h2o.gbm.7 <- function(..., ntrees = 1000, max_depth = 5, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, seed = seed, max_depth = max_depth)
h2o.gbm.8 <- function(..., ntrees = 1000, max_depth = 3, seed = 1) h2o.gbm.wrapper(..., ntrees = ntrees, max_depth = max_depth, seed = seed)
h2o.deeplearning.1 <- function(..., hidden = c(500,500), activation = "Rectifier", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)
h2o.deeplearning.2 <- function(..., hidden = c(200,200,200), activation = "Tanh", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)
h2o.deeplearning.3 <- function(..., hidden = c(500,500), activation = "RectifierWithDropout", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)
h2o.deeplearning.4 <- function(..., hidden = c(500,500), activation = "Rectifier", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)
h2o.deeplearning.5 <- function(..., hidden = c(100,100,100), activation = "Rectifier", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)
h2o.deeplearning.6 <- function(..., hidden = c(50,50), activation = "Rectifier", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)
h2o.deeplearning.7 <- function(..., hidden = c(100,100), activation = "Rectifier", epochs = 50, seed = 1)  h2o.deeplearning.wrapper(..., hidden = hidden, activation = activation, seed = seed)



metalearner <- "h2o.glm.wrapper"


learners = c('h2o.glm.1', 'h2o.glm.2', 'h2o.glm.3'
             , 'h2o.randomForest.1','h2o.randomForest.2', 'h2o.randomForest.5'
             , 'h2o.deeplearning.2', 'h2o.deeplearning.3', 'h2o.deeplearning.4', 'h2o.deeplearning.5'
             , 'h2o.deeplearning.6', 'h2o.deeplearning.7')


x <-names(d_AD_split[[1]])
x<-x[1:124]

fit_AD <- h2o.ensemble(x=x, y = c('loss'),
                    training_frame = d_AD_split[[1]],
                    validation_frame = d_AD_split[[2]],
                    family = "gaussian", 
                    learner = learners, 
                    metalearner = metalearner,
                    cvControl = list(V = 5))

fit_BC <- h2o.ensemble(x=x, y = c('loss'),
                       training_frame = d_BC_split[[1]],
                       validation_frame = d_BC_split[[2]],
                       family = "gaussian", 
                       learner = learners, 
                       metalearner = metalearner,
                       cvControl = list(V = 5))



h2o.performance(fit, d_split[[3]])



filePath_test = "C:/Users/kmillard/Desktop/Kaggle/AllStateData/test_cleaned.csv"
dtest = h2o.importFile( path = filePath_test
                        , destination_frame='dtest'
                        , parse = TRUE
                        , sep = ','
)

#split and cat80
d_test_AD <- dtest[dtest$cat80=='A'| dtest$cat80=='D', ]
d_test_BC <- dtest[dtest$cat80=='B'| dtest$cat80=='C', ]

#store and remove ID field
AD_testid = d_test_AD[,1]
d_test_AD = d_test_AD[,-1]

BC_testid = d_test_BC[,1]
d_test_BC = d_test_BC[,-1]

#test_comp = predict(dcomp, dtest)
lossAD = predict(fit_AD, d_test_AD)
lossBC = predict(fit_BC, d_test_BC)

idpred = h2o.rbind(AD_testid, BC_testid)
losscomb = h2o.rbind(lossAD$pred, lossBC$pred)

ex = h2o.cbind(idpred, losscomb)
h2o.exportFile(ex, path = 'C:/Users/kmillard/Desktop/Kaggle/superlearn_splitcat80.csv')
