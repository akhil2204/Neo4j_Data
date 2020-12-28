MATCH(row:Imdb)
WITH
    CASE row.revenueMillions
        WHEN null
        THEN 0
        ELSE row.revenueMillions
    END AS revenue,
         CASE row.title
           WHEN null
           THEN "No title"
           ELSE row.title
        END AS title,
        
        case row.actors
        WHEN null
           THEN "No actor"
           ELSE row.actors
        END AS actors,
        
         case row.director
        WHEN null
           THEN "No director"
           ELSE row.director
        END AS director,
        
        
          case row.description
        WHEN null
           THEN "No description"
           ELSE row.description
        END AS description,
        
        case row.metascore
        WHEN null
           THEN 0
           ELSE row.metascore
        END AS metascore,
        
          case row.description
        WHEN null
           THEN "No votes"
           ELSE row.votes
        END AS votes,
        
        
          case row.rank
        WHEN null
           THEN 0
           ELSE row.rank
        END AS rank,
        
        
          case row.genre
        WHEN null
           THEN "No genre"
           ELSE row.genre
        END AS genre,
        
        
          case row.runtimeMinutes
        WHEN null
           THEN 0
           ELSE row.runtimeMinutes
        END AS runtimeMinutes,
        
        
          case row.year
        WHEN null
           THEN 0
           ELSE row.year
        END AS year,
        
          case row.rating
        WHEN null
           THEN 0
           ELSE row.rating
        END AS rating
        
        
        
    MERGE (m:Movie{Title:title,RevenueEarned:revenue})
    MERGE (im:IMDB_Dataevenue{Rank:rank,Votes:votes,Metascore:metascore})
    MERGE (a:Actors{Name:actors})
MERGE (d:Director{Name:director,Description:description})
MERGE (m)-[db:Directed_By{Genre:genre,Runtime:runtimeMinutes}]->(d)
MERGE(m)-[re:Reviewed_By{Rating:rating}]->(im)
MERGE (a)-[ac:Acted_In{Release_Year:year}]->(m)