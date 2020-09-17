# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

  - Room, has many Tasks.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

  - Task, belong to User.
  - Room, belongs to User.

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

  - User: has many tasks, through rooms
  - User: has many helped_tasks, through user_tasks

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

  - Task: has many helpers, through user_tasks.
  - User: has many helped_tasks, through user_tasks.

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

  - The User can sign up to another user's task they requested help for.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

  - Validations are present to make sure all forms must be filled out before submitted.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

  - '/needs_help' is available for users to access the list of tasks that other user's need help with.
  - calls scope method in NeedsHelpController and uses on the 'needs_help/index'

- [x] Include signup: DEVISE

- [x] Include login: DEVISE

- [x] Include logout: DEVISE

- [x] Include third party signup/login (how e.g. Devise/OmniAuth) : Google-OAuth2

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

  - '/rooms/:id/tasks' : index

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- '/rooms/:id/task

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

  - '/layouts/errors' displays errors if the params are not met.

Confirm:

- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
