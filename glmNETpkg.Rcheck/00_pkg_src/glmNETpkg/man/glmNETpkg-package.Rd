\name{glmNETpkg-package}
\alias{glmNETpkg-package}
\alias{glmNETpkg}
\docType{package}

\title{Reads in json files, create/predict glmnet, save in serialized and pmml format}

\description{This package wrapps up glmnet R package for fitting the lasso or elastic-net regularization
path for linear regression, logistic and multinomial regression models, Poisson regression, Cox model,  multiple-response Gaussian, and the grouped multinomial. Models are saved in pmml an dserialized forms.}

\details{
\tabular{ll}{
Package: \tab glmNETpkg\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-04-23\cr
License: \tab GPL-2\cr
}
}

\author{
Georgia Tsiliki

Maintainer:  Georgia Tsiliki <gtsiliki@central.ntua.gr>
}

\references{The glmnet package help file}

\keyword{ package }

\examples{
data("dat1p")
data("dat1m")
data("dat1i")

data.file<- read.in.json.for.pred(dat1p, dat1m, dat1i)

}
