---
title       : Develop Data Products Project
subtitle    : Shiny Application Presentation
author      : Ji Gu
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
url:
  assets: ../../assets
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Structure of the dataset
The purpose is to examine relationships between numeric variables grouped by discrete variables in 'mtcars' dataset. The structure of the dataset is as follows 

```r
library(car);car<-mtcars;str(car)
```

```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

---

## Default configuration
There are several default configurations in the user input part of the shiny application
  * Numeric variables ('mpg','disp','hp','drat','wt'and 'qsec') for x-axis and y-axis selection
  * Discrete variable ('vs','am','gear','carb' and 'cyl') as factor variables to seperate data into different categories for coloring and corresponding smoothing
  * Default smoothing method selection is 'Regression line'
  * Default confidence level is set at 0.95
  * Default degree of smoothing (only for LOESS smoothing) is set at 0.75
  * Default setting for 'Display confidence interval around smooth?' is off
  * Degree of smoothing (only for LOESS) - default=0.75
  * Trend line confidence level - default =0.95
  * Dispaly confidence interval around smooth - default = off

---

## Smoothing method options available
Two smoothing methods can be selected to explore relationship between the numeric variables from 'mtcars' dataset
  * Locally weighted scatterplot smoothing (LOESS) as data size is <1000
  * Linear Regression  


---

## Sample plot (slight difference from Shiny application)
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

  Smoothing method='Regression line', Confidence level=0.95
 
  



