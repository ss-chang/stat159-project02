# Declare phony target
.PHONY: all data eda ols ridge lasso pcr plsr regressions report slides session clean

# all	
all: eda regressions report 

# Complete regression analysis
regressions:
    make ols
    make ridge
    make lasso
    make pcr
    make plsr





# Download Credit.csv
data : 
	cd data; curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv >> Credit.csv

# Perform exploratory data analysis
eda : 
	cd code/scripts; Rscript -e 'source("eda-images.R")'
	cd code/scripts; Rscript -e 'source("eda-text.R")'

# Execute OLS regression analysis
ols: 
	cd code/scripts; Rscript -e 'source("regression-ols.R")'

# Execute ridge regression analysis
ridge: 
	cd code/scripts; Rscript -e 'source("regression-ridge.R")'

# Execute least absolute shrinkage and selection operator regression analysis
lasso: 
	cd code/scripts; Rscript -e 'source("regression-lasso.R")'

# Execute principal components regression analysis
pcr: 
	cd code/scripts; Rscript -e 'source("regression-pcr.R")'

# Execute partial least squares regression analysis
plsr: 
	cd code/scripts; Rscript -e 'source("regression-pls.R")'

# Generate report.pdf file
report:
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd', 'pdf_document')"

# Generate slides.html file


# Clean output file
clean:
	cd report; rm -f report.pdf

# Generate session information text file
session:
    bash session.sh