# Shiny Global File

# Packages
library(shiny)
library(MBSStools)
library(DT)
library(ggplot2)
library(plotly)

# Drop-down boxes
#MMIs <- c("BIBI_genus", "BIBI_family", "FIBI")
#MMIs <- c("BIBI_MBSS", "BIBI_MSW", "FIBI")
MMIs <- c("MBSS.2005.Fish", "MBSS.2005.Bugs", "MSW.1999.Bugs")
Community <- c("fish", "bugs", "bugs")

# File Size
# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 10MB.
options(shiny.maxRequestSize = 10*1024^2)

Metrics.Bugs.Scores.MBSS <- read.csv(file.path(getwd(), "Results", "Metrics.Bugs.Scores.MBSS.csv"))

Metrics.Fish.Scores <- read.csv(file.path(getwd(), "Results", "Metrics.Fish.Scores.csv"))


plot_BIBI <- ggplot(Metrics.Bugs.Scores.MBSS, aes(IBI), fill=STRATA_R, shape=STRATA_R) +
                    geom_dotplot(aes(fill=STRATA_R)) +
                    labs(x="BIBI") + geom_vline(xintercept = 3) +
                    scale_x_continuous(limits = c(1, 5)) +
                    scale_fill_discrete(name="STRATA", breaks=c("COASTAL", "EPIEDMONT", "HIGHLAND")) +
                    theme(axis.title.y=element_blank(), axis.ticks.y=element_blank(), axis.text.y=element_blank())

plot_FIBI <- ggplot(Metrics.Fish.Scores, aes(IBI), fill=FIBISTRATA, shape=FIBISTRATA) +
                    geom_dotplot(aes(fill=FIBISTRATA)) + #balks at bins=30
                    labs(x="FIBI") +
                    geom_vline(xintercept = 3) +
                    scale_x_continuous(limits = c(1, 5)) +
                    scale_fill_discrete(name="STRATA", breaks=c("COASTAL", "EPIEDMONT", "HIGHLAND", "COLD")) +
                    theme(axis.title.y=element_blank(), axis.ticks.y=element_blank(), axis.text.y=element_blank())





