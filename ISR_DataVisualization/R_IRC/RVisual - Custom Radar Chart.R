# Input load. Please do not change #
`dataset` = read.csv('C:/Users/tmiwa/Source/Repos/InsightPOC/ISR_DataVisualization/R_IRC/Data/Data - RVisual - Custom Radar Chart.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
# Original Script. Please update your script content here and once completed copy below section back to the original editing window #

#rename to run in R
names(dataset)[names(dataset) == "Scale Direction"] <- "Scale.Direction"

#loading packages
if(!require('plotly')) install.packages('plotly')
if(!require('dplyr')) install.packages('dplyr')
if(!require('ggplot2')) install.packages('ggplot2')
library(plotly)
library(dplyr)
library(ggplot2)

####=========== 
#   Function
####=========== 

CalculateGroupPath <- function(df) {
  angles = seq(from=0, to=2*pi, by=(2*pi)/(ncol(df)-1)) # find increment
  xx<-c(rbind(t(plot.data.offset[,-1])*sin(angles[-ncol(df)]),t(plot.data.offset[,2])*sin(angles[1])))
  yy<-c(rbind(t(plot.data.offset[,-1])*cos(angles[-ncol(df)]),t(plot.data.offset[,2])*cos(angles[1])))
  graphData<-data.frame(group=rep(df[,1],each=ncol(df)),x=(xx),y=(yy))
  return(graphData)
}

CalculateAxisPath <- function(var.names,min,max) {
  n<-length(var.names)
  #Cacluate required number of angles (in radians)
  angles <- seq(from=0, to=2*pi, by=(2*pi)/n)
  #calculate vectors of min and max x+y coords
  min.x <- min*sin(angles)
  min.y <- min*cos(angles)
  max.x <- max*sin(angles)
  max.y <- max*cos(angles)
  tmp<-lapply(1:n,function(i) matrix(c(i,i,min.x[i],max.x[i],min.y[i],max.y[i]),2,3))
  res<-as.data.frame(do.call(rbind,tmp))
  colnames(res) <- c("axis.no","x","y")
  return(res)
}

funcCircleCoords <- function(center = centre.y, r = 1, npoints = ncol(plot.data)){
  #Adapted from Joran's response to http://stackoverflow.com/questions/6862742/draw-a-circle-with-ggplot2
  tt <- seq(0,2*pi,length.out = npoints)
  yy <- center + r * cos(tt)
  xx <- center + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

####=========== 
#   1 Axis Grid
####=========== 

grid.data <- dataset[, c("Axis", "Scale.Direction", "Min", "Max") ]

grid.min=0  
grid.mid=0.5
grid.max=1 
centre.y=grid.min - ((1/9)*(grid.max-grid.min))
axis.label.offset=1.15

## 1.1 Calculate the data frame for the axis-lines
grid <- NULL
grid$axis_path  <- CalculateAxisPath(grid.data$Axis,grid.min,grid.max+abs(centre.y))

n.grid <- nrow(grid.data)

## 1.2 Calculate the coordinates for the axis labels
grid$axis_label <-funcCircleCoords(0,(grid.max+abs(centre.y))*axis.label.offset, n.grid + 1)
grid$axis_label$text <- c(as.character(grid.data$Axis), "")


## 1.3 Calculate the grid-lines
r<-seq(0,1,0.25) ## Radius of the gridlines
grid$lines <- lapply(1:length(r),function(i) funcCircleCoords(0,r[i]+abs(centre.y), n.grid + 1))
names(grid$lines)<-paste("q",r*100,sep='')


## 1.4 Add the real values to the gridlines
qdata <- NULL
for (i in 1:n.grid) {
  min <- grid.data$Min[i]
  max <- grid.data$Max[i]
  if (grid.data[i, 2]  == "Increasing") {
    qval <- min + r*(max-min)
  }
  if (grid.data[i, 2]  == "Decreasing") {
    qval <- max - r*(max-min)
  }
  qdata <- cbind(qdata, qval)
}
rownames(qdata) <- names(grid$lines)
colnames(qdata) <- grid.data$Axis.Name
qdata <- cbind(qdata,qdata[,1])
colnames(qdata) <- c(colnames(qdata)[1:n.grid], colnames(qdata)[1])

grid$lines<-lapply(1:length(grid$lines),function(j) 
  cbind(grid$lines[[j]],values=round(qdata[names(grid$lines[j]),],3)))
names(grid$lines) <- rownames(qdata)


## 1.5 Bind all the grid-lines in one data.frame
grid$all_lines<-do.call(rbind,grid$lines)
n<-nrow(grid$all_lines)/length(grid$lines)        # n 
grid$all_lines$q <- rep(names(grid$lines), each=n)  # The quantiles of each grid


## 1.6 Create a data without 0 and 100 % Quantile to plot all grid-lines at once
myrows<-which(grid$all_lines$q%in%names(grid$lines)[-c(1,length(grid$lines))]) # Select all quantiles except q0 & q100
grid$inner_lines<-grid$all_lines[myrows,] # create df of the inner grid values


####=========== 
#   2 Axis Grid Plot
####=========== 

## 2.1  Create an empty theme for ggplot
theme_clear <- theme_bw(base_size=20) + 
  theme(axis.text.y=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        panel.border=element_blank(),
        legend.key=element_rect(linetype="blank"))


## 2.2 Set the extent of the plot and the colors of the grid
centre.y=grid.min - ((1/9)*(grid.max-grid.min))
plot.extent.x.sf=1.2
plot.extent.y.sf=1.2
plot.extent.x=(grid.max+abs(centre.y))*plot.extent.x.sf
plot.extent.y=(grid.max+abs(centre.y))*plot.extent.y.sf
bg_colors<-c(RColorBrewer::brewer.pal(9,'Blues')[1],RColorBrewer::brewer.pal(9,'Blues')[2]) # Set the grid colors


## 2.3. Set up a basic empty gg-object
basething <- ggplot() + xlab(NULL) + ylab(NULL) + coord_fixed() +
  scale_x_continuous(limits=c(-plot.extent.x,plot.extent.x)) + 
  scale_y_continuous(limits=c(-plot.extent.y,plot.extent.y)) + 
  theme_clear 


## 2.4 Add the gridlines
base_grid<-basething+geom_polygon(data=grid$all_lines[nrow(grid$all_lines):1,],aes(x,y,group=rev(q)),
                                  fill=c(rep(rep(rev(bg_colors),2),each=n),rep('white',n)))+
  geom_polygon(data=grid$lines$q0,aes(x,y),fill="white")+
  geom_path(data=grid$axis_path,aes(x=x,y=y,group=axis.no),
            colour="grey",alpha=0.4)


## 2.5 Add text to gg-object
base_text<-base_grid+geom_text(data=grid$all_lines,aes(x,y,label=values),size=3)+
  geom_text(data=grid$axis_label,aes(x,y,label=text), size = 5)
#base_text


####=========== 
#    Data
####=========== 

## 3.1 data

input.data <- dataset[, !(names(dataset) %in% c("Axis", "Scale.Direction", "Min", "Max"))]
input.data <- t(input.data)

colnames(input.data) <- dataset$Axis
rownames(input.data) <- names(dataset)[!names(dataset) %in% c("Axis", "Scale.Direction", "Min", "Max")]
ngroup <- nrow(input.data)

## 3.2 Create vector with all KPI/variable names; Set up the data for plotting 
#plot.data <- input.data[,1]
plot.data <- NULL
for (i in 1:ncol(input.data)) {
  
  min <- grid.data$Min[i]
  max <- grid.data$Max[i]
  
  if(grid.data[i, 2] == "Increasing") {
    plotvar <- (input.data[, i] - min) / (max - min)
  }
  if(grid.data[i, 2] == "Decreasing") {
    plotvar <- (max - input.data[, i]) / (max - min)
  }
  plot.data <- cbind(plot.data, plotvar)
  
}
plot.data <- as.data.frame(plot.data)
#plot.data <- cbind(input.data[,1], plot.data)
colnames(plot.data) <- colnames(input.data)
rownames(plot.data) <- rownames(input.data)
input.hover <- cbind(input.data, input.data[,1])
colnames(input.hover) <- c(colnames(input.data), colnames(input.data)[1])

plot.data.offset <- as.data.frame(plot.data)
plot.data.offset <- cbind(rownames(plot.data), plot.data.offset)
plot.data.offset[, -1] <- plot.data.offset[, -1] + abs(centre.y)

## 3.3 Calculate the x and y coordinates for our data
xy_lines <- CalculateGroupPath(plot.data.offset)
xy_lines$annot<-  c(t(input.hover))
xy_lines$text <-  paste(paste(rep(colnames(input.hover),nrow(input.data)),xy_lines$annot,sep=": "),'<br />')


## 3.4 Add observation lines to gg-object
gg<-base_text+geom_path(data=xy_lines,aes(x=x,y=y,group=group, color=group),alpha=0.5,size=1) + theme(legend.title=element_blank())
gg


