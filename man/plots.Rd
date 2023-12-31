\name{plots}
\docType{methods}
\alias{SignPlot}
\alias{SignHeat}
\alias{Paths}
\alias{ExposureBoxplot}
\alias{BICboxplot}
\alias{ExposureHeat}
\alias{ExposureBarplot}
\alias{Paths,SignExp-method}
\alias{SignPlot,SignExp-method}
\alias{SignHeat,SignExp-method}
\alias{ExposureBoxplot,SignExp-method}
\alias{ExposureHeat,SignExp-method}
\alias{ExposureBarplot,SignExp-method}

\title{signeR plot functions}

\description{
    BICboxplot: Plot the measured values of the Bayesian Information
        Criterion (BICs) for tested model dimensions.\cr

    Paths: Plot the convergence of the Gibbs sampler for signatures and
        exposures on separate charts.\cr

    SignPlot: Plot the mutational signatures in a bar chart, with error bars 
        according to the variation of individual entries along the generated
        Gibbs samples.\cr

    SignHeat: Plot the mutation signatures in a heatmap.\cr

    ExposureBarplot: Barplot of estimated exposure values, showing the
        contribution of the signatures to the mutation counts of each genome
        sample.\cr

    ExposureBoxplot: Boxplot of exposure values, showing their variation
        along the generated Gibbs samples.\cr
        
    ExposureHeat: Plot a heatmap of the exposures, along with a dendrogram 
        of the samples grouped by exposure levels. 
}

\usage{
BICboxplot(signeRout, plot_to_file=FALSE, file="Model_selection_BICs.pdf")
\S4method{Paths}{SignExp}(signexp_obj, plot_to_file=FALSE,
    file_suffix="plot.pdf", plots_per_page=4, ...)
\S4method{SignPlot}{SignExp}(signexp_obj, plot_to_file=FALSE,
    file="Signature_plot.pdf", pal="bcr1", threshold=0, plots_per_page=4,
    gap=1, reord=NA, ...)
\S4method{SignHeat}{SignExp}(signexp_obj, plot_to_file=FALSE,
    file="Signature_heatmap.pdf", nbins=50, pal="roh", ...)
\S4method{ExposureBarplot}{SignExp}(signexp_obj, plot_to_file=FALSE,
    file="Exposure_barplot.pdf", col='tan2', threshold=0, relative=FALSE,
    title="", show_samples=NA, ...)
\S4method{ExposureBoxplot}{SignExp}(signexp_obj, plot_to_file=FALSE,
    file="Exposure_boxplot.pdf", col='tan2', threshold=0, show_samples=NA,
    plots_per_page=4, reord=NA, ...)
\S4method{ExposureHeat}{SignExp}(signexp_obj, plot_to_file=FALSE,
    file="Exposure_heatmap.pdf", nbins=50, pal="roh", distmethod="euclidean",
        clustermethod="complete", show_samples=NA, ...)
}

\arguments{
    \item{signexp_obj}{A SignExp object returned by signeR function.
    e.g.: sig$SignExposures}
    \item{signeRout}{The list returned by the signeR function.}
    \item{plot_to_file}{Whether to save the plot to the file parameter.
    Default is FALSE.}
    \item{file}{Output pdf file of the plots.}
    \item{pal}{Color palette used. Options are: "brew","lba","bcr1",
          "bcr2","bw","rdh","roh","blh" or "bph".}
    \item{threshold}{Entries below this value will be rounded to 0. Default
    is 0 (all entries are kept).}
    \item{plots_per_page}{How many plots in a single page, default is 4.}
    \item{gap}{Distance between consecutive bars on the plot.}
    \item{reord}{Order of signatures for plotting. Should be a permutation of
    1:nsig, where nsig is the number of signatures. By default, signatures are
    ordered by the total exposure, in decreasing order.}
    \item{nbins}{The range of signature entries is divided into this number of
    bins for plotting, each bin corresponding to a different color.}
    \item{file_suffix}{The suffix of the output file.}
    \item{col}{Single color name for boxplots.}
    \item{distmethod}{Distance measure used for grouping samples. Default is 
    "euclidean", see the documentation of the dist function for other options.}
    \item{clustermethod}{Agglomeration method used for grouping samples. Default
    is "complete", see the documentation of the hclust function for other
    options.}
    \item{relative}{Whether to normalize exposures of each sample so that they
    sum up to one. Default is FALSE, thus generating a plot of absolute
    contributions of signatures to mutation counts. Otherwise, relative
    contributions will be displayed.}
    \item{title}{Main title added to the plot. Default is no title.}
    \item{show_samples}{Whether sample names will be shown in the plot.
    Default is NA, which leads to sample names being displayed only when there 
    are less than 30 samples. However, even if show_samples=TRUE, due to display 
    limitations sample names are not shown if there are more than 50 samples.}
    \item{...}{.}
}

\value{ The plot result is exported to the current graphic device. If 
plot_to_file=TRUE, the plot is saved in the file defined by the file argument.
}

\examples{
\dontshow{
    # mock data
    mut <- rmultinom(96, 50, 1:4)
    signatures <- signeR(M=mut, Mheader=FALSE, nsig=1, EMit_lim=10, EM_eval=10, main_eval=10, main_burn=10)
}

# each plot function needs the SignExposures object
# which is part of the result of the signeR() call
SignPlot(signatures$SignExposures)
Paths(signatures$SignExposures)
# etc ...

# BICboxplot needs the returned list itself
BICboxplot(signatures)

# see also
vignette(package="signeR")
}

