\name{glmnet.funct}
\alias{glmnet.funct}

\title{GLMnet model}

\description{
Does k-fold cross-validation for glmnet, returns a value for lambda using cv.glmnet function. produces a serialized and pmml model.
}

\usage{
glmnet.funct(dataset, predictionFeature, parameters)
}

\arguments{
  \item{dataset}{ list of 2 objects, datasetURI:= character sring, code name of dataset, dataEntry:= data frame with 2 columns }
  \item{predictionFeature}{ character string specifying which is the prediction feature in dataEntry }
  \item{parameters}{A list with two objects: alpha (the elasticnet mixing parameter, with
0<=alpha<=1 and alpha=1(lasso), alpha=0.5 (elastic net), alpha=0 (ridge)), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian"))}
}

\details{From glmnet package: The function runs glmnet 10+1 times; the first to get the lambda sequence, and then the remainder to compute the fit with each of the folds omitted. The error is accumulated, and the
average error and standard deviation over the folds is computed. Note that cv.glmnet does NOT
search for values for alpha.
}

\value{A List 
  \item{rawModel}{ A serialized cv.glmnet object (class raw) }
  \item{pmmlModel}{ A pmml cv.glmnet object }
  \item{predictedFeatures}{A character string specifying the name of the predicted feature }
  \item{independentFeatures}{ A list with all independent features included in the glmnet model }
  \item{additionalInfo}{ A list with 3 objects: indepFeatures.mat(A matrix with two columns showing the independent features names in the function and in reallity (ambit name)), models.coef(A data.frame as returned by cv.glmnet with coefficients), parameters (A list with 2 objects: alpha (The elasticnet mixing parameter, with 0<=alpha<=1), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian")))}
}

\references{The help file glmnet}

\author{ Georgia Tsiliki }

\note{ No notes for this function }


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1")

x1<- "https://apps.ideaconsult.net/ambit2/feature/22137"


x2<- list(alpha=1,family="gaussian")

lasso.mod<- glmnet.funct(dat1,x1,x2)

}

\keyword{ glmnetCV }
