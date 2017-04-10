How to approach an app
 - Start with reviewing the requirements
 - Look for nouns/verbs to try to highlight possible objects/models, their behavior and relationships
 - Sketch a design
 - Sketch a data model
 - Implement a static version of the design in HTML + CSS
 - Turn that static design into a dynamic design

Migrations
 - Once a migration is created/shared with others we cannot (should not) change it
 - Migrations once run through `rails db:migrate` can be redone if we rollback the migration and then re-migrate after changing the migration file
   - But this can be a little tricky
 - Use a new migration to adjust the column/table

Routes
 - custom member/collection route
 - root route
 - Static home page

Assets
 - `scss`
 - `@import`
 - Don't throw styles in application.scss
 - `image_tag`
 - `image-url` scss helper
 - Don't override bootstrap

Bootswatch
 - [bootswatch.com](https://bootswatch.com)
 - Sometimes these themes don't work 100% and need a little adjusting.
