//Games Data

LOAD CSV WITH HEADERS FROM "file:///vgsales.csv" AS row

MERGE (g:Games{name:row.Name,released:row.Year,rank:row.Rank})


MERGE (p:Publisher{name: row.Publisher, genre:row.Genre })

MERGE (s:Sales {USA: row.NA_Sales,Europe:row.EU_Sales,Japan:row.JP_Sales,Global:row.Global_Sales})

MERGE (g)-[:Played_On {platform:row.Platform}]->(p)

MERGE(p)-[:Income_Earned]->(s);