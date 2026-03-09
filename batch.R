# -----------------------------------------------
# PAF514 Final Project - Part III
# batch.R
# Run this file in the R console (NOT the knit button)
# It will generate one HTML salary report per year.
# -----------------------------------------------

library(rmarkdown)

# Set your working directory to wherever your project files are stored
# setwd("path/to/your/project/folder")

# -----------------------------------------------
# BUILD URL HELPER
# -----------------------------------------------

KEY <- "1RoiO9bfpbXowprWdZrgtYXG9_WuK3NFemwlvDGdym7E"

build_url <- function(GID) {
  paste0("https://docs.google.com/spreadsheets/d/", KEY, "/export?gid=", GID, "&format=csv")
}

# -----------------------------------------------
# YEAR-SPECIFIC URLs
# -----------------------------------------------

url.2020 <- build_url("1335284952")
url.2019 <- build_url("1948400967")
url.2018 <- build_url("169937930")
url.2017 <- build_url("1505080523")
url.2016 <- build_url("873598574")

# -----------------------------------------------
# RENDER REPORTS
# -----------------------------------------------

## 2020 REPORT
rmarkdown::render(input       = "salary-report.rmd",
                  output_file = "ASU-2020-Salary-Report.HTML",
                  params      = list(url = url.2020))

## 2019 REPORT
rmarkdown::render(input       = "salary-report.rmd",
                  output_file = "ASU-2019-Salary-Report.HTML",
                  params      = list(url = url.2019))

## 2018 REPORT
rmarkdown::render(input       = "salary-report.rmd",
                  output_file = "ASU-2018-Salary-Report.HTML",
                  params      = list(url = url.2018))

## 2017 REPORT 
rmarkdown::render(input       = "salary-report.rmd",
                  output_file = "ASU-2017-Salary-Report.HTML",
                  params      = list(url = url.2017))

## 2016 REPORT
rmarkdown::render(input       = "salary-report.rmd",
                  output_file = "ASU-2016-Salary-Report.HTML",
                  params      = list(url = url.2016))

# -----------------------------------------------
# VERIFY OUTPUT FILES WERE CREATED
# -----------------------------------------------

cat("\nFiles in project directory:\n")
print(dir(pattern = "\\.HTML$"))
