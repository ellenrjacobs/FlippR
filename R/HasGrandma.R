#' HasGrandma
#'
#' Filter individuals to include only those who have grandmothers for which there exists life history information in the larger population's dataset.
#' @param Your_Data The data for the individuals of interest, in Life History data-format
#' @param Full_Data The data for the full known population in the study area, in Life History data-format
#' @return Dataframe of individuals from Your_Data who have known grandmothers
#' @examples HasGrandma(Your_Data, Full_Data)
#' @export

HasGrandma = function(Your_Data, Full_Data)
{
  require(magrittr)
  require(dplyr)
  
  Your_Data = Your_Data %>% filter(!is.na(MotherID)) #ones who have mothers
  GrandmaOrNo = integer(nrow(Your_Data))
  for(i in 1:nrow(Your_Data))
  {
    Mom = Full_Data[which(Full_Data$IndividualID == Your_Data$MotherID[[i]]),] #dolphin's mom
    if(nrow(Mom) > 0) #if we have data on mom
    {
      Grandma = Mom$MotherID
      if(!is.na(Grandma)) #if we have data on grandma
      {
        GrandmaOrNo[i] = 1 #set grandma or no equal to yes
      }
    }
  }
  Your_Data = cbind(Your_Data, GrandmaOrNo)
  Your_Data = Your_Data %>% filter(GrandmaOrNo == 1) #filter only ones with yes
  Your_Data$GrandmaOrNo = NULL #delete the yes/no column
  return(Your_Data)
}
