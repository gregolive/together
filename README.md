# Together Social

A social media app reminiscent of Facebook that allows users to add text/image posts and add friends. Posts can be liked, commented on and comments can be commented on (2 levels of nesting).

## Live demo

Avaliable via [Heroku](https://together-social.herokuapp.com/) 👈

## Features

### 1) Interface:
- Unless a user is currently logged in, the root redirects to the user sign in page where they can either sign in with email, create a new account or continue with Facebook.
- The **navbar** contains a link to the homepage on the left and on the right a link to the current user's page, an add freinds button and a logout button.
- The **homepage** contains 3 columns:
  - In the middle contains a form to create a new post and a feed of posts by the current signed in user and their friends. The posts contain a form to add a comment, the most recent comment, and buttons like and view the post.
  - On the left is a list of the 5 "top posts" or the posts from the current user and their friends with the most comments and likes.
  - On the right is a list of friend suggestions and if the user has any friend requests they will appear here as well.
- A **post page** shows the post, author, time of posting, a form to add a comment and a list of all comments. The top level comments can also be replied to by clicking the reply button which uses javascript to display a comment reply form. Parent comments and replies can be liked. 
- Posts, comments and replies by the current user display buttons for deleting and editing the content.
- Post and comment forms utilize the simple_form gem.
- The **user page** of the <em>current user</em> contains:
  - A bar with their profile picture, name, number of friends and a link to edit their information.
  - A form to create a new post and the user's past posts in the middle.
  - Links to the user's top 5 posts in the left column.
  - Up to 3 friend suggestions and a list of their current friends in the right column.
- The **user page** of <em>another user</em> contains:
  - A bar with their profile picture, name, number of friends, number of mutual friends and a link/information about their relationship to the current user (see Friends section below).
  - The user's past posts in the middle.
  - Links to the user's top 5 posts in the left column.
  - A list of their current friends in the right column.

### 2) Friends:
- User's can add friends via friend suggestions found on the homepage and their user page or via the "Add Friends" button in the navbar.
- The add freinds page contains a list of all the users and their relation to the user with accompanying button(s)/information.
- There are 4 possible relationships between 2 users:
  1. **Friend**: The users are frineds and this will be displayed in green text with a check mark.
  2. **Friend request pending**: The current user has added another user as a friend. Displayed in orange text.
  3. **Incoming friend request**: Another user has added the current user as a friend and the current user is provided with 2 buttons to accept or decline the request.
  4. **No relationship**: A button is displayed to the current user so they can add a user as a friend.

### 3) Styling:
- HTML and CSS framework via Bulma rails gem.

### 4) User authentication:
- Devise gem for account setup/management, authenticating user on app start up, etc.
- Omniauth Facebook gem allows for sign-in via the facebook API and integration with Devise. The app receives the user's name, email, password and profile pcture from Facebook.
- Figaro gem for creating API environment variables in gitignore.

### 5) Images and avatars:
- In development to the local disk images and user avatars are saved to the local disk.
- In production images are saved with AWS S3 cloud storage using the aws-sdk-s3 gem.
- Resizing images is done via the image_processing gem's variant method.

### 5) Mailer:
- Upon signup a mailer is used to send a welcome email to the user and confirm their account creation. 
- In development the letter_opener gem is used to view the mail.
- In production...

## To do

Add Javascript for:
- Adding likes and comments without page refresh
- Displaying uploading file names beside the Bulma upload button

Other:
- Search functionality for add friend page
- Friend suggestions based on number of mutual friends

## Ruby version

2.7.4