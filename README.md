# project02

### course: stat 159
### authors: Shannon Chang and Nura Kawa
### data completed: November 4, 2016


## description
This project reproduces content from the book _Introduction to Statistical Learning_ by Hastie, Tibshirani, James, and Witten, which discusses four penalized regression algorithms, fits these models to data, and evaluates results. 

We use a dataset called `Advertising`, which the authors have made available publically online for purposes of reproduction: http://math480-s15-zarringhalam.wikispaces.umb.edu/file/detail/Advertising.csv/538578560.  

## license:
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.


## file structure:

code/  
+ scripts/  
  + regression-pcr.R  
  + regression-lasso.R  
  + regression-pls.R  
  + regression-ridge.R  
  + regression-ols.R  
+ functions/  
  + range-as-value.R  
+ tests/  
  + test-range-as-value.R  
  + test-that.R  
  
data/
+ regression/  
  +fit-pcr.RData  
  +fit-lasso.RData  
  +fit-pls.RData  
  +fit-ridge.RData  
  +fit-ols.RData  
+anova/
  +anova-all.txt  
  +anova-Ethnicity.txt  
  +anova-Gender.txt  
  +anova-Married.txt  
  +anova-Student.txt  
Credit.csv
Credit-scaled.csv
train-test.RData
eda-output.txt
eda-text-output.RData
prop-table-quals.RData
coefficient-matrix.csv
  
images/   
+ qualitative/
  + barcharts/
    + barchart-ethnicity.pdf  
    + barchart-ethnicity.png  
    + barchart-gender.pdf  
    + barchart-gender.png  
    + barchart-married.pdf  
    + barchart-married.png  
    + barchart-student.pdf  
    + barchart-student.png  
  + boxplots/  
    + conditional-boxplot-ethnicity.pdf  
    + conditional-boxplot-ethnicity.png
    + conditional-boxplot-gender.pdf  
    + conditional-boxplot-gender.png 
    + conditional-boxplot-married.pdf  
    + conditional-boxplot-married.png
    + conditional-boxplot-student.pdf  
    + conditional-boxplot-student.png  
+ quantiative/  
  + boxplots/  
    +  boxplot-age.pdf  
    +  boxplot-age.png  
    +  boxplot-balance.pdf  
    +  boxplot-balance.png  
    +  boxplot-cards.pdf  
    +  boxplot-cards.png  
    +  boxplot-education.pdf
    +  boxplot-education.png
    +  boxplot-income.pdf  
    +  boxplot-income.png  
    +  boxplot-limit.pdf  
    +  boxplot-limit.png
    +  boxplot-rating.pdf  
    +  boxplot-rating.png
  + histograms/   
    +  histogram-age.pdf  
    +  histogram-age.png  
    +  histogram-balance.pdf  
    +  histogram-balance.png  
    +  histogram-cards.pdf  
    +  histogram-cards.png  
    +  histogram-education.pdf
    +  histogram-education.png
    +  histogram-income.pdf  
    +  histogram-income.png  
    +  histogram-limit.pdf  
    +  histogram-limit.png
    +  histogram-rating.pdf  
    +  histogram-rating.png
+ regression-plots/  
  + lasso-plot.pdf
  + lasso-plot.png  
  + pcr-plot.pdf  
  + pcr-plot.png  
  + pls-plot.png      
  + pls-plot.pdf    
  + ridge-plot.pdf
  + ridge-plot.png  
bias-variance-tradeoff.png  
coefficient-plot.png  
pca-screeplot-bad.png  
pca-screeplot-good.png  
scatterplot-matrix.pdf  
scatterplot-matrix.png  
  
report/
+ 00-abstract.Rmd
+ 01-introduction.Rmd
+ 02-data.Rmd
+ 03-methods.Rmd
+ 04-analysis.Rmd
+ 05-results.Rmd
+ 06-conclusions.Rmd

gitignore
LICENSE
Makefile
README.md
session.sh
session-info.txt
