% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DiscreteClusGapFuns.R
\name{clusGapDiscr}
\alias{clusGapDiscr}
\title{Discrete application of clusGap}
\usage{
clusGapDiscr(
  x,
  clusterFUN,
  K.max,
  B = nrow(x),
  value.range = "DS",
  verbose = interactive(),
  distName = "hamming",
  useLog = TRUE,
  ...
)
}
\arguments{
\item{x}{A matrix object specifying category attributes in the columns and observations in the rows.}

\item{clusterFUN}{Character string with one of the available clustering implementations.
Available options are: 'pam' (default) from `cluster::pam`, 'diana' from `cluster::diana`, 'fanny' from `cluster::fanny`,
'agnes-\{average, single, complete, ward, weighted\}' from `cluster::fanny`,
'hclust-\{ward.D, ward.D2, single, complete, average, mcquitty, median, centroid\}' from `stats::hclust`,
'kmodes' from `klar::kmodes` (`iter.max = 10`, `weighted = FALSE` and `fast= TRUE`).
'kmodes-N' enables to run the `kmodes` algorithm with a given number N of iterations where `iter.max = N`.}

\item{K.max}{Integer. Maximum number of clusters `k` to consider}

\item{B}{Number of bootstrap samples. By default B = nrow(x).}

\item{value.range}{String character vector or a list of character vector with the length matching the number of columns (nQ) of the array.
A vector with all categories to consider when bootstrapping the null distribution sample (KS: Known Support option).
By DEFAULT vals=NULL, meaning unique range of categories found in the data will be used when drawing the null (DS: Data Support option).
If a character vector of categories is provided, these values would be used for the null distribution drawing across the array.
If a list with category character vectors is provided, it has to have the same number of columns as the input array. The order of list element corresponds to the array's columns.}

\item{verbose}{Integer or logical. Determines whether progress output should printed while running. By DEFAULT one bit is printed per bootstrap sample.}

\item{distName}{String. Name of categorical distance to apply.
Available distances: 'bhattacharyya', 'chisquare', 'cramerV', 'hamming' and 'hellinger'.}

\item{useLog}{Logical. Use log function after estimating `W.k`. Following the original formulation `useLog=TRUE` by default.}

\item{...}{optionally further arguments for `FUNcluster()`}
}
\value{
a matrix with K.max rows and 4 columns, named "logW", "E.logW", "gap", and "SE.sim",
where gap = E.logW - logW, and SE.sim correspond to the standard error of `gap`.
}
\description{
Based on the implementation of the function found in the `cluster` R package.
}
