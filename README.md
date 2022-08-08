# Malawi_DHIS2_ITNs :chart_with_downwards_trend:

This repository holds datasets used in the following publication: 

> Topazian HM, Gumbo A, Brandt K, Kayange M, Smith JS, Edwards JK, Goel V, Mvalo T, Emch M, Pettifor AE, Juliano JJ, Hoffman I. Effectiveness of a national mass distribution campaign of long-lasting insecticide-treated nets and indoor residual spraying on clinical malaria in Malawi, 2018-2020. BMJ Glob Health. 2021 May;6(5):e005447. doi: 10.1136/bmjgh-2021-005447. PMID: 33947708; PMCID: PMC8098915.


Key source files for re-distributing 2018 Malawi Census population counts and health facility locations are included as of August 2022. 

DHIS2 data can be obtained from the Malawi Ministry of Health upon reasonable request. 


## Directory

```
.
├── MWI_census_2018                    # 2018 cenus population re-distribution
|   ├── PopGrid                        # Population rasters and shapefiles
|   ├── wpgpTFPMS-master               # WorldPop random forests code
|   ├── README-WorldPop-May2022.docx   # Instructions for code use (Kate Brandt)
├── MWI_health_facilities              # Malawi health facilities lat / long compilation
|   ├── MWI_health_facility_xy.csv     # .csv with lat / long coords and sources
└── README.md                          # Project overview
```
