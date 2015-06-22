glmnet.funct <-
function(dataset,predictionFeature,parameters){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #predictionFeature:= character string specifying which is the prediction feature in dataEntry, 
    #parameters:= list with parameter values-- here awaits a list with two elemnt: alpha which
    #can be alpha=1(lasso), alpha=0(ridge), alpha=0.5(elastic net), AND family which can be any of the 
    #c("gaussian","binomial","poisson","multinomial","cox","mgaussian") 
    ##has a value of lambda=0 (lasso), 0<lambda<=1 (elastic net)
    
    dat1<- read.in.json(dataset,predictionFeature,parameters)
    dat1.bind<- cbind(dat1$y,dat1$x)
    dat1.bind.colN<- dat1$data.names#colnames(dataset$dataEntry[,2])#(dat1.bind)
    colnames(dat1.bind)<- paste('x',1:ncol(dat1.bind),sep='')
    m1<- cv.glmnet(as.matrix(dat1.bind[,2:dim(dat1.bind)[2]]),dat1.bind[,1],
                   family=parameters$family,alpha=parameters$alpha)
    #lambda=parameters$lambda)
    #performs cv to find the optimum lambda and reports coefficients based on that value
    
    #m1$fitted.values<- NULL
    #m1$effects<- NULL
    #e <- attr(m1$terms, ".Environment")#aplws onomazw to environment tou terms e 
    #attr(m1$terms,'.Environment')<- NULL
    #m1$residuals<- NULL
    #m1.env.keep<- which(ls(attr(m1$terms, ".Environment")) %in% c('m1','dat1.bind.colN') ==TRUE)
    #rm(list=ls(attr(m1$terms, ".Environment"))[-m1.env.keep],
    #envir = attr(m1$terms, ".Environment")) 
    
    #saveRDS(m1,model.name)
    m1.ser<- serialize(m1,connection=NULL)
    m1.pmml<- pmml(m1)
    m1.pmml<- toString(m1.pmml)
    m1.coef<- as.matrix(coef(m1)[,1,drop=FALSE])#[-which(coef(m1)[,1]==0),]
    f.names<- rownames(m1.coef)[-which(rownames(m1.coef)=='(Intercept)')]# remove intercept's name
    indiF<- f.names
    f.names<- unlist(strsplit(f.names,'x'))
    f.names<- as.numeric(f.names[seq(2,length(f.names),2)])
    dat1.colN.keep<- dat1.bind.colN[f.names] 
    indiF<- cbind(indiF,dat1.colN.keep)
    colnames(indiF)<- c('ModelCoef','RealFeatureNames')
    
    #alg.name<- ifelse(parameters$alpha<1,if(parameters$alpha<0.5){'ridge'}else{'elastic.net'},'lasso')
    
    
    #pred.name<- unlist(strsplit(colnames(dat1$y),'/'))
    #pred.name<- pred.name[length(pred.name)]
    #pred.x<- sample(1:100,1)
    #set.seed(pred.x)
    #pred.y<- sample(1:1e+10,1)
    pred.name<- colnames(dat1$y)
    pred.name1<- paste(pred.name,'Predicted',sep=' ')
    m1.ser.list<- list(rawModel=m1.ser,pmmlModel=m1.pmml,
                       predictedFeatures=pred.name1,#colnames(dat1$y)#alg.name,sep=' predicted by '),
                       independentFeatures=dat1.colN.keep,
                       additionalInfo=list(indepFeaturesMat=indiF, predictedFeatures=pred.name1,
                                           modelsCoef=m1.coef, parameters=parameters))
    
    return(m1.ser.list)
    
}
