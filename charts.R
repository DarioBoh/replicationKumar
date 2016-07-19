
all_values <- function(x) {
  if(is.null(x)) return(NULL)
  paste0(names(x), ": ", format(x), collapse = "<br />")}

dt %>%   
  ggvis(x=~noiseLevel, y=~testScore, stroke=~temperature) %>% 
  layer_lines() %>% 
  layer_points(fill=~temperature) %>% 
  add_axis("y", orient = "right") %>% 
  add_axis("y", orient = "left") %>% 
  add_tooltip(all_values,'hover') %>% 
  scale_numeric("x", domain = c(0, 50)) %>% 
  scale_numeric("y", domain = c(0, 80)) %>% 
  bind_shiny('ggvis','2d') 