
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



![App Screenshot](https://i.ibb.co/q7wSyxj/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-08-52.png)
![App Screenshot](https://i.ibb.co/QM3PKyX/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-08-37.png)

![App Screenshot](https://i.ibb.co/jR4vjZh/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-08-22.png)

![App Screenshot](https://i.ibb.co/zRz5P0n/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-08-12.png)

![App Screenshot](https://i.ibb.co/XbsswQc/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-08-06.png)

![App Screenshot](https://i.ibb.co/Nxpk6nS/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-08-00.png)

![App Screenshot](https://i.ibb.co/hm0cH2g/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-07-53.png)

![App Screenshot](https://i.ibb.co/S6tGnSd/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-07-40.png)

![App Screenshot](https://i.ibb.co/L6GV12L/Simulator-Screen-Shot-i-Phone-14-Pro-2023-02-26-at-22-07-37.png)

![App Screenshot](https://i.ibb.co/K0fX3py/live-2.png)

![App Screenshot](https://i.ibb.co/SRZ6Bwn/live.png)








