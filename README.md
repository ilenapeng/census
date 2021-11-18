# Census Bureau The Opportunity Project Data Sprint - Manhattan's Chinatown

This is the repository for our project on the decreasing Asian population in Manhattan’s Chinatown over the past decade, which was created as part of the Census Bureau’s The Opportunity Project data sprint. 

## Data findings
From 2010 to 2020, the Asian population in Chinatown shrunk by double digit percent changes. The population in Manhattan and the state, meanwhile, increased by 24% and 36% respectively.

Chinatown was over 70% Asian in 2020. While still the majority in the area, that percentage has dropped 10% in the last decade.
The population of every other racial demographic group increased in Manhattan’s Chinatown in the past decade

Fewer people leaving Chinatown moved to a new place in Manhattan in 2020 than 2010. It seems that more people are moving to other boroughs or out of New York City.

<p align="center">
<img src="https://user-images.githubusercontent.com/30391956/142343996-d5f56dfa-8c1e-4460-8dc4-fc60b6272fc3.png" width=70%>
</p>

## Repository contents
Data was pulled from the Census tract level (tracts 16, 29 and 41 in New York County, NY) and then aggregated to form Chinatown

[acs.ipynb](https://github.com/ilenapeng/census/blob/main/acs.ipynb) — Analysis of 2010 to 2019 American Community Survey Geographic Mobility Tables

[decennial.ipynb](https://github.com/ilenapeng/census/blob/main/decennial.ipynb) — 2010 and 2020 Decennial Census Race Tables

[raw_data](https://github.com/ilenapeng/census/tree/main/raw_data) — Decennial Census data downloaded from the Census Bureau site (ACS data is not included in this folder because it was pulled from the Census API)

[data_output](https://github.com/ilenapeng/census/tree/main/data_output) — Data exported from the ACS and Decennial Jupyter notebooks

[graphics](https://github.com/ilenapeng/census/tree/main/graphics) — Graphics we created in Datawrapper and Illustrator, along with a [Jupyter notebook](https://github.com/ilenapeng/census/blob/main/graphics/manhattan_geojson.ipynb) filtering a NYC geojson to Chinatown and its surrounding neighborhoods
