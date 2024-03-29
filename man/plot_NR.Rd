% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_NR.R
\name{plot_NR}
\alias{plot_NR}
\title{Community niche distribution}
\usage{
plot_NR(
  subnic,
  sig = NULL,
  sig_thres = 0.05,
  xlab = NULL,
  ylab = NULL,
  main = NA,
  col.axis = "azure3",
  lty.axis = 2,
  lwd.axis = 2,
  border.E = "black",
  col.E = "#92c5de",
  lty.E = 1,
  lwd.E = 1,
  pch.NR.pos = 21,
  cex.NR.pos = 1,
  col.NR.pos = "#a1d99b",
  col.NR.pt = "black",
  col.NR.lab = "black",
  cex.NR.lab = NA,
  fac.NR.lab = 1.2,
  col.arrow = "black",
  angle.arrow = 20,
  lwd.arrow = 2,
  length.arrow = 0.1,
  font.sp = 2,
  leg = T,
  posi.leg = "topleft",
  bty.leg = "n",
  ...
)
}
\arguments{
\item{subnic}{an object of class \code{subniche}.}

\item{sig}{a factor defining the significance species, default NULL.}

\item{sig_thres}{value for minimum significance, default 0.05}

\item{xlab}{label for x-axis, see \link[graphics]{title} for more details.}

\item{ylab}{label for y-axis, see \link[graphics]{title} for more details.}

\item{main}{a main title for the plot, see \link[graphics]{title} for more details.}

\item{col.axis}{axis color, see \link[graphics]{par} for more details.}

\item{lty.axis}{axis line type, see \link[graphics]{par} for more details.}

\item{lwd.axis}{axis width, see \link[graphics]{par} for more details.}

\item{border.E}{color border of E polygon, see \link[graphics]{polygon} for more details.}

\item{col.E}{inside color of E polygon, see \link[graphics]{polygon} for more details.}

\item{lty.E}{line type for the E border, see \link[graphics]{polygon} for more details.}

\item{lwd.E}{line width for the E border, see \link[graphics]{polygon} for more details.}

\item{pch.NR.pos}{type of points representing the NR position, see \link[graphics]{points} for more details.}

\item{cex.NR.pos}{size of points representing the NR position, see \link[graphics]{points} for more details.}

\item{col.NR.pos}{color of points representing the NR position, see \link[graphics]{points} for more details.}

\item{col.NR.pt}{point color contour if pch=21:25.}

\item{col.NR.lab}{color of the species labels, see see \link[graphics]{text} for more details.}

\item{cex.NR.lab}{size of the species labels defautls NA for no labels, see see \link[graphics]{text} for more details.}

\item{fac.NR.lab}{factor for moving the NR labels from its original coordinates for clarity, by defaults they are multiply 1.2}

\item{col.arrow}{arrow color, see \link[graphics]{arrows} for more details.}

\item{angle.arrow}{arrow angle head, see \link[graphics]{arrows} for more details.}

\item{lwd.arrow}{arrow width, see \link[graphics]{arrows} for more details.}

\item{length.arrow}{arrow head length, see \link[graphics]{arrows} for more details.}

\item{font.sp}{An integer which specifies which font to use for species label. 1 corresponds to plain text (the default), 2 to bold face, 3 to italic and 4 to bold italic, see \link[graphics]{par} for more details.}

\item{leg}{a logical option for legend to be plotted or not, default leg=T.}

\item{posi.leg}{setting legend positions with the following keywords "bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right" and "center", see \link[graphics]{legend} for more details.}

\item{bty.leg}{the type of box to be drawn around the legend. The allowed values are "o" (the default) and "n", see \link[graphics]{legend} for more details.}

\item{...}{further arguments passed to or from other methods.}
}
\description{
The function represents the species' niche NR position within the environmental space E.
}
\details{
The convex hulls measured is E is the environmental space.
The arrows represent the species' NR marginality from the origin G.
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
sigi <- rtest(nic1,10)
M <- length(sigi$pvalue)
plot_NR(subnic1, sig=sigi$pvalue[-M], sig_thres= 0.1)
}
