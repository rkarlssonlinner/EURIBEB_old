#!/bin/bash

##Code to install EasyQC on Cartesius
##You can run the following code from any of your directories

module load c/intel
module load fortran/intel
module load R

##Create folder suggested by Surfsara.nl to store R packages in
mkdir $HOME/rpackages
export R_LIBS=$HOME/rpackages:$R_LIBS

##Install dependencies
#Package Cairo
wget https://cran.r-project.org/src/contrib/Cairo_1.5-9.tar.gz
R CMD INSTALL -l $HOME/rpackages Cairo_1.5-9.tar.gz
#Package data.table
wget https://cran.r-project.org/src/contrib/data.table_1.9.6.tar.gz
R CMD INSTALL -l $HOME/rpackages/data.table_1.9.6.tar.gz

##Install EasyQC
wget http://homepages.uni-regensburg.de/~wit59712/easyqc/EasyQC_9.2.tar.gz
R CMD INSTALL -l $HOME/rpackages/EasyQC_9.2.tar.gz

##Remember that your SBATCH (previously qsub) needs a direction to R_LIBS
#module load R
#export R_LIBS=$HOME/rpackages:$R_LIBS
#R --no-save << EOF
#setwd("<insert path WD>")
#library(EasyQC)
#EasyQC("<insert path .ecf file>")
#EOF
