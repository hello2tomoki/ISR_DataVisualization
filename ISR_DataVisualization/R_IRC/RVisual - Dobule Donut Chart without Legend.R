# Input load. Please do not change #
`dataset` = read.csv('C:/Users/exie/REditorWrapper_e213651b-a536-4eb6-99fd-7b1e2b13bd18/input_df_0be86a39-445c-4e5e-ad39-586f78f8e0ad.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
# Original Script. Please update your script content here and once completed copy below section back to the original editing window #
library(ggplot2)
library(ggrepel)

colnames(dataset) <- c(colnames(dataset)[1], "Inner", "Outer")

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_blank()) +
  theme(axis.text.x=element_blank()) + 
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(axis.ticks=element_blank())

ggplot(dataset) + 
  geom_bar(stat = "identity", width = 0.6, aes(x = 1, y = Inner/sum(Inner), fill = AssetClass)) +
  geom_bar(stat = "identity", width = 1.5, aes(x = 3, y = Outer/sum(Outer), fill = AssetClass)) +
 coord_polar(theta="y") + 
  blank_theme +
 guides(fill=FALSE) +
  xlim(c(0, 5)) +
  scale_fill_brewer(palette="Spectral") +
geom_text_repel(data = dataset, 
aes(x = 1.5, y = 1-(cumsum(Inner)/sum(Inner) + c(0, head(cumsum(Inner)/sum(Inner), n=-1)))/2, 
    label = paste(round(Inner*100, 2),"%"), fill = AssetClass),
label.padding = unit(0.1, "lines"),
show.legend = FALSE,
inherit.aes = FALSE,size = 3.5) +
geom_text_repel(data = dataset, 
aes(x = 4.5, y = 1-(cumsum(Outer)/sum(Outer) + c(0, head(cumsum(Outer)/sum(Outer), n=-1)))/2, 
    label = paste(AssetClass, "\n", round(Outer*100, 2),"%"), fill = AssetClass),
label.padding = unit(0.05, "lines"),
show.legend = FALSE,
inherit.aes = FALSE,size = 3.5) 

