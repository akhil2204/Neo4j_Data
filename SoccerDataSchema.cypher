//Soccer_Data
LOAD CSV WITH HEADERS FROM "file:///data1.csv" AS row

MERGE (p:Player{name:row.Name,id:row.ID,rank:row.Age,nationality:row.Nationality})


MERGE (c:Club{clubname: row.Club, Logo:row.ClubLogo,reputation:row.InternationalReputation })

MERGE (d:PlayerData{workrate: row.WorkRate, position:row.Position })


MERGE (i:Income {value:row.Value,releaseclause:row.RClause})

MERGE (p)-[e:Earns{platform:row.Wage}]->(i)

MERGE(p)-[pl:Plays_For{jersyno:row.JerseyNumber,joined:row.Joined,contractend:row.ContractValidUntil}]->(c)
MERGE (p)-[s:Player_Stats{overall:row.Overall,potential:row.Potential}]->(d)

