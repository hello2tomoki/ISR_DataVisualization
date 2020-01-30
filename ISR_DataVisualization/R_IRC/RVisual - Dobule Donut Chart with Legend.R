# Input load. Please do not change #
`dataset` = read.csv('C:/Users/exie/REditorWrapper_e940d9e5-45c2-4b42-9960-e2fbab14c5ad/input_df_e51d4034-31e0-4dc6-abfa-74a085ef7aa7.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
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
  theme(legend.position="right") + 
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(axis.ticks=element_blank())

ggplot(dataset) + 
  geom_bar(stat = "identity", width = 0.6, aes(x = 1, y = Inner/sum(Inner), fill = AssetClass)) +
  geom_bar(stat = "identity", width = 1.5, aes(x = 3, y = Outer/sum(Outer), fill = AssetClass)) +
 coord_polar(theta="y") + 
  blank_theme +
  xlim(c(0, 4)) +
  scale_fill_brewer(palette="Spectral") +
geom_text_repel(data = dataset, 
aes(x = 1.5, y = 1-(cumsum(Inner)/sum(Inner) + c(0, head(cumsum(Inner)/sum(Inner), n=-1)))/2, 
    label = paste(round(Inner*100, 2),"%"), fill = AssetClass),
label.padding = unit(0.05, "lines"),
show.legend = FALSE,
inherit.aes = FALSE, size = 3.5) +
geom_text_repel(data = dataset, 
aes(x = 4, y = 1-(cumsum(Outer)/sum(Outer) + c(0, head(cumsum(Outer)/sum(Outer), n=-1)))/2, 
    label = paste(round(Outer*100, 2),"%"), fill = AssetClass),
label.padding = unit(0.05, "lines"),
show.legend = FALSE,
inherit.aes = FALSE, size = 3.5) 

