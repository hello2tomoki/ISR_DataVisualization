# Input load. Please do not change #
`dataset` = read.csv('C:/Users/exie/REditorWrapper_5fb47ad9-4072-47fb-9fd6-37a732076dea/input_df_f818303f-0134-42a6-b19c-faa8b4cfa399.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
# Original Script. Please update your script content here and once completed copy below section back to the original editing window #
colnames(dataset) <- c("Provincial", "Debit.Issuance")
rownames(dataset) <- dataset$Provincial
debitIssue <- data.frame(debitIssue= dataset$Debit.Issuance )
#debitIssue$debitIssue <- as.numeric(debitIssue$debitIssue)
row.names(debitIssue) <- dataset$Provincial

library(raster)

provinces <- c("British Columbia", "Alberta", "Saskatchewan", "Manitoba", "Ontario", "Québec")

canada <- getData("GADM",country="CAN",level=1)
ca.province <- canada[canada$NAME_1 %in% provinces, ]

#Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c('white','steelblue4'))
varRange <- max(debitIssue$debitIssue) - min(debitIssue$debitIssue)
debitIssue$debitIssueScale<- (debitIssue$debitIssue- min(debitIssue$debitIssue) + varRange * 0.1)/(varRange/0.7)
debitIssue$color <- rbPal(100)[c(round(debitIssue$debitIssueScale* 100))]

#plot

plot(ca.province, main = 'Provincial - Debt issuance(M$)')
plot(ca.province[ca.province$NAME_1 == "British Columbia", ], border="white", col=debitIssue["BC", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Alberta", ], border="white", col=debitIssue["AB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Saskatchewan", ], border="white", col=debitIssue["SK", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Manitoba", ], border="white", col=debitIssue["MB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Ontario", ], border="white", col=debitIssue["ON", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Québec", ], border="white", col=debitIssue["QC", "color"], add=TRUE)

text(ca.province[ca.province$NAME_1 == "British Columbia", ], labels = paste("BC", "\n", debitIssue["BC", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Alberta", ], labels = paste("AB", "\n", debitIssue["AB", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Saskatchewan", ], labels = paste("SK", "\n", debitIssue["SK", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Manitoba", ], labels = paste("MB", "\n", debitIssue["MB", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Ontario", ], labels = paste("ON", "\n", debitIssue["ON", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Québec", ], labels = paste("QC", "\n", debitIssue["QC", "debitIssue"]))
     
     
