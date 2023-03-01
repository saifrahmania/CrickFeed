
# CrickFeed
This is an iOS app which gives the update of Cricket score. This app also notifies the user the upcoming matches. It gives the update of live cricket matches as well. And many things can be done


## Authors

- [@saifrahmania](https://www.github.com/saifrahmania)


## Details

This is Saifur Rahman. I have created this repository to host my CV online. As in the past I had to attend different interview, that time I was asked to provide my updated CV but unfortunately to some extend I was not able to provide because that time the file was not available to me. That time I was trying to find a better solution which can help me to carry my cv and make it easier to share my CV. That time to make my life easy. I have created this repository 
## API Documentation 
The API which was to create the app was - [Sportsnonk](https://www.sportmonks.com)

### Features of the APU
SportMonks offers standard REST APIs. Requests are sent with URLs and responses will be returned in JSON. Every authentication is spearheaded by an API token. We offer everything in Postman, where we have assembled a library of all of our endpoints, with example requests.

### Get continent
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |
| `continent_id` | `string` | **Required**. continent id |

```http
  GET /cricket.sportmonks.com/api/v2.0/continents/:continent_id
```

### Get contries
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |
| `country_id` | `int` | **Required**. country id |

```http
  GET /cricket.sportmonks.com/api/v2.0/continents/country_id
```
### Get leagues
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |
| `league_id` | `int` | **Required**. league id |

```http
  GET /cricket.sportmonks.com/api/v2.0/leagues/league_id
```

### Get Fixtures
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |
| `fixture_id` | `int` | **Required**. fixture id |
| `include` | `[string]` | **Required**. fields |
| `sort` | `string` | **Optional**. fields |
| `filter` | `[string]` | **Optional**. parameters |

```http
  GET /cricket.sportmonks.com/api/v2.0/leagues/league_id
```

### Other endpoints


| Sl No | Entity/Module                              | HTTPMethod | Purpose                                                                         | URL                                                                                                                                                                                                | Parameters                                                                 |
|:------|:-------------------------------------------|:-----------|:--------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------|
| 1     | Search All Series                          | GET        | To see all the series of the series of a season                                 | https://cricket.sportmonks.com/api/v2.0/leagues?sort=-updated_at&api_token={API_KEY}                                                                                                               | NIL                                                                        |
| 2     | Search All Finished Matches                | GET        | To seel all the finished matches                                                | https://cricket.sportmonks.com/api/v2.0/fixtures?include=visitorteam,localteam,runs,venue&sort=-updated_at&filter[status]=Finished&api_token={API_KEY}                                             | visitorteam,localteam,runs,venue                                           |
| 3     | See Score of a match                       | GET        | To see the score of a particular match based on its fixture id                  | https://cricket.sportmonks.com/api/v2.0/fixtures/[FIXTURE_ID]?sort=-updated_at&include=batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stage&api_token={API_KEY}             | batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stag |
| 4     | See the lineup of a team                   | GET        | To see the line up of a team based on the fixture id of a team                  | https://cricket.sportmonks.com/api/v2.0/fixtures/:[FIXTURE_ID]?include=lineup&api_token={API_KEY}                                                                                                  | lineup                                                                     |
| 5     | List of all match                          | GET        | To generate the list of all matches including previous and upcoming             | https://cricket.sportmonks.com/api/v2.0/fixtures?include=runs,localteam,visitorteam&api_token={API_KEY}&sort=-updated_at                                                                           | uns,localteam,visitorteam,updated_at                                       |
| 6     | List of all live matches on a specific day | GET        | To see all the live matches of a particular day that are on air at that moment  | https://cricket.sportmonks.com/api/v2.0/fixtures?filter[status]=Finished&include=localteam,visitorteam,league,runs&sort=season_id&api_token={API_KEY}                                              | visitorteam,localteam,runs,venue,updated_at                                |
| 7     | List of all upcoming matches               | GET        | To see all the upcoming matches that will be aired in the future                | https://cricket.sportmonks.com/api/v2.0/fixtures?fields[teams]=code,name,image_path&fields[fixtures]=id,type,starting_at&filter[status]=NS&include=localteam,visitorteam,venue&api_token={API_KEY} | id,type,starting_at,NS,localteam,visitorteam,venue                         |
| 9     | Ranking of top countries                   | GET        | To see the list of top ranked countries of TEST, ODI, T20 matches               | https://cricket.sportmonks.com/api/v2.0/team-rankings?api_token={API_KEY}                                                                                                                          | NIL                                                                        |
| 10    | League wise all matches                    | GET        | To see league wise all the the matches from the api                             | https://cricket.sportmonks.com/api/v2.0/fixtures?filter[status]=Finished&include=localteam,visitorteam,league,runs&sort=season_id&api_token={API_KEY}                                              | status,localteam,visitorteam,league,runs,season_id                         |




## Screenshots
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.07.37.png?token=GHSAT0AAAAAAB7NDM6IJH4VMJQKUPHROOCYY764W3A)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.07.40.png?token=GHSAT0AAAAAAB7NDM6IWI74DWY4WUKLY4MUY764ZSQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.07.53.png?token=GHSAT0AAAAAAB7NDM6ISAE5GMEK34JAJVVWY7644PQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.07.53.png?token=GHSAT0AAAAAAB7NDM6JTF6PJPUQHHSKPYKCY7645SQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.06.png?token=GHSAT0AAAAAAB7NDM6JTBSYOY67WEGQ7IIQY7646JQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/live%202.png?token=GHSAT0AAAAAAB7NDM6IJLTTOVDDGL4YZ3TSY765ALA)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.52.png?token=GHSAT0AAAAAAB7NDM6IJFEEKGTH2GGWYQWIY765BDQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.52.png?token=GHSAT0AAAAAAB7NDM6IXAWCR7UC764FIJUSY765B4A)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.44.png?token=GHSAT0AAAAAAB7NDM6IYYF57DLDMZBXCRLWY765CVA)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.12.png?token=GHSAT0AAAAAAB7NDM6JFVI3AE6MGLKIG3IIY765DLQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.22.png?token=GHSAT0AAAAAAB7NDM6IMFAHMEPTFEJCUU5MY765FIQ)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.37.png?token=GHSAT0AAAAAAB7NDM6J3KRH366DAW4D2PBGY765FWA)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.22.png?token=GHSAT0AAAAAAB7NDM6JBDDUSBUXKOLUEQAAY765H3Q)
![App Screenshot](https://raw.githubusercontent.com/saifrahmania/CrickFeed/937d6a3f4924cc820ce794470ca14c756ab6e312/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-02-26%20at%2022.08.37.png?token=GHSAT0AAAAAAB7NDM6IRN6DQ6Z6VMXWIDXMY765IIQ)