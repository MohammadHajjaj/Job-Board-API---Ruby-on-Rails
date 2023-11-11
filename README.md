Job Board App
--------------
This repository contains the backend implementation for a job board application built with ruby on rails

### Setup

**Running the app on local machine**

1. Install required Ruby gems:
```
bundle install
```

2. Create and set up the database
```
rails db:create
rails db:migrate
rails db:seed
```
an admin user will automaticcly be created at this point 
email: "admin@admin.com"
password": "admin123"

3.  Start the application server:
```
rails server
```

the application should now be accessible at http://localhost:3000.

### API endpoints

The app has the following API endpoints:

-   `POST /auth`: sign up a new user.
```
body: 
{
    "email": "user5@example.com",
    "password": "password123",
    "password_confirmation": "password123"
}
```
-   `GET /auth/sign_in`: sign in with a user
```
body:
{
        "email": "admin@admin.com",
        "password": "admin123"

}
auth token is created and can be found at Authorization in response headers
```
-   `GET /job_posts`: get all job posts.
-   `GET /job_applications`: get all job applications
-   `GET /job_posts/:id`: get job post by id.
-   `GET /job_applications/:id`: get job application by id.
-   `POST /job_posts`: create new job post
```
body: 
{
  "job_post": {
    "title": "Your Job Title",
    "description": "Your job description goes here."
  }
}
```
-   `POST /job_applications`: create new job application
```
body: 
{
  "job_application": {
    "status": "Not Seen",
    "job_post_id": 1 
  }
}
```
-   `PUT /job_posts/:id`: update a job post
-   `DELETE /job_posts/:id`: delete a job post

