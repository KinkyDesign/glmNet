read.in.json <-
function(dataset,predictionFeature,parameters){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #predictionFeature:= character string specifying which is the prediction feature in dataEntry, 
    #parameters:= list with parameter values
    
    #dat1<- list.from.json.file
    
    dat1.t<- dataset$dataEntry[,2]#$featureValues # data table
    dat1.yind<-predictionFeature#dat1$predictionFeature #string to indicate dependent variable
    dat1.Yind<- which(colnames(dat1.t) %in% dat1.yind)
    
    dat1.n<- colnames(dat1.t)#unlist(strsplit(colnames(dat1.t),'feature/'))
    #dat1.names<- dat1.n[seq(2,length(dat1.n),2)]#c(dat1.n[8],dat1.n[seq(19,length(dat1.n),11)])
    #colnames(dat1.t)<- dat1.names # give real names to variables
    
    dat1.p<- parameters#dat1$parameters
    
    if(dat1.yind!='NULL'){
        
        dat1.x<- dat1.t[,-dat1.Yind] # array with all independent variables
        dat1.y<- dat1.t[dat1.Yind] # array with dependent variable
        dat1.n<- c(colnames(dat1.y),colnames(dat1.x))#feature names--the 1st is the dependent !!!
        return(list(x.mat=dat1.x,y.mat=dat1.y,data.names=dat1.n,par.list=dat1.p))
        
    }else{
        dat1.x<- dat1.t # array with all independent variables
        dat1.n<- colnames(dat1.x)#feature names--the 1st is the dependent !!!
        return(list(x.mat=dat1.x,data.names=dat1.n,par.list=dat1.p))
    }
    
    
    #y:= data.frame - singular matrix, x:= data.frame (same number of rows with y)
    #return(ifelse(dat1.yind!='NULL',list(x.mat=dat1.x,y.mat=dat1.y),list(x.mat=dat1.x)))	
}
