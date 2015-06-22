read.in.json.for.pred <-
function(dataset,rawModel,additionalInfo){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #rawModel:= serialized raw model for prediction
    #additionalInfo:= FOR GLMNET MODEL what are the features used for setting the model,
    #a list of 3 elements:
    #indepFeaturesMat=data frame with 2 columns: 1st  ModelCoef giving the dummy coefficient names produced for independent
    #features in the model, and 2nd RealFeatureNames which are ambit's feature names
    #modelCoef= model's coefficients
    #parameters= a list of 3 objects: alpha(1:lasso, 0:ridge, 0.5:elastic net), 
    #family one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian"),
    #s=c("lambda.1se","lambda.min") if s is numeric then number of lambdas to be used
    ##type=c("link","response","coefficients","nonzero","class") for glmnet objects only, not cv.glmnet!
    
    dat1.t<- dataset$dataEntry[,2]#$featureValues # data table
    dat1.n<- colnames(dat1.t)#dat1.n<- unlist(strsplit(colnames(dat1.t),'/'))
    dat1.indi<- which(dat1.n %in% additionalInfo[[1]][,2])#$indepFeaturesMat[,2]
    dat1.dep.n<- dat1.n[setdiff(1:length(dat1.n),dat1.indi)]# DO NOT CHANGE position !!!
    dat1.t<- dat1.t[,dat1.indi,drop=FALSE]
    
    if(ncol(dat1.t)==nrow(additionalInfo[[1]])){#$indepFeaturesMat)){#prod(dim(dat1.t))!=0){
        #dat1.names<- c(dat1.n[8],dat1.n[seq(19,length(dat1.n),11)])
        #colnames(dat1.t)<- dat1.names # give real names to variables
        
        dat1.m<- rawModel
        dat1.m<- base64Decode(dat1.m,'raw')
        dat1.model<- unserialize(dat1.m)
        
        dat1.indi.rev<- which(additionalInfo[[1]][,2] %in% colnames(dat1.t))#$indepFeaturesMat[,2]
        additionalInfo1<- additionalInfo
        additionalInfo1[[1]]<- additionalInfo1[[1]][dat1.indi.rev,,drop=FALSE]
        additionalInfo1<- c(depFeature=dat1.dep.n,additionalInfo1)
        
        return(list(x.mat=dat1.t,model=dat1.model,additionalInfo=additionalInfo1))
    }else{
        stop('Unrecognized feature names in prediction data set')}
    
}
