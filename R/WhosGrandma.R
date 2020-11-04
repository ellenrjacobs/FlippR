#' WhosGrandma
#'
#' Identify the grandmother of each individual of interest and return her life history information. Should be run only after HasGrandma to ensure all individuals do have grandmothers in the population first.
#' @param Your_Data The data for the individuals of interest, in Life History data-format
#' @param Full_Data The data for the full known population in the study area, in Life History data-format
#' @return A dataframe in Life History data-format of the life history data of the grandmothers of input individuals
#' @example MyData = HasGrandma(Your_Data, Full_Data), WhosGrandma(MyData, Full_Data)

WhosGrandma = function(Your_Data, Full_Data)
{
  GrandmaNames = Your_Data #to copy size and data types in each column
  for(i in 1:nrow(Your_Data))
  {
    Mom = Full_Data[which(Full_Data$IndividualID == Your_Data$MotherID[[i]]),] #dolphin's mom
    GrandmaNames[i,] = Full_Data[which(Full_Data$IndividualID == Mom$MotherID),] #dolphin's grandma
  }
  return(GrandmaNames)
}
