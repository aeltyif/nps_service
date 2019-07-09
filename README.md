# Net Promoter Scores Service

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/336f43606d994235ba730d6faa56d799)](https://www.codacy.com/app/aeltyif/nps_service?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=aeltyif/nps_service&amp;utm_campaign=Badge_Grade)

## Tech Stach
- Ruby: 2.4
- Ruby On Rails: Rails 5.2.3
- Database: Sqlite3
- Caching: Default rails file caching

## Installation
```sh
$ git clone https://github.com/aeltyif/nps_service.git
$ cd nps_service
$ rails db:create db:migrate
$ rails s
```

## Usage
* You will notice that swagger is installed you don't need to do anything just navigate to locahost:3000, and you will be redirected to the documentation page.
* Please note that in order to create your first nps, you are required to create a Seller record & a Realtor record

### Todos
- Create a trigger on the database level to prevent specific columns updates
- Use a real database engine like postgresql
- Use proper caching to further enhance the service response time.
- Write down a better integration test, controller specs currently covers for that.
