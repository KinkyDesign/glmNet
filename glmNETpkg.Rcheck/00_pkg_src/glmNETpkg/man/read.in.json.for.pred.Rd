\name{read.in.json.for.pred}
\alias{read.in.json.for.pred}

\title{ Read in function for json files for prediction }

\description{This function reads in a json data file and produces a list with y and x variables }

\usage{
read.in.json.for.pred(dataset, rawModel, additionalInfo)
}

\arguments{
  \item{dataset}{ Data for prediction. A list of two objects: datasetURI (a character string ), dataEntry (a data frame).}
  \item{rawModel}{ R model serialized. }
  \item{additionalInfo}{A list with 3 objects: indepFeatures.mat (A matrix with two columns showing the independent features names in the function and in reallity (ambit name)), models.coef (A data.frame as returned by cv.glmnet), parameters (A list with 3 objects:alpha (The elasticnet mixing parameter, with
0<=alpha<=1), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian")) and s (Value(s) of the penalty parameter lambda at which predictions are required. One in c("lambda.1se","lambda.min")))}
}

\details{The function returns an error if the supplied dataset does not include all the independent features in the raw model.}

\value{A List including:
  \item{x.mat }{ data frame with independent variables}
  \item{model }{ R cv.glmnet model }
  \item{additionalInfo}{A list with 4 objects: depFeature (a character string for the dependent feature in the data set (ambit name)), indepFeatures.mat(A matrix with two columns showing the independent features names in the function and in reallity (ambit name)), models.coef(A data.frame as returned by cv.glmnet with coefficients), parameters (A list with 3 objects:alpha (The elasticnet mixing parameter, with
0<=alpha<=1), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian")) and s (Value(s) of the penalty parameter lambda at which predictions are required. One in c("lambda.1se","lambda.min")))}
}

\references{ No reference for this function }

\author{ Georgia Tsiliki }

\note{No notes for this function }

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m")
data("dat1i")

data.file<- read.in.json.for.pred(dat1p, dat1m, dat1i)

}


\keyword{ readjsonp }

