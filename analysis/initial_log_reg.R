library(here)
source(here("data","get_data.R"))

glm.fit <- glm(readmitted ~ ., family = binomial, data = df)
summary(glm.fit)

'''
Call:
glm(formula = readmitted ~ ., family = binomial, data = df)

Coefficients:
                                Estimate Std. Error z value Pr(>|z|)    
(Intercept)                   -2.527e+00  1.690e+02  -0.015 0.988068    
genderMale                    -6.209e-02  1.592e-02  -3.900 9.63e-05 ***
genderUnknown/Invalid         -9.666e+00  6.773e+01  -0.143 0.886515    
age[10-20)                     5.913e-01  2.337e-01   2.530 0.011414 *  
age[20-30)                     4.573e-01  2.239e-01   2.043 0.041092 *  
age[30-40)                     4.948e-01  2.184e-01   2.265 0.023484 *  
age[40-50)                     6.218e-01  2.161e-01   2.878 0.004002 ** 
age[50-60)                     6.730e-01  2.155e-01   3.123 0.001792 ** 
age[60-70)                     7.675e-01  2.155e-01   3.562 0.000368 ***
age[70-80)                     8.816e-01  2.154e-01   4.092 4.28e-05 ***
age[80-90)                     8.271e-01  2.158e-01   3.833 0.000127 ***
age[90-100)                    4.143e-01  2.206e-01   1.879 0.060299 .  
discharge_disposition_id      -6.981e-03  1.539e-03  -4.535 5.75e-06 ***
time_in_hospital               2.457e-02  3.173e-03   7.742 9.79e-15 ***
num_lab_procedures             2.235e-03  4.441e-04   5.034 4.81e-07 ***
num_procedures                -3.931e-02  5.029e-03  -7.817 5.40e-15 ***
num_medications               -3.716e-03  1.242e-03  -2.993 0.002765 ** 
number_outpatient              7.925e-02  7.956e-03   9.962  < 2e-16 ***
number_emergency               2.705e-01  1.952e-02  13.857  < 2e-16 ***
number_inpatient               4.497e-01  1.551e-02  28.996  < 2e-16 ***
number_diagnoses               7.320e-02  4.401e-03  16.633  < 2e-16 ***
max_glu_serum>300              1.142e-01  9.977e-02   1.145 0.252192    
max_glu_serumNone             -1.353e-01  6.739e-02  -2.008 0.044680 *  
max_glu_serumNorm             -4.369e-02  8.307e-02  -0.526 0.598906    
A1Cresult>8                    9.884e-02  4.770e-02   2.072 0.038265 *  
A1CresultNone                  1.131e-01  4.042e-02   2.797 0.005153 ** 
A1CresultNorm                 -7.908e-02  5.219e-02  -1.515 0.129733    
metforminNo                    1.240e-01  1.022e-01   1.213 0.225013    
metforminSteady               -8.877e-03  1.022e-01  -0.087 0.930794    
metforminUp                   -7.989e-02  1.244e-01  -0.642 0.520607    
repaglinideNo                  8.205e-02  3.835e-01   0.214 0.830567    
repaglinideSteady              3.265e-01  3.895e-01   0.838 0.401858    
repaglinideUp                 -3.847e-03  4.527e-01  -0.008 0.993219    
nateglinideNo                  1.499e-01  7.416e-01   0.202 0.839805    
nateglinideSteady              2.060e-01  7.474e-01   0.276 0.782825    
nateglinideUp                 -5.213e-01  9.353e-01  -0.557 0.577323    
chlorpropamideNo               9.943e+00  1.195e+02   0.083 0.933669    
chlorpropamideSteady           1.005e+01  1.195e+02   0.084 0.932984    
chlorpropamideUp               1.111e+01  1.195e+02   0.093 0.925891    
glimepirideNo                 -8.280e-02  1.766e-01  -0.469 0.639145    
glimepirideSteady             -1.111e-01  1.788e-01  -0.621 0.534357    
glimepirideUp                 -2.495e-01  2.226e-01  -1.121 0.262407    
acetohexamideSteady            1.082e+01  1.195e+02   0.091 0.927868    
glipizideNo                   -2.525e-01  1.083e-01  -2.330 0.019782 *  
glipizideSteady               -1.640e-01  1.084e-01  -1.512 0.130543    
glipizideUp                   -1.522e-01  1.361e-01  -1.118 0.263448    
glyburideNo                   -1.335e-01  1.036e-01  -1.289 0.197551    
glyburideSteady               -1.055e-01  1.039e-01  -1.016 0.309780    
glyburideUp                   -1.252e-01  1.303e-01  -0.961 0.336455    
tolbutamideSteady             -4.812e-01  4.988e-01  -0.965 0.334643    
pioglitazoneNo                -4.037e-01  2.303e-01  -1.753 0.079618 .  
pioglitazoneSteady            -3.408e-01  2.316e-01  -1.472 0.141134    
pioglitazoneUp                -1.426e-01  2.760e-01  -0.516 0.605563    
rosiglitazoneNo                5.681e-01  2.608e-01   2.178 0.029397 *  
rosiglitazoneSteady            7.330e-01  2.621e-01   2.797 0.005158 ** 
rosiglitazoneUp                3.702e-01  3.172e-01   1.167 0.243130    
acarboseSteady                 3.025e-01  1.476e-01   2.049 0.040414 *  
acarboseUp                     8.696e-01  6.595e-01   1.319 0.187280    
miglitolNo                    -1.051e+01  1.195e+02  -0.088 0.929907    
miglitolSteady                -9.706e+00  1.195e+02  -0.081 0.935249    
miglitolUp                    -4.985e-02  1.690e+02   0.000 0.999765    
troglitazoneSteady             9.828e-01  1.226e+00   0.802 0.422686    
tolazamideSteady              -1.721e-01  3.911e-01  -0.440 0.659904    
insulinNo                     -6.125e-02  4.214e-02  -1.453 0.146124    
insulinSteady                 -1.710e-01  3.277e-02  -5.220 1.79e-07 ***
insulinUp                     -4.242e-02  3.440e-02  -1.233 0.217557    
glyburide.metforminNo          7.123e-01  1.179e+00   0.604 0.545910    
glyburide.metforminSteady      7.798e-01  1.183e+00   0.659 0.509715    
glyburide.metforminUp         -8.170e-01  1.609e+00  -0.508 0.611509    
glipizide.metforminSteady      6.615e-01  7.670e-01   0.862 0.388449    
metformin.rosiglitazoneSteady -1.004e+01  8.365e+01  -0.120 0.904445    
metformin.pioglitazoneSteady  -9.781e+00  1.195e+02  -0.082 0.934747    
changeNo                       1.948e-02  2.994e-02   0.651 0.515360    
diabetesMedYes                 3.215e-01  2.868e-02  11.207  < 2e-16 ***
Caucasian                      3.521e-01  4.061e-02   8.669  < 2e-16 ***
AfricanAmerican                3.293e-01  4.376e-02   7.526 5.25e-14 ***
Asian                         -9.798e-02  1.076e-01  -0.911 0.362384    
Hispanic                       1.683e-01  6.804e-02   2.474 0.013372 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 96204  on 71517  degrees of freedom
Residual deviance: 92669  on 71440  degrees of freedom
AIC: 92825

Number of Fisher Scoring iterations: 9

'''
