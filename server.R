library(shiny)
library(ggplot2)
library(car)

car=mtcars
car$am<-factor(car$am)
car$cyl<-factor(car$cyl)
car$vs<-factor(car$vs)
car$gear<-factor(car$gear)
car$carb<-factor(car$carb)
shinyServer(
  function(input,output){
   method<-reactive({
     input$smoothoption
   })
   
    output$plot1<-renderPlot({
      if(input$scattercolor!='.')
        p<-ggplot(car,aes_string(x=input$scatterxcol,y=input$scatterycol,color=input$scattercolor))+geom_point(size=3)+ggtitle(paste(input$scatterycol," vs ",input$scatterxcol," color by ",input$scattercolor," : smooth method ",method()))

      if(input$scattercolor=='.')
        p<-ggplot(car,aes_string(x=input$scatterxcol,y=input$scatterycol))+geom_point(size=3)+ggtitle(paste(input$scatterycol," vs ",input$scatterxcol," : smooth method ",method()))
    p<-p+stat_smooth(method=input$smoothoption,formula=y~x, 
                     span=input$Deg_smooth,level=as.numeric
                     (input$confi_select),se=input$seoption)
   print(p)
    },height=500)
  }
)