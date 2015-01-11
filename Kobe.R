install_github("hadley/devtools")
install_github("ririzarr/rafalib")
library(rafalib)
install.packages("XML")
library(XML)
YLIM <- c(-0.25,0.32)
mypar2(1,2, cex.lab = 1.5, cex.main = 1.5, cex.axis = 1.25,mar = c(3.5, 3.5, 1.6, 1.1))
layout(matrix(c(1,2), 1, 2),widths=c(3,2))
theurl="http://en.wikipedia.org/wiki/List_of_Los_Angeles_Lakers_seasons"
tab <- readHTMLTable(theurl)[[3]]
year <- as.numeric(sapply(as.character(tab[,1]),substring,first=1,last=4))
ind <- which(year>=1996 & year<=2013)
wl <- apply(tab[ind,c(6,7)],2,as.numeric)
year <- year[ind]
wl <- rbind(wl,c(6,16))
year <- c(year,2014)
pct <- wl[,1]/(wl[,1]+wl[,2]) - .5
cols <- rep("black",length(year))
cols[year>=1996 & year <=2003] <- "blue"
cols[year>=2007 & year <= 2011] <- "purple"
plot(year,pct,col=cols,ylab="Percent above 500",xlab="Year",type="h",lwd=10,main="Lakers",ylim=YLIM)
abline(h=0,lwd=5)
legend("bottomleft",c("with Shaq","with Gasol/Bynum"),col=c("blue","purple"),lty=1,lwd=5,cex=1.5)

##Lebron
par(mar = c(3.5, 1.5, 1.6, 1.1))
theurl="http://en.wikipedia.org/wiki/List_of_Cleveland_Cavaliers_seasons"
tab <- readHTMLTable(theurl)[[2]]
year <- as.numeric(sapply(as.character(tab[,1]),substring,first=1,last=4))
ind <- which(year>=2003 & year<=2009)
wl <- apply(tab[ind,c(6,7)],2,as.numeric)
theurl="http://en.wikipedia.org/wiki/List_of_Miami_Heat_seasons"
tab <- readHTMLTable(theurl)[[3]]
year <- as.numeric(sapply(as.character(tab[,1]),substring,first=1,last=4))
ind <- which(year>=2010 & year<=2013)
wl <- rbind(wl,apply(tab[ind,c(6,7)],2,as.numeric),c(13,7))
pct <- wl[,1]/(wl[,1]+wl[,2]) - .5
cols <- rep("blue",length(year))
year <- 2003:2014
cols[year>=2010 & year <= 2013] <- "red"
plot(year,pct,col=cols,ylab="",xlab="Year",type="h",lwd=10,ylim=YLIM,main="Lebron")
abline(h=0,lwd=5)
legend("bottomleft",c("Cavs","Heat"),col=c("blue","red"),lty=1,lwd=5,cex=1.5)

