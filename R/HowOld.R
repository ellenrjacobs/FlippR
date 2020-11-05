#' HowOld
#'
#' Calculates the age that each dolphin in a dataframe is at the date supplied in a corresponding vector of dates.
#' @param Your_Data The data for the individuals of interest, in Life History data-format
#' @param Your_Dates A vector of dates the same length as Your_Data, where each value corresponds to one row of Your_Data
#' @param Age Specify whether you want the output ages in "Days" (age in days) or "Years" (age in years). Default is Days.
#' @return Vector of each individual's ages, where each value corresponds to one row of Your_Data
#' @examples HowOld(Your_Data, Your_Dates, Age = "Years")
#' @export


HowOld = function(Your_Data, Your_Dates, Age = "Days")
{
  Ages =  rep(NA, nrow(Your_Data)) #create the empty vector to fill with ages

  for(i in 1:nrow(Your_Data)) #go through each row to treat each case
  {
    if(!is.na(Your_Data$BirthDate[[i]]) & (Your_Data$BirthDate[[i]] < Your_Dates[i])) #if your birth date is known & it's before the time
    {
      if((!is.na(Your_Data$DeathDate[[i]]) & Your_Data$DeathDate[[i]] > Your_Dates[i]) #you have a death date & it's after the time
         | is.na(Your_Data$DeathDate[[i]])) #or you don't have a death date
      {
        Ages[i] = Your_Dates[i] - Your_Data$BirthDate[i] #subtract your time from your birth date
      }
    }
  }

  if(Age == "Years") #if the user chose age in years
  {
    Ages = Ages/365 #turn into years
    return(Ages)
  }
  else if(Age == "Days") #the user stuck with default, defined in days
  {
    return(Ages)
  }
  else
  {
    print("ERROR-- choose years or days")
  }
}
