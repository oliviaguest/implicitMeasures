% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/descript_d.R
\name{descript_d}
\alias{descript_d}
\title{Descriptive table of either the IAT D-score or the SC-IAT Ds}
\usage{
descript_d(data, latex = FALSE)
}
\arguments{
\item{data}{Dataframe with either class \code{dscore} or class
\code{dsciat}.}

\item{latex}{Logical. If \code{TRUE}, the table for the descriptive statistics
will be printed in latex format. Default is \code{FALSE}.}
}
\value{
Dataframe, containing the mean, s.d., minimum and maximum of the IAT
         (\code{D-score}, \code{D-practice}, and \code{D-test}) or the SC-IAT
         (\code{D-Sciat}, \code{RT.MappingA}, \code{RT.MappingB}).
}
\description{
Descriptive statistics for the IAT \emph{D-score} or the SC-IAT \emph{D}.
}
\examples{
# compute D-score 2 for the IAT data ###
  data("raw_data") # import data
  iat_cleandata <- clean_iat(raw_data, sbj_id = "Participant",
                          block_id = "blockcode",
                          mapA_practice = "practice.iat.Milkbad",
                          mapA_test = "test.iat.Milkbad",
                          mapB_practice = "practice.iat.Milkgood",
                          mapB_test = "test.iat.Milkgood",
                          latency_id = "latency",
                          accuracy_id = "correct",
                          trial_id = "trialcode",
                          trial_eliminate = c("reminder", "reminder1"),
                          demo_id = "blockcode",
                          trial_demo = "demo")
  iat_data <- iat_cleandata[[1]]
# calculate D-score
  iat_dscore <- computeD(iat_data,
                          Dscore =  "d2")
  descript_d(iat_dscore) # descriptive statistics for the IAT

 # calculate D for the SCIAT
  data("raw_data") # load data
sciat_data <- clean_sciat(raw_data, sbj_id = "Participant",
                         block_id = "blockcode",
                         latency_id = "latency",
                         accuracy_id = "correct",
                         block_sciat_1 = c("test.sc_dark.Darkbad",
                                           "test.sc_dark.Darkgood"),
                         block_sciat_2 = c("test.sc_milk.Milkbad",
                                           "test.sc_milk.Milkgood"),
                         trial_id  = "trialcode",
                         trial_eliminate = c("reminder",
                                             "reminder1"))

 sciat1 <- sciat_data[[1]] # compute D for the first SC-IAT
 d_sciat1 <- Dsciat(sciat1,
                    mappingA = "test.sc_dark.Darkbad",
                    mappingB = "test.sc_dark.Darkgood",
                    non_response = "alert")
  descript_d(d_sciat1,
             latex = TRUE) # descriptive statistics for the SC-IAT in latex
                          # format
}
