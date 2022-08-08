install.packages("devtools")
devtools::install_github("wpgp/wpgpCovariates")

# load package
library(wpgpCovariates)


wpgpListCountries(username = "ftpUsername", password = "ftpPassword")
wpgpListCountryCovariates(ISO3 = "MWI",username = "ftpUsername", password = "ftpPassword" )


## ONLY USEFUL STUFF PAST THIS POINT

install.packages("devtools")
devtools::install_github("wpgp/wpgpDownloadR", force = T)

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

wpgpListCountryDatasets(ISO3 = "MWI")
