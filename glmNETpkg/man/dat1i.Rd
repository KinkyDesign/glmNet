\name{dat1i}
\alias{dat1i}
\docType{data}

\title{Information for glmnet.funct }

\description{A list with information for glmNet and prediction}

\usage{data("dat1i")}

\format{
  A list with 3 objects:
  \describe{
  \item{\code{indepFeatures.mat}}{A matrix with two columns showing the independent features names in the function and in reallity (ambit name)}
  \item{\code{models.coef}}{A data.frame as returned by cv.glmnet}
  \item{\code{parameters}}{A list with 3 objects:alpha (The elasticnet mixing parameter, with
0<=alpha<=1), family (as in glmnet one of c("gaussian","binomial","poisson","multinomial","cox","mgaussian")) and s (Value(s) of the penalty parameter lambda at which predictions are required. One in c("lambda.1se","lambda.min"))}
  }
}

\details{Example dataset to predict with dat1p, dat1m}

\source{The source of this function is in the}

\references{There are no references}

\examples{
data(dat1i)
## maybe str(dat1i) ; plot(dat1i) ...
}

\keyword{datasetsi}
