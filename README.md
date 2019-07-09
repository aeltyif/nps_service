# Net Promoter Scores Service

## Tech Stack
  - Ruby: 2.4
  - Ruby On Rails: 5.2.3
  - Database: Sqlite3
  - Caching: Default rails file caching

## Installation
```sh
git clone https://github.com/aeltyif/nps_service.git
cd nps_service
rails db:setup
rails s
```

## Please Note
  - Touchpoints are within inclusion on the model level to make sure no weird data gets inserted.
  - I have changed the column names [respondent_class object_class] to [respondent_type object_type] as i have used polymorphic association refere to the migration file please.
  - The error message for the wrong score has been changed as i'm using the native validators on the model.
  - Swagger is installed please navigate to http://localhost:3000 and you will be redirected to the documentation page.

## Todos
  - Create a trigger on the database level to prevent specific columns updates
  ```sh
  CREATE OR REPLACE FUNCTION fnprevent_update()
    RETURNS trigger AS
  $BODY$
      BEGIN
          RAISE EXCEPTION 'No data tampering is allowed';
      END;
  $BODY$
    LANGUAGE plpgsql VOLATILE
    COST 100;

  CREATE TRIGGER trg_prevent_update
  BEFORE UPDATE OF touchpoint, respondent_type, respondent_id, object_type, object_id
  ON net_promoter_scores
  FOR EACH ROW
  EXECUTE PROCEDURE fnprevent_update();
  ```
  - Use a real database engine like postgresql
  - Use proper caching to further enhance the service response time.
  - Write down a better integration test, controller specs currently covers for that.
