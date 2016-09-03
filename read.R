# xmlParse("filename") fails.
system.time({txt = readLines("ipg160726.xml")})
# 36 seconds

#txt1 = txt[-2]

#txt2 = paste(txt1, collapse = "\n")

# 10-15 seconds


# The ipg comes from Patent Grant Full Text Data/
# It is a file that contains multiple top-level XML documents so it is not a valid XML
# document. We have to break them up so we grep for <?xml...?> and then group the lines in between.

w = grepl("^<\\?xml .*\\?>$", txt)
docs.txt = split(txt, cumsum(w))

docs = lapply(docs.txt, function(x) xmlParse(paste(x, collapse = "\n"), asText = TRUE))


