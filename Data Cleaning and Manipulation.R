##################################
######Data cleaning###############
##################################
library(tidyverse)
data() #starwars datasets 
view(starwars)
names(starwars)

# variables types   

glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)
unique(starwars$homeworld)
starwars$gender <- as.factor(starwars$gender)
levels(starwars$gender)
# Select variables  
names(starwars)== #colnames(starwars)
 
starwars %>% select(name, height, 
                    ends_with("color")) #%>% names()

#filter observations

unique(starwars$hair_color)

starwars %>% select(name, height, 
                    ends_with("color")) %>% filter(
                     hair_color %in% c("blond", "brown") &
                      height<180) 
                    
# Missing values    
mean(starwars$height) #cannot calculate the mean if NA values are present
mean(starwars$height, na.rm = TRUE)
 
starwars %>%  select(name, gender, hair_color,height)  %>% #not recommended to deal with NA's 
                      na.omit()#this will remove anything with
#with a missing value NA

starwars %>%  select(name, gender, hair_color,
                     height)  %>% 
                    drop_na(height) %>% view()

starwars %>%  select(name, gender, hair_color,
                     height)  %>% filter(!complete.cases(.)) %>% 
        mutate(hair_color=replace_na(hair_color,
                              "none"))  

# Re-coding variables 

starwars %>%  select(name, gender)

starwars %>%  select(name, gender) %>% 
       mutate(gender=recode(gender, 
                            "masculine"=1,
                            "feminine"=2))
sum(is.na(starwars$height)) #checking the number of NA's 
##Duplicates 
data %>%  distinct() #this will remove all our duplicated data
 

