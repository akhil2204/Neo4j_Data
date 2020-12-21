// budget	genres	homepage	id	keywords
// 	original_language	original_title	overview
//     	popularity	production_companies	production_countries
//   	release_date	revenue	runtime	spoken_languages	status
// 	tagline	title	vote_average	vote_count




LOAD CSV WITH HEADERS FROM "file:///tmdb_5000_movies.csv" AS row

MERGE (m:Movie{ID:row.id,Title:row.original_title,Homepage:row.homepage})


MERGE (p:Producers{Revenue:row.revenue})

MERGE (u:UserReview{Popularity: row.popularity, Vote_count:row.vote_count})


MERGE (o:MovieOverview{Overview:row.overview,Runtime:row.runtime})

MERGE (p)-[pb:Produced_By{Budget:row.budget,Release_date:row.release_date}]->(m)

MERGE(u)-[re:Reviewed_By{Vote_average:row.vote_average}]->(m)

MERGE (m)-[mi:More_Info{Tagline:row.tagline, Status:row.status}]->(o)

