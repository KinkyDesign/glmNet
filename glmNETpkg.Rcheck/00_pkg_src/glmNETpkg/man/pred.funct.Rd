\name{pred.funct}
\alias{pred.funct}

\title{cv.glmnet prediction}

\description{predict.glmnet function expecting list from fromJSON}

\usage{
pred.funct(dataset, rawModel, additionalInfo)
}

\arguments{
  \item{dataset}{ Data for prediction. A list of two objects: datasetURI (a character string ), dataEntry (a data frame).}
  \item{rawModel}{ R model serialized. }
  \item{additionalInfo}{A list with 3 objects: indepFeatures.mat (A matrix with two columns showing the independent features names in the function and in reallity (ambit name)), models.coef (A data.frame as returned by cv.glmnet), parameters (A list with 3 objects:alpha (The elasticnet mixing parameter, with
0<=alpha<=1), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian")) and s (Value(s) of the penalty parameter lambda at which predictions are required. One in c("lambda.1se","lambda.min")))}
}

\details{The function returns an error if the supplied dataset does not include all the independent features in the raw model.}

\value{A data.frame with prediction values }

\references{The glmnet package help file}

\author{ Georgia Tsiliki }

\note{ No notes for this function }

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m")
data("dat1i")

pred.res<- pred.funct(dat1p, dat1m, dat1i) 
}

\keyword{ predglmnet }
