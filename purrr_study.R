# Header ------------------------------------------------------------------
# [wyhirai@gmail.com] Hirai W. Y.

#configuration to RStudio
# rm(list=ls()); options(device = 'windows')

#used packages
library(magrittr)
library(ggplot2)
library(dplyr)

# purrr:: -----------------------------------------------------------------
library(purrr)

# apply functions ---------------------------------------------------------

# purrr::map() ------------------------------------------------------------

#map:: 'vetor -> list'

#example
map(.x = 1:10, 
    .f = rnorm, 
    n = 10) 

#aplication
map(.x = iris$Species %>% levels(),
    .f = function(x){ iris %>%
        dplyr::filter(Species == x) %>% 
        dplyr::select(-Species) %>% 
        cov()
    })

spe_list <- list()
for(i in 1:3){
  spe_list[[i]] <- iris %>%
    dplyr::filter(Species == levels(iris$Species)[i]) %>% 
    dplyr::select(-Species) %>% 
    cov()
}

#extention

# map_dbl:: "list -> vector"

#example
1:10 %>% 
  map(rnorm, n = 10) %>% 
  map_dbl(var)

# purrr::map2() -----------------------------------------------------------

#example
x <- list(1, 1, 1); x
y <- list(10, 20, 30); y
z <- list(100, 200, 300); z

map2(x, y, ~ .x + .y)
map2(x, y, `+`)
map2(x, y, sum)

by_cyl <- mtcars %>% split(.$cyl)
mods <- by_cyl %>% 
  map(~ lm(mpg ~ wt, data = .))
map2(mods, by_cyl, predict)

#aplication
iris %>% 
  ggplot2::ggplot(aes(x = Petal.Length, 
                      y = Sepal.Length,
                      col = Species)) +
  geom_point(size = 4, show.legend = F) +
  geom_smooth(aes(group = Species),
              method = 'lm',
              formula = 'y ~ x',
              se = F, col = 'red') +
  facet_wrap(facets = 'Species', scales = 'free')

iris_model = res_rstudent = list()
for(i in 1:nlevels(iris$Species)){
  iris_model[[i]] <- 
    iris %>% 
    subset(Species == levels(iris$Species)[i]) %>% 
    lm(Sepal.Length  ~ Petal.Length, data = .) 
  
  res_rstudent[[i]] <- iris_model[[i]] %>% rstudent()
}

res_rstudent %>% 
  unlist() %>% 
  data.frame(res = ., iris) %>% 
  ggplot(aes(x = Species, y = res, 
             col = Species)) +
  geom_violin(alpha = .5) + 
  geom_boxplot(alpha = .5) + 
  geom_jitter(alpha = .5, size = 3) +
  theme_bw(base_size = 15) +
  theme(legend.position = 'none')

iris_modelspecies <- 
  iris %>% 
  split(.$Species) %>% 
  map(~ lm(Sepal.Length  ~ Petal.Length, data = .))

r_squareajus <- 
  iris_modelspecies %>% 
  map(summary) %>% 
  map_dbl('adj.r.squared')

# purrr:pmap() ------------------------------------------------------------


