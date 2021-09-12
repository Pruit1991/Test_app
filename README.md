# README

## Information about application undercover:

* Ruby version '2.7.3'

* Last version of Docker

* Configuration of environment in DockerFile and in DockerCompose.yml

* For creating database run in terminal(on your app directory)
`rails db:setup`

* To run the test suite print `rspec`

* To ispect application with rubocop run `rubocop`

* If you run app with docker, then run previous commands with `bin/compose-run` before commands

* If you want deploy your app to heroku, run `git push heroku`

* ...
# Test application
- This is test application created by Leskov Alexey.

## Features:
### User( by Devise):
  - sign up
  - login
  - logout
### Order:
  - creating by incoming parameters.
  - calculating distance and price for cargo.
  - with ActiveAdmin you can see list of all orders and change their status
 #### Organization:
  - creating organization with deafault role org_admin for creator.
  - inviting users to organization as operators of org_admins
  - org_admin can see list of orders of  all operators in current organization.
  - operators can see only their own orders.
 ## Other:
  #### Dockerization:
   - You can run this application in Docker.
   - For this you must install Docker on your mashine.
   - Then after cloning application u must run terminal on directory of app and run commands:
   `sudo docker-compose build` 
   `sudo  docker-compose up`
   -  also you can run doccker without root.How to do this in this link
    https://docs.docker.com/engine/security/rootless/
