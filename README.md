# project02

### course: stat 159
### authors: Shannon Chang and Nura Kawa
### data completed: November 4, 2016


## description
This project reproduces content from the book _Introduction to Statistical Learning_ by Hastie, Tibshirani, James, and Witten, which discusses four penalized regression algorithms, fits these models to data, and evaluates results. 

We use a dataset called `Advertising`, which the authors have made available publically online for purposes of reproduction: http://math480-s15-zarringhalam.wikispaces.umb.edu/file/detail/Advertising.csv/538578560.  

## instructions for reproduction 
To recreate the analysis detailed throughout this project, clone this repository to a local directory. Enter `make` in bash to execute the Makefile and subsequent commands for reproducing our work.

## Make commands for phony targets
Download Credit.csv  
data :  
  cd data; curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv >> Credit.csv  
  
Execute unit tests on regression functions  
tests:     
  cd code/tests; Rscript -e 'source("test-that.R")'  
  
Perform exploratory data analysis  
eda :   
  cd code/scripts; Rscript -e 'source("eda-images.R")'  
  cd code/scripts; Rscript -e 'source("eda-text.R")'  
  
Execute OLS regression analysis  
ols:   
  cd code/scripts; Rscript -e 'source("regression-ols.R")'  
  
Execute ridge regression analysis  
ridge:   
  cd code/scripts; Rscript -e 'source("regression-ridge.R")'  
  
Execute least absolute shrinkage and selection operator regression analysis  
lasso:   
  cd code/scripts; Rscript -e 'source("regression-lasso.R")'  
  
Execute principal components regression analysis  
pcr:   
  cd code/scripts; Rscript -e 'source("regression-pcr.R")'  
  
Execute partial least squares regression analysis  
plsr:   
  cd code/scripts; Rscript -e 'source("regression-pls.R")'  
  
Compile report.pdf file  
report:  
  cd report; Rscript -e "library(rmarkdown); render('report.Rmd', 'pdf_document')"  
  
Generate slides.html file  
slides:  
  cd slides; Rscript -e "library(rmarkdown); render('slides.Rmd', 'ioslides_presentation')"  
  
Clean output file  
clean:  
  cd report; rm -f report.pdf  
  
Generate session information text file  
session:  
  bash session.sh  
  
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
  + fit-pcr.RData  
  + fit-lasso.RData  
  + fit-pls.RData  
  + fit-ridge.RData  
  + fit-pcr.txt  
  + fit-lasso.txt  
  + fit-pls.txt  
  + fit-ridge.txt  
  + fit-ols.RData  
+ anova/  
  + anova-all.txt  
  + anova-Ethnicity.txt  
  + anova-Gender.txt  
  + anova-Married.txt  
  + anova-Student.txt   
  
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
ISLR-book.png
  
report/
+ 00-abstract.Rmd
+ 01-introduction.Rmd
+ 02-data.Rmd
+ 03-methods.Rmd
+ 04-analysis.Rmd
+ 05-results.Rmd
+ 06-conclusions.Rmd

slides/  
+ slides.Rmd  
+ slides.html  

gitignore  
LICENSE  
Makefile   
README.md  
session.sh  
session-info.txt  
