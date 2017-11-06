# Resources for a smart site

This package has migrations to create a database structure as laid out below.
https://www.lucidchart.com/documents/edit/71dbbb57-0b47-4495-8f87-41d5ba31bbc8

It uses sequelize to run migrations



### NOTES
all sql queries located in ./migrations/resource_functions_down & resource_functions_up must be broken up in their files by two lines. ie
```sql
INSERT INTO resources (name) VALUES('sectionals');

INSERT INTO resources (name) VALUES('products');
```