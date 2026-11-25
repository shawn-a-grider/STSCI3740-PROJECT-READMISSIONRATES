library(here)
source(here("data","get_data.R"))

glm.fit <- glm(readmitted ~ ., family = binomial, data = df)
summary(glm.fit)
