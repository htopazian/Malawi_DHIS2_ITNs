##  Declare the 3-letter ISO code(s) of the country(ies) you are interested in 
##  modeling.
##  NOTE:  You must declare the ISO codes of the countries you are modelign even
# KB edits Apr 13 2020
## EDITS APR 20 2020
## Latest edits: APR 22 2020
##         if you plan on only modeling portions of them, i.e. declaring 
##         specific admin IDs below or using a shapefile to subset them.
##  EXAMPLE:
##  rfg.input.countries <- c("BTN","NPL")
##  rfg.input.countries <- c("ARM", "GEO", "AZE")

rfg.input.countries <- c("MWI")

##  If you are using specific Population tables, i.e. non-standard, stored 
##  locally, declare their paths here. Otherwise, the script will source the 
##  ones from the WorldPop FTP
##  EXAMPLE:
##    rfg.input.poptables <- list(
##                               "NPL"="D:/WorldPop_Data/RandomeForest/BTN_POP_TABLE_FINAL.dbf", 
##                               "BTN"="D:/WorldPop_Data/RandomeForest/BTN_POP_TABLE_FINAL.dbf"
##                               )
rfg.input.poptables <- list("MWI" = "C:/Users/kbran/OneDrive/Documents/R/PopGrid/MWI_POPTble_adj.dbf")

##  Declare specific admin IDS by which to subset the above declared countries:
##  WARNING:  You can NOT use this option in conjunction with the shapefile 
##            subsetting option. At least one of the two subsetting options MUST
##            be set to NULL.
##  EXAMPLE:
##    rfg.input.adminids <-  list(
##                              "BTN"=c(641378946,641378947,641378948), 
##                              "NPL"=c(524664944,524664945,524664946))
rfg.input.adminids <- NULL

##  Declare the paths to the shapefiles subsetting the countries of interest 
##  which were declared above.
##  WARNING:  You can NOT use this option in conjunction with the adminID 
##            subsetting option. At least one of the two subsetting options MUST
##            be set to NULL.
##  EXAMPLE:
##    rfg.input.shp <-  list( "BTN"="F:\\WorldPop\\RandomeForest\\shp\\BTN\\out.shp", 
##                            "NPL"="F:\\WorldPop\\RandomeForest\\shp\\NPL\\out.shp")



rfg.input.shp <- list("MWI" = "C:/Users/kbran/OneDrive/Documents/R/PopGrid/Malawi_TA_2018 census match pop count pct.shp")

##  Declare the input year for which we are modeling. 
##  NOTE:  This must be declared as a numeric character string.
rfg.input.year <- "2018"


##  Declare a list of the character representations of the covaraites with which
##  we intend to do modeling with:
##  NOTE:  You can use the function wpgpListCountryCovariates() from the 
##         wpgpCovariates library to see what all covariates are available, but 
##         most will remain the same between covariate runs excluding the year 
##         specific part of their name.
##         EXAMPLE:  
##           wpgpListCountryDatasets("ABW")
##
##  WARNING:  Ensure that the covariates declared match the year declared for 
##            the rfg.input.year variable.

rfg.input.cvr <- list("dst_bsgme_100m_2018",
                      "dst_coastline_100m_2000_2020",
                      "esaccilc_dst011_100m_2015",
                      "esaccilc_dst040_100m_2015",
                      "esaccilc_dst130_100m_2015",
                      "esaccilc_dst140_100m_2015",
                      "esaccilc_dst150_100m_2015",
                      "esaccilc_dst160_100m_2015",
                      "esaccilc_dst190_100m_2015",
                      "esaccilc_dst200_100m_2015",
                      "esaccilc_water_100m_2000_2012",
                      "esaccilc_dst_water_100m_2000_2012",
                      "level0_100m_2000_2020",
                      #"subnational_admin_2000_2020",
                      "osm_dst_roadintersec_100m_2016",
                      "osm_dst_waterway_100m_2016",
                      "osm_dst_road_100m_2016",
                      "srtm_slope_100m",
                      "srtm_topo_100m",
                      "viirs_100m_2016"
                      
)  



# Add custom covaiates
#
rfg.input.custom.cvr <-  NULL#list( "C:/Users/kbran/OneDrive/Documents/R/PopGrid/output_total/MWI/croped/mwi_subnational_admin_2000_2020.tif") 
#                               "wclim_prec"="E:\\WorldPop\\RF_NEW\\btn_grid_100m_wclim_prec.tif",
#                               "wclim_temp"="E:\\WorldPop\\RF_NEW\\btn_grid_100m_wclim_temp.tif")

rfg.input.custom.cvr <- NULL

## It is posible to turn off proximity in RF
## 
rfg.proximity <- TRUE

##  Declare if we are using a fixed set in this modeling, i.e. are we 
##  parameterizing, in part or in full, this RF model run upon another 
##  country's(ies') RF model object. 
##
## Copy popfit you are going to use to a relative folder 
##  /data/old_popfits/popfits_final and popfits_quant 
## all popfits in this folder will be loaded
## 

rfg.fixed.set <- FALSE
rfg.fixed.set.incl.input.countries <- FALSE

## this option only used if rfg.fixed.set.incl.input.countries is TRUE
## if the country has less then rfg.fixed.set.idmin.id.threshold idmin units 
## then RF popfit will not be combined with RF model run upon another 
## country's(ies') RF model object

rfg.fixed.set.idmin.id.threshold <- 20

## Write a description of what fixset is used
rfg.fixed.set.description <- "Description Using ...."

## if TRUE then we will calculate the zonal stats sum on our 
## main results and comper with POP table.
rfg.check.result <- TRUE
## if  > this value then during check it will be reported at the end.
rfg.check.result.eps <- 0.1

