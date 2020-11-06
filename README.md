
# FlippR

<!-- badges: start -->
<!-- badges: end -->

The FlippR package is designed to work with life history data from long term animal research projects, modeled using life history data from the Shark Bay Dolphin Project's database of dolphin demographic data. FlippR allows the user to do simple data manipulation on data in the "life history data format". The functions contained within the package help filter individuals, determine generational relationships, and calculate age on specific observation dates.

## Installation

You can install the released version of FlippR from GitHub at the url: https://github.com/erj22/FlippR

``` r
install.packages("FlippR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(FlippR)
print(Your_Data) #our original dataset

Your_Data.filtered = KnownInfoIndivs(Your_Data) #run it through the function to filter out indivs without enough info

print(Your_Data.filtered)
```

