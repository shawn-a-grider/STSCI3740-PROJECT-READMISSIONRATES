library(here)
library(readr)

data1 <- read.csv(here("diabetes+130-us+hospitals+for+years+1999-2008","diabetic_data.csv"))
data2 <- read.csv(here("diabetes+130-us+hospitals+for+years+1999-2008","IDS_mapping.csv"))

process_diabetes_data <- function(data1, data2) {
  df <- data.frame(data1)
  
  mapping <- data2
  mapping <- data.frame(mapping)
  
  df <- data.frame(data)

  
  df <- df[ , !(names(df) %in% c("weight", "payer_code", "medical_specialty"))]
  
  seen_patients <- c()
  rm_rows <- c()
  
  for (i in 1:nrow(df)){
    if (df[i, "patient_nbr"] %in% seen_patients){
      rm_rows <- c(rm_rows, i)
    } else{
      seen_patients <- c(seen_patients, df[i, "patient_nbr"])
    }
    if (df[i,"readmitted"] == "NO"){
      df[i,"readmitted"] = 0
    } else{
      df[i,"readmitted"] = 1
    }
  }
  
  df <- df[-rm_rows, ]
  
  cols <- names(df)
  rm_cols <- c()
  for (j in 1:ncol(df)){
    if (length(unique(df[[cols[j]]])) < 1){
      rm_cols <- c(rm_cols, cols[j])
    }
  }
  
  df <- df[, !names(df) %in% rm_cols]
  

  
  df <- na.omit(df)
  cols <- names(df)
  rm_cols <- c()
  for (j in 1:ncol(df)){
    if (length(unique(df[[cols[j]]])) <= 1){
      rm_cols <- c(rm_cols, cols[j])
    }
  }
  
  df <- df[, !names(df) %in% rm_cols]

  
  df$readmitted <- as.numeric(as.character(df$readmitted))
  
  for (i in 1:nrow(df)){
    if (df$race[i] == "Caucasian"){
      df$Caucasian[i] = 1
      df$AfricanAmerican[i] = 0
      df$Asian[i] = 0
      df$Hispanic[i] = 0
    } else if(df$race[i] == "AfricanAmerican"){
      df$Caucasian[i] = 0
      df$AfricanAmerican[i] = 1
      df$Asian[i] = 0
      df$Hispanic[i] = 0
    }else if(df$race[i] == "Asian"){
      df$Caucasian[i] = 0
      df$AfricanAmerican[i] = 0
      df$Asian[i] = 1
      df$Hispanic[i] = 0
    }else if(df$race[i] == "Hispanic"){
      df$Caucasian[i] = 0
      df$AfricanAmerican[i] = 0
      df$Asian[i] = 0
      df$Hispanic[i] = 1
    } else{
      df$Caucasian[i] = 0
      df$AfricanAmerican[i] = 0
      df$Asian[i] = 0
      df$Hispanic[i] = 0
    }
  }
  
  rm_new_cols <- c("encounter_id", "patient_nbr", "admission_type_id", "discharge_position_id", "admission_source_id","race", "diag_1", "diag_2", "diag_3" )
  df <- df[, !names(df) %in% rm_new_cols]
  
  return(df)
}










