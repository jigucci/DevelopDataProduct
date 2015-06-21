library(shiny)
library(ggplot2)
library(car)
car<-mtcars
shinyUI(pageWithSidebar(
  headerPanel('Dataset \'mtcars\' explorer'),
  sidebarPanel(
    selectInput('scatterxcol', 'Choose an X Variable:', 
                c('mpg','disp','hp','drat','wt','qsec')),
    selectInput('scatterycol', 'Choose a Y Variable:', 
                c('mpg','disp','hp','drat','wt','qsec')),
    selectInput('scattercolor', 'Color by discrete variable',
                c(None='.','vs','am','gear','carb','cyl')),
    hr(),
    radioButtons('smoothoption','Choose smoothing method',
                 c("LOESS - locally weighted scatterplot smoothing"=
                     "loess","Regression line"="lm"),selected="lm"),
    sliderInput("Deg_smooth","Choose degree of smoothing (only for 
                LOESS) - default=0.75",min=0.1,max=2.0,value=.75,
                step=0.05),
    hr(),
    h4('Confidence Level Configuration (all models):'),
    tags$br(),
    checkboxInput('seoption','Display confidence interval around 
                  smooth?',FALSE),
    radioButtons("confi_select","Choose trend line confidence level",
                 c("0.10" = .1, "0.50" = 0.5,"0.90" = 0.9, "0.95" = 
                     0.95,"0.975" = 0.975,"0.99" = 0.99, "0.999" = 
                     0.999),selected = 0.95)
   
    
  ),
  mainPanel(
    h4('Getting Started with this Web App'),
    p('The plot below intends to help examine the relationships between numeric variables grouped by discrete variables in \'mtcars\' dataset. On the side panel you can change the variables that are injected to the plot (from ggplot2 library). You can change which variable go to the X-axis, Y-axis, color by variable. In addition, two smoothing methods options are available with additional parameters\' selection such as confidence level. Detailed definition of the abbreviations are below the plot.'),
    
    plotOutput('plot1'),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br(),
    
    tags$br(),
    p('*** Details of the abbreviations ***'),
    p('1. mpg  - Miles/(US) gallon 2. cyl  -	Number of cylinders 3. disp - Displacement (cu.in.)'),
    p('4. hp   - Gross horsepower 5. drat -	Rear axle ratio 6. wt	  - Weight (lb/1000)'),
    p('7. qsec	- 1/4 mile time 8. vs - V-engine or straight engine (0 = V-engine, 1 = straight engine)'),
    p('9. am - Transmission (0 = automatic, 1 = manual) 10. gear - Number of forward gears'),
    p('11. carb - Number of carburetors')
  
)
))