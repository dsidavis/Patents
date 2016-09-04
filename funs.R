getTars = 
function(u) {
          doc = htmlParse(getURLContent(u, followlocation = TRUE), asText = TRUE)
	  ll = grep("(ZIP|zip|tar)$", getHTMLLinks(doc), value = TRUE)

	  if(!grepl("/$", u))
	     u = paste0(u, "/")
#          getRelativeURL(ll, u)
	   sprintf("%s%s", u, ll)
}
