

LOAD CSV WITH HEADERS FROM "file:///googleplaystore.csv" AS row

MERGE (a:App{Name:row.App_Name,Size:row.Size})


MERGE (g:Genre{Genres: row.Genres,ContentRating:row.Content_Rating})

MERGE (u:User{Rating: row.Rating, Review:row.Reviews})


MERGE (s:Specs{Requirment:row.Android_Ver,CurrentVersion:row.Current_Ver})

MERGE (a)-[ab:About{Tyoe:row.Type,Price:row.Price}]->(s)

MERGE(u)-[re:Reviewed_By{Installs:row.Installs,LastUpdated:row.Last_Updated}]->(a)
MERGE (a)-[ca:Category{BelongsTo:row.Category}]->(g)