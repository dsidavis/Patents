library(RCurl)
top = "https://bulkdata.uspto.gov/"

txt = getURLContent(top)
doc = htmlParse(txt, asText = TRUE)

ll = getHTMLLinks(doc)

rb = grep("grant/redbook/[0-9]{4}$", ll, value = TRUE)

sapply(sprintf("wget %s", rb), system) 

