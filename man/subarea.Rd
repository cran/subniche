% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subarea.R
\name{subarea}
\alias{subarea}
\title{Convex hull decomposition}
\usage{
subarea(subnic)
}
\arguments{
\item{subnic}{an object of class \code{subniche}.}
}
\value{
A list containing the coordinates and area of each convex hulls
}
\description{
The function is used to calculate the coordinates and area of each convex hull from E environmental space to SR subniche.
}
\details{
The convex hulls measured are :
\enumerate{
\item E is the environmental space.
\item K the sub-environmental space.
\item NR the realized subniche.
\item SP the existing fundamental subniche.
\item SB the area of the biological constraint reducing SP.
\item SR the species realized subniche.}
See \doi{10.7717/peerj.3364} for more details on the subniche concept.
}
\examples{
library(subniche)
data(doubs)
dudi1 <- dudi.pca(doubs$env, scale = TRUE, scan = FALSE, nf = 3)
nic1 <- niche(dudi1, doubs$fish, scann = FALSE)
# number of sites
N <- dim(nic1$ls)[1]
#Create a factor which defines the subsets
fact <- factor(c(rep(1,N/2),rep(2,N/2)))
# nic1 will be use as reference and fact will be use to define the subniches environment
subnic1 <- subniche(nic1, fact)
area_sub <- subarea(subnic1)
}
\references{
Karasiewicz S.,Doledec S.and Lefebvre S. (2017). Within outlying mean indexes: refining the OMI analysis for the realized niche decomposition. \emph{PeerJ} 5:e3364. \doi{10.7717/peerj.3364}.
}
