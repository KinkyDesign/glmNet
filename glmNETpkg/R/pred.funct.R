pred.funct <-
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
    
    m1<- read.in.json.for.pred(dataset,rawModel,additionalInfo)
    m1.dat<- m1$x.mat
    #colnames(m1.dat)<- m1$additionalInfo[[2]][,1]#$indepFeaturesMat[,1]
    #dep.name<- m1$additionalInfo$depFeature
    #pred.name<- unlist(strsplit(as.character(dep.name),'/'))
    #pred.name<- pred.name[length(pred.name)]
    #list.name<- paste(pred.name,'Predicted',sep=' ')
    pred.name<- m1$additionalInfo$predictedFeatures
    #list.name<- paste(as.character(pred.name),'Predicted',sep=' ')
    
    m1.mod<- m1$model
    
    #m1<- readRDS(model.name)
    if(length(m1$additionalInfo$parameters$s)!=0){
        p1<- predict(m1.mod,as.matrix(m1.dat),s=m1$additionalInfo$parameters$s)
    }else{p1<- predict(m1.mod,as.matrix(m1.dat))}

    for(i in 1:dim(p1)[1]){
	w1<- data.frame(p1[i])
	colnames(w1)<- pred.name
	if(i==1){p7.1<- list(unbox(w1))
	}else{
	     p7.1[[i]]<- unbox(w1)
	}
     }
     p7.2<- list(predictions=p7.1)


    
    #saveRDS(p1,pred.name)
    #p1.ser<- serialize(p1,connection=NULL)
    #p1.ser.list<- list(predByRawModel=p1.ser)
    return(p7.2)#.ser.list))#,predictionFeatures=m1$independentFeatures))
}
