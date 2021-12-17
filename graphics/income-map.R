library(geojsonio)
library(broom)
library(tidyverse)
library(mapproj)
library(extrafont)

# BEFORE THIS:
# ZCTAs downloaded from here: https://www.census.gov/cgi-bin/geo/shapefiles/index.php?year=2021&layergroup=ZIP+Code+Tabulation+Areas
# shapefile transformed into json using https://mapshaper.org/
# json output from Mapshaper was filtered in Python to the two zips, exported as geojson 

# load in geojsons
zcta <- geojson_read("zcta_chinatown.geojson",  what = "sp")
cdta <- geojson_read("cdta.geojson",  what = "sp")
income <- read_csv('income.csv')

# convert to dataframe for plotting
zcta_df <- tidy(zcta)
cdta_df <- tidy(cdta)

# merge in income data
cdta_df$id <- as.numeric(cdta_df$id)

cdta_df = cdta_df %>%
  left_join(. , income, by=c("id"="id"))

# plot - this produces a full map, labels and all
# but I commented out text on the map for more customization in Illustrator 
plot <- ggplot() +
  geom_polygon(data = cdta_df, aes(x = long, y = lat, group = group, fill=income), color="white", size=0.1) +
  scale_fill_continuous(low="#F3B391", high="#691711", guide="colorbar",na.value="#DDDDDD", limits=c(0, 85000), breaks=seq(0,80000, by=40000)) +
  geom_polygon(data = zcta_df, aes(x = long, y = lat, group = group), fill="white", color="#999999", alpha=0, size=1.1) +
  labs(
#    title = "How income in Chinatown differs\nfrom its surrounding zip codes",
#    subtitle = "Median household income in Chinatown's Census tracts",
#    caption="Source: US Census Bureau via Census Reporter\nChart: Ilena Peng"
  ) +
#  annotate("text", x=-74.05, y=40.73, hjust=0, label="The median income in zip code 10013\nis roughly $113,000. But the two\nCensus tracts of Chinatown\nwithin this zip code have median\nincomes of about $28,000 and $85,000.", family="Roboto", size=3) +
#  annotate("text", x=-73.99, y=40.70, hjust=0, label="However, the median income in\nanother Chinatown Census tract is\n$10,000 more than the median\nincome in its surrounding zip code,\n10002, where the median income is\naround $37,000.", family="Roboto", size=3) +
  coord_map() +
  theme_void() +
  theme(
    text = element_text(family="Roboto"),
#    plot.title = element_text(face="bold", size=16),
#    plot.caption = element_text(color="#888888"),
    legend.position ="top",
    legend.justification = "left",
    legend.title = element_blank(),
    plot.margin = margin(1, 1, 1, 1, "cm")
    )

print(plot)
ggsave("map-income.png")