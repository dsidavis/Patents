library(RCurl)
library(XML)
source("funs.R")

top = "https://bulkdata.uspto.gov/"

txt = getURLContent(top)
doc = htmlParse(txt, asText = TRUE)

ll = getHTMLLinks(doc)

rb = grep("grant/redbook/[0-9]{4}$", ll, value = TRUE)


tars = lapply(rb, function(x) try(getTars(x)))

byExt = split(unlist(tars), gsub(".*\\.", "", unlist(tars)))
eg = sapply(byExt, sample, 1)

sapply(sprintf("wget %s", eg), system) 

