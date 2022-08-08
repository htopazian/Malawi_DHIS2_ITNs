## Feb 4 2020
## Set up pre work - Stage 0

### First: install all packages

### https://github.com/wpgp/wpgpRFPMS/blob/master/docs/Dependencies.md

# This code will install required packages if they are not already installed
# ALWAYS INSTALL YOUR PACKAGES LIKE THIS!
packageList <- c("rgdal", 
                 "raster" ,
                 "randomForest" ,
                 "quantregForest", 
                 "foreign",
                 "snow",
                 "doParallel",
                 "gdalUtils",
                 "jsonlite",
                 "logging", 
                 "doSNOW",
                 "RCurl",
                 "plyr",
                 "wpgpDownloadR",
                 "wpUtilities")
for(p in packageList){
  if (!requireNamespace(p)) {
    install.packages(p)
  }
}


install.packages("devtools")
devtools::install_github("wpgp/wpgpDownloadR")




# load package
library(wpgpDownloadR)


devtools::install_github("wpgp/wpUtilities", force = T)
# 
# # load package
library(wpUtilities)
# 
# ## ONLY USEFUL STUFF PAST THIS POINT
# 
install.packages("devtools")
devtools::install_github("wpgp/wpgpDownloadR", force = T)





## ACTUALLY WHAT WE NEED HERE
# load package
library(wpgpDownloadR)
wpgpListCountries()
# After installation you should be able to use five main functions from the library:
# From https://github.com/wpgp/wpgpDownloadR
#   wpgpListCountries
# wpgpListCountryDatasets
# wpgpGetCountryDataset
# wpgpGetPOPTable
# wpgpGetZonalStats
library(foreign)
x <- data.frame(wpgpListCountryDatasets(ISO3 = "MWI"))
y <- read.csv("./MWI_covars_WPop.csv")

b <- wpgpGetPOPTable("ZAM", 2000)

j <- wpgpListCountryDatasets("MWI")

df <- wpgpCovariates::wpgpGetPOPTable("AGO",2000,"./PopGrid/",username = "EMAIL", password = "PASSWORD")










##### APRIL 22 

mine <- raster("./mwi_TA_rast")
off <- raster("./wpgpRFPMS-master/data/MWI/mwi_subnational_admin_2000_2020.tif")

pop <- read.dbf("./MWI_POPTble_adj.dbf") %>% mutate(ADMINID = as.character(ADMINID))

pop_old <- read.dbf("./Malawi_TA_2018 census match pop count pct.dbf") %>% select(TA_CODE, TOTAL_POP) %>% mutate(ADMINID = as.character(TA_CODE))

pop <- left_join(pop, pop_old, by = "ADMINID")
pop <- pop %>% select(ADMINID, TOTAL_POP, ADMIN, Value)
pop$TOTAL_POP <- replace_na(pop$TOTAL_POP, 0)
write.dbf(pop, "./MWI_POPTble_adj.dbf")


# Reclassify raster
reclass <- pop %>% select(Value, ADMIN)
reclass <- reclass %>% rename(is = Value, becomes = ADMIN)
reclass <- reclass %>% mutate(is = as.numeric(as.character(is)))


z <- reclassify(mine, reclass)
writeRaster(z, ".mwi_subnationalTA_admin_2000_2020.tif")

## Stratify by <5
setwd("C:/Users/kbran/OneDrive/Documents/R/PopGrid/")
pop <- read.dbf("./MWI_POPTble_adj.dbf") %>% mutate(ADMINID = as.character(ADMINID)) 

pop_old <- read.dbf("./Malawi_TA_2018 census match pop count pct.dbf") 
pop_old <- pop_old %>% select(TA_CODE, X.5) %>% mutate(ADMINID = as.character(TA_CODE))

pop <- left_join(pop, pop_old, by = "ADMINID")
pop <- pop %>% select(ADMINID, X.5)
pop <- pop %>% mutate(ADMINPOP = X.5) %>% select(ADMINID, ADMINPOP)
pop$ADMINPOP <- replace_na(pop$ADMINPOP, 0)

write.dbf(pop, "./MWI_POPTble_adj.dbf")


#################################
# May 5 2020 - over 5 
library(foreign)
library(tidyverse)
x <- read.dbf("C:/Users/kbran/OneDrive/Documents/R/PopGrid/MWI_POPTble_adj.dbf")
y <- read.dbf("C:/Users/kbran/OneDrive/Documents/R/PopGrid/Malawi_TA_2018 census match pop count pct.dbf") %>%
  mutate(ADMINID = as.numeric(as.character(TA_CODE)), ADMINPOP1  = X..5) %>% select(ADMINID, ADMINPOP1)

z <- left_join(x,y) %>% select(ADMINID, ADMINPOP1) %>% rename(ADMINPOP = ADMINPOP1)
z$ADMINPOP <- replace_na(z$ADMINPOP, 0)

write.dbf(z, "C:/Users/kbran/OneDrive/Documents/R/PopGrid/MWI_POPTble_adj.dbf")
