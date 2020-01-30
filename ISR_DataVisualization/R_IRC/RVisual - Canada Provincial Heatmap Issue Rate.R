# Input load. Please do not change #

`dataset` = read.csv('C:/Users/exie/REditorWrapper_4df25e84-c300-4618-85b4-bbc5019d10fd/input_df_d73baa4c-9e80-4ef3-a35e-530c8ae7a566.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
# Original Script. Please update your script content here and once completed copy below section back to the original editing window #
colnames(dataset) <- c("Provincial", "Issue.Rate")
rownames(dataset) <- dataset$Provincial
issueRate <- data.frame(issueRate = 100 * dataset$Issue.Rate )
row.names(issueRate) <- dataset$Provincial

library(raster)

provinces <- c("British Columbia", "Alberta", "Saskatchewan", "Manitoba", "Ontario", "Québec")

canada <- getData("GADM",country="CAN",level=1)
ca.province <- canada[canada$NAME_1 %in% provinces, ]

#Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c('white','darkgreen'))
varRange <- max(issueRate$issueRate) - min(issueRate$issueRate)
issueRate$issueRateScale <- (issueRate$issueRate - min(issueRate$issueRate) + varRange * 0.1)/(varRange/0.7)
issueRate$color <- rbPal(100)[c(round(issueRate$issueRateScale * 100))]

#plot

plot(ca.province, main = 'Provincial - BCI % of issue')
plot(ca.province[ca.province$NAME_1 == "British Columbia", ], border="white", col=issueRate["BC", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Alberta", ], border="white", col=issueRate["AB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Saskatchewan", ], border="white", col=issueRate["SK", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Manitoba", ], border="white", col=issueRate["MB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Ontario", ], border="white", col=issueRate["ON", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Québec", ], border="white", col=issueRate["QC", "color"], add=TRUE)

text(ca.province[ca.province$NAME_1 == "British Columbia", ], labels = paste("BC", "\n", round(issueRate["BC", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Alberta", ], labels = paste("AB", "\n", round(issueRate["AB", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Saskatchewan", ], labels = paste("SK", "\n", round(issueRate["SK", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Manitoba", ], labels = paste("MB", "\n", round(issueRate["MB", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Ontario", ], labels = paste("ON", "\n", round(issueRate["ON", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Québec", ], labels = paste("QC", "\n", round(issueRate["QC", "issueRate"], 2),"%"))


