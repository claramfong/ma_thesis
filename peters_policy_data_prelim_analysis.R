library(tidyverse)
# install.packages("here")
library(here)

policy_df <- read_csv(
  url("https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/XTSNW0/6PDQZC")
) 

policy_df <- policy_df %>% 
  filter(countrynm == "Singapore",
         year >= 1955) %>% 
  select(-c(refcode,
            refexist,
            asylcode,
            asylexist,
            decode))

# Preliminary glipmse at the type of migration policy based on skillset
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = skillcode)) 
#looks like they mostly welcomed high skilled workers at first then it slowly started being more open 
#then a little more closed again

# Preliminary glipmse at the type of migration policy based on nationality restrictions
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = natcode)) 
# nothing exciting to see here, part of this is just due to the fact that not many ppl wanted to move to sg
#in the past

# Policy and Citizenship attainment
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = citcode)) 
# there's a drop in 1965, this is 100% due to independence

# Policy and Migrant rights
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = rightscode)) 
# interesting trend here, there's a drop in 1977 or so, then ther'es just a decline in migrant rights
# and it goes back up around 2005, why?

# Poicy on Immigration Enforcement
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = encode)) 
# unexpectedly, it's getting more strict over time

# Policy on Recruitment
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = reccode)) 
# was pretty hard to get a visa bc not a lot of opportunities
# that goes up in the 1980s-ish, but then goes down again until 2000 (sign of labor recruitment)

# Policy on Occupation restrictions
policy_df %>% 
  ggplot() +
  geom_point(aes(x = year, y = labcode)) 
# invited immigrants to work any position basically until the 1970s, then dropped to more restrictions
# then, this increased again to allow for more opportunities, but not freely anything

