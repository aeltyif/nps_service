# Net Promoter Scores Service

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/336f43606d994235ba730d6faa56d799)](https://www.codacy.com/app/aeltyif/nps_service?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=aeltyif/nps_service&amp;utm_campaign=Badge_Grade)

## Tech Stach
  - Ruby: 2.4
  - Ruby On Rails: Rails 5.2.3
  - Database: Sqlite3
  - Caching: Default rails file caching

## Installation
```sh
git clone https://github.com/aeltyif/nps_service.git
cd nps_service
rails db:create db:migrate
rails s
```

## Please Note
  - I have changed the column names [respondent_class object_class] to [respondent_type object_type] as i have used polymorphic association refere to the migration file please.
  - The error message for the wrong score has been changed as i'm using the native validators on the model.
  - Swagger is installed please navigate to http://localhost:3000 and you will be redirected to the documentation page.
  - In order to create your first NPS, you are required to create a Seller record & a Realtor record
```sh
rails c
Seller.create!(name: 'Seller Name')
Realtor.create!(name: 'Realtor Name')
```

## Todos
  - Create a trigger on the database level to prevent specific columns updates
  ```sh
  CREATE OR REPLACE FUNCTION fnprevent_update()
    RETURNS trigger AS
  $BODY$
      BEGIN
          RAISE EXCEPTION 'no way';
      END;
  $BODY$
    LANGUAGE plpgsql VOLATILE
    COST 100;

  CREATE TRIGGER trg_prevent_update
  BEFORE UPDATE OF dependency1, dependency2
  ON topic
  FOR EACH ROW
  EXECUTE PROCEDURE fnprevent_update();
  ```
  - Use a real database engine like postgresql
  - Use proper caching to further enhance the service response time.
  - Write down a better integration test, controller specs currently covers for that.
