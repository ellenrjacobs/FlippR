#' KnownInfoIndivs
#'
#' Filter individuals to include only those for whom there is a known mother, sex, and birth date
#' @param Your_Data The data for the individuals of interest, in Life History data-format
#' @return Dataframe of individuals from Your_Data who have a known mother, sex, and birth date
#' @example KnownInfoIndivs(LifeHistory_Babies)
#' @export

KnownInfoIndivs = function(Your_Data)
{
  Your_Data = Your_Data %>% filter(!is.na(MotherID) #known mother
                                   & !is.na(Sex) #known sex
                                   & Sex != "UNKNOWN" #known sex
                                   & !is.na(BirthDate)) #known birthday
  return(Your_Data)
}

#necessary packages: dplyr, magrittr
