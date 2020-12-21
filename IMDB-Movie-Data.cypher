Rank	Title	Genre	Description	Director
	Actors	Year	Runtime (Minutes)	
    Rating	Votes	Revenue (Millions)
    	Metascore


LOAD CSV WITH HEADERS FROM "file:///IMDB-Movie-Data.csv" AS row

MERGE (m:Movie{Title:row.Title,RevenueEarned:row.Revenue(Millions)})


MERGE (i:IMDB_Dataevenue{Rank:row.Rank,Votes:row.Votes,Metascore:row.Metascore})

MERGE (a:Actors{Name:row.Actors})


MERGE (d:Director{Name:row.Director,Description:row.Description})

MERGE (m)-[db:Directed_By{Genre:row.Genre,Runtime:row.Runtime}]->(d)

MERGE(m)-[re:Reviewed_By{Rating:row.Rating}]->(i)

MERGE (a)-[ac:Acted_In{Release_Year:row.Year}]->(m)

