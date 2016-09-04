# A script to retrieve all of the links for the  Full text and TIFF links
# This a two step operation.
# The front page lists a collection of pages for these.
# Each of these pages gives a list of the actual files.

library(RCurl)
library(XML)
source("funs.R")

top = "https://bulkdata.uspto.gov/"

txt = getURLContent(top)
doc = htmlParse(txt, asText = TRUE)

ll = getHTMLLinks(doc)

rb = grep("grant/redbook/[0-9]{4}$", ll, value = TRUE)


tars = lapply(rb, function(x) try(getTars(x)))

n = sapply(tars, length)
sum(n)


if(FALSE) {
# Sample by extension to download and take a look at one for each extension.
byExt = split(unlist(tars), gsub(".*\\.", "", unlist(tars)))
eg = sapply(byExt, sample, 1)

sapply(sprintf("wget %s", eg), system) 
}



