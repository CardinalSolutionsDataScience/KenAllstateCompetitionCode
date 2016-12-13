library(h2o)
library(car)
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



#remove ID field from train set
d = d[,-1]


#create exponential variables (add variance)
d$cont1sq = d$cont1^2
d$cont1cu = d$cont1^3
d$cont1fo = d$cont1^4
d$cont1fi = d$cont1^5
d$cont1si = d$cont1^6



d$cont2sq = d$cont2^2
d$cont2cu = d$cont2^3
d$cont2fo = d$cont2^4
d$cont2fi = d$cont2^5
d$cont2si = d$cont2^6

d$cont3sq = d$cont3^2
d$cont3cu = d$cont3^3
d$cont3fo = d$cont3^4
d$cont3fi = d$cont3^5
d$cont3si = d$cont3^6


d$cont4sq = d$cont4^2
d$cont4cu = d$cont4^3
d$cont4fo = d$cont4^4
d$cont4fi = d$cont4^5
d$cont4si = d$cont4^6

d$cont5sq = d$cont5^2
d$cont5cu = d$cont5^3
d$cont5fo = d$cont5^4
d$cont5fi = d$cont5^5
d$cont5si = d$cont5^6

d$cont6sq = d$cont6^2
d$cont6cu = d$cont6^3
d$cont6fo = d$cont6^4
d$cont6fi = d$cont6^5
d$cont6si = d$cont6^6


d$cont7sq = d$cont7^2
d$cont7cu = d$cont7^3
d$cont7fo = d$cont7^4
d$cont7fi = d$cont7^5
d$cont7si = d$cont7^6

d$cont8sq = d$cont8^2
d$cont8cu = d$cont8^3
d$cont8fo = d$cont8^4
d$cont8fi = d$cont8^5
d$cont8si = d$cont8^6

d$cont9sq = d$cont9^2
d$cont9cu = d$cont9^3
d$cont9fo = d$cont9^4
d$cont9fi = d$cont9^5
d$cont9si = d$cont9^6

d$cont10sq = d$cont10^2
d$cont10cu = d$cont10^3
d$cont10fo = d$cont10^4
d$cont10fi = d$cont10^5
d$cont10si = d$cont10^6

d$cont11sq = d$cont11^2
d$cont11cu = d$cont11^3
d$cont11fo = d$cont11^4
d$cont11fi = d$cont11^5
d$cont11si = d$cont11^6

d$cont12sq = d$cont12^2
d$cont12cu = d$cont12^3
d$cont12fo = d$cont12^4
d$cont12fi = d$cont12^5
d$cont12si = d$cont12^6

d$cont13sq = d$cont13^2
d$cont13cu = d$cont13^3
d$cont13fo = d$cont13^4
d$cont13fi = d$cont13^5
d$cont13si = d$cont13^6

d$cont14sq = d$cont14^2
d$cont14cu = d$cont14^3
d$cont14fo = d$cont14^4
d$cont14fi = d$cont14^5
d$cont14si = d$cont14^6


#partition data
d_split = h2o.splitFrame(d, ratios = c(0.7, 0.1, 0.1))


n = names(d_split[[1]])


# 
# dcomp = h2o.prcomp(d_split[[1]]
#                    , x =n[1:130]
#                    , transform = 'STANDARDIZE'
#                    , k = 150
#                    , use_all_factor_levels = TRUE
#                    , compute_metrics = TRUE
#                    , impute_missing = TRUE)





bt = h2o.gbm(y = c('loss')
             , training_frame = d_split[[1]]
             , validation_frame = d_split[[2]]
             , distribution = 'gaussian'
             , stopping_metric =  'MSE'
             )

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


hyperparams = list(max_depth = max_depths_to_test
                   , ntrees = ntrees_to_test
                   , learn_rate = learn_rate_to_test
                   , learn_rate_annealing = learn_rate_annealing_to_test
                   , sample_rate = sample_rate_to_test
                   , col_sample_rate = col_sample_rate_per_tree_to_test
                   , col_sample_rate_per_tree = col_sample_rate_per_tree_to_test
                   , nbins = nbins_to_test
                   , nbins_cats = nbins_cats_to_test
                   , categorical_encoding = categorical_encoding_to_test)
                   

search_criteria = list(strategy = 'RandomDiscrete'
                       , max_runtime_secs = 14400
                       , stopping_metric = 'MSE'
                       , stopping_rounds = 10
                       , seed = 123456)




gbm.grid = h2o.grid('gbm'
                    , y = c('loss')
                    , x = c(1:124)
                    , training_frame = d_split[[1]]
                    , validation_frame = d_split[[2]]
                    , stopping_metric = 'MSE'
                    , distribution = 'gaussian'
                    , hyper_params = hyperparams
                    , search_criteria = search_criteria)

model_ids <- gbm.grid@model_ids
models <- lapply(model_ids, function(id) { h2o.getModel(id)})


h2o.performance(models[[1]], d_split[[3]])



filePath_test = "C:/Users/kmillard/Desktop/Kaggle/AllStateData/test_cleaned.csv"
dtest = h2o.importFile( path = filePath_test
                        , destination_frame='dtest'
                        , parse = TRUE
                        , sep = ','
)

testid = dtest[,1]
dtest = dtest[,-1]

#test_comp = predict(dcomp, dtest)
loss = h2o.predict(models[[1]], dtest)

ex = h2o.cbind(testid, loss)
h2o.exportFile(ex, path = 'C:/Users/kmillard/Desktop/Kaggle/gbm_originalDataSpace_noOutlier_COmbinedFactors.csv')
