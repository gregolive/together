# Together Social

A social media app reminiscent of Facebook that allows users to add text/image posts and add friends.

## Live demo

Avaliable via [Heroku](https://together-social.herokuapp.com/) 👈

## Features

Styling:
- HTML and CSS framework via Bulma rails gem 

User authentication:
- Devise gem for account setup/management, authenticating user on app start up, etc.
- Omniauth Facebook gem allows for sign-in via the facebook API and integration with Devise
- Figaro gem for creating API environment variables in gitignore

Images and avatars:
- 
- image_processing gem for resizing images

Other:
- simple_form gem



## To do

Add Javascript for:
- Adding likes and comments without page refresh
- Displaying uploading file names beside the Bulma upload button

## Ruby version

2.7.4