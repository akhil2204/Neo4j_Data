//Terrorists Data
LOAD CSV WITH HEADERS FROM "file:///terrorist_data_subset.csv" AS row

MERGE (c:Country {Name:row.Country})

MERGE (a:Actor {Name: row.ActorName, Aliases: row.Aliases, Type: row.ActorType})

MERGE (o:Organization {Name: row.AffiliationTo})

MERGE (a)-[:AFFILIATED_TO {Start: row.AffiliationStartDate, End: row.AffiliationEndDate}]->(o)

MERGE(c)<-[:IS_FROM]-(a);