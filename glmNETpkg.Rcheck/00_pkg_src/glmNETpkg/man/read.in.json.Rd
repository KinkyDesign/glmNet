\name{read.in.json}
\alias{read.in.json}

\title{ Read in function for json files }

\description{ This function reads in a json data file and produces a list with y and x variables }

\usage{
read.in.json(dataset, predictionFeature, parameters)
}

\arguments{
  \item{dataset}{ list of 2 objects, datasetURI:= character sring, code name of dataset, dataEntry:= data frame with 2 columns }
  \item{predictionFeature}{ character string specifying which is the prediction feature in dataEntry }
  \item{parameters}{A list with two objects: alpha (the elasticnet mixing parameter, with
0<=alpha<=1), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian"))}
}

\details{ json file includes uris, data, indicator of y variable, model's parameters list }

\value{A list is returned 
 \item{x.mat }{data frame with independent variables}
 \item{y.mat }{singular data frame with dependent variable}
 \item{data.names}{names of independent features}
 \item{par.list}{list of parameters}
}

\references{ No references for this function }

\author{ Georgia Tsiliki }

\note{No notes for this function }


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1")

x1<- "https://apps.ideaconsult.net/ambit2/feature/22137"

x2<- list(alpha=1,family="gaussian")

r.dat1<- read.in.json(dat1,x1,x2)

}

\keyword{  readjson }

