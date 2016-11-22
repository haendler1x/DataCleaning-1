refine <- read.csv("~/Dropbox/Springboard Foundations/DataCleaning 1/refine.csv")

#Standardize Brand Name, all lower case and philips, akzo, van houten, and unilever

refine$company <- tolower(refine$company)

refine$company <- str_replace_all(refine$company, ".*p.*", "phillips")
refine$company <- str_replace_all(refine$company, ".*f.*", "phillips")
refine$company <- str_replace_all(refine$company, ".*k.*", "akzo")
refine$company <- str_replace_all(refine$company, ".*ten.*", "van houten")
refine$company <- str_replace_all(refine$company, ".*ver.*", "unilever")

#separate prwoduct code and product number into two columns

refine <- separate(refine, Product.code...number, c("product_code", "product_number"), sep = "-")

#add product categories p = Smartphone, v = TV, x = Laptop,	q = Tablet

refine$product_cat <- refine$product_code

refine$product_cat <- str_replace_all(refine$product_cat, ".*p.*", "Smartphone")
refine$product_cat <- str_replace_all(refine$product_cat, ".*v.*", "TV")
refine$product_cat <- str_replace_all(refine$product_cat, ".*x.*", "Laptop")
refine$product_cat <- str_replace_all(refine$product_cat, ".*q.*", "Tablet")

#Add full address column
refine <- unite(refine, full_address, address, city, country, sep = ", ", remove = FALSE)

#Add binary columns for data analysis.  
#company: company_philips, company_akzo, company_van_houten and company_unilever
#product category: product_smartphone, product_tv, product_laptop and product_tablet

refine$company_philips <- refine$company
refine$company_akzo <- refine$company
refine$company_van_houton <- refine$company
refine$company_unilever <- refine$company

refine$product_smartphone <- refine$product_code
refine$product_tv <- refine$product_code
refine$product_laptop <- refine$product_code
refine$product_tablet <- refine$product_code

#company

for(i in 1:nrow(refine)){
  if (identical(refine$company_philips[i], "phillips") == TRUE){
    refine$company_philips[i] <- "1"
  }else{
    refine$company_philips[i] <- "0"
  }
}

for(i in 1:nrow(refine)){
  if (identical(refine$company_akzo[i], "akzo") == TRUE){
    refine$company_akzo[i] <- "1"
  }else{
    refine$company_akzo[i] <- "0"
  }
}

for(i in 1:nrow(refine)){
  if (identical(refine$company_van_houton[i], "van houton") == TRUE){
    refine$company_van_houton[i] <- "1"
  }else{
    refine$company_van_houton[i] <- "0"
  }
}

for(i in 1:nrow(refine)){
  if (identical(refine$company_unilever[i], "unilever") == TRUE){
    refine$company_unilever[i] <- "1"
  }else{
    refine$company_unilever[i] <- "0"
  }
}


#prod cat
for(i in 1:nrow(refine)){
if (identical(refine$product_smartphone[i], "p") == TRUE){
  refine$product_smartphone[i] <- "1"
}else{
  refine$product_smartphone[i] <- "0"
}
}

for(i in 1:nrow(refine)){
  if (identical(refine$product_tv[i], "v") == TRUE){
    refine$product_tv[i] <- "1"
  }else{
    refine$product_tv[i] <- "0"
  }
}

for(i in 1:nrow(refine)){
  if (identical(refine$product_laptop[i], "x") == TRUE){
    refine$product_laptop[i] <- "1"
  }else{
    refine$product_laptop[i] <- "0"
  }
}

for(i in 1:nrow(refine)){
  if (identical(refine$product_tablet[i], "q") == TRUE){
    refine$product_tablet[i] <- "1"
  }else{
    refine$product_tablet[i] <- "0"
  }
}

write.csv(refine, file = "refine_clean.csv")


