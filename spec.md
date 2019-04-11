# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app // Controllers inherit from Sinatra::Base
- [x] Use ActiveRecord for storing information in a database // Migrations for creating database tables inherit from ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) // 3 models: experience, location, user
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) // User has many experiences
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) // Experience belongs to a user
- [x] Include user accounts with unique login attribute (username or email) // Must signup and login to access
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying // Experiences can be created (/experiences/new.erb), read (/experiences/show_experience.erb), updated (experiences/edit_experience.erb), and destroyed via (/experiences/show_experience.erb)
- [x] Ensure that users can't modify content created by other users // Experience route will be redirected if user_id doesn't match current user id
- [ ] Include user input validations // Must have all fields for signup and login, must change city and country together, must fill out all fields when adding a new experience
- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message


DONE// Check that changing an experience with same name doesn't change other user's experience of same name, edit & status changes
Check that user cannot access other user's experience
Check that user cannot access other user's edit
Check that user cannot access other user's delete
