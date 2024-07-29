# Courier Service App - Tharusha Jayasooriya

## Installation

 

1. Clone the repo 

2. Make sure docker and docker compose is installed and docker service is running 
	Follow this [link](https://docs.docker.com/compose/install/) for a guide.

4. Run the following commands (some bugs with docker needs certain package versions)

    pip uninstall requests
    pip install requests=2.31.0
    pip install 'urllib3<2'

4. Finally run this command from the project root (parent of api and client)

    docker-compose up --build

*Please note that docker downloads arround 200MB of images, and the full process downloading images, verifying and building can take upto 10 mins. If this is inconvinient please drop me a email (tharushamjayasooriya@gmail.com) I can send manual intructions as well.*

That should be it,

After that, the frontend should be accessible on 
http://localhost:3000

(The backend is accessible via http://localhost:5000)


## How it works

## Authentication

Authentication is done entirely using JWT with the **Request-Access token model**. 

When a new user sign-up user details are stored in the database. **Password is hashed with bcrypt before storing for added security.** 

Request token is also generated upon sign-up and ,
1. Gets stored in the dB
2. Stored as a http only cookie on user browser.

This means client side **JS can't access the refresh token at all** since it's only stored as a http only cookie on client side.

Access token are generated when a signed up use sign into the application.

This **access token ONLY remains in web application memory as react state**. This is to ensure common attacks like session hijacking is impossible. 

Access token expire every 30mins, 
While refresh token expire every 30days.

With every request the client makes, axios middlewhere is used to put the access token as authentication headers. 

In the backend all routes that needs verification goes through a express middlewhere called "verify" (can be found in api/auth/auth.ts). 
It does these processes.

1. It will verify the access token, and only let the user access resources that the user supposed to. 

2. It will also send a new access token if the Access token is expired. 

3. If the user refresh the browser the access token is lost, but the refresh token remains as a cookie. Verify will then verify the refresh token and provide the user with a new access token. 

4. Since access token also includes information about the privilege level it will also make sure only admins can access/performance certain actions.
 

## Persistent login

If the user refresh the browser after loggin in the access token is lost, but the refresh token remains as a cookie. Verify middlewhere will then verify the refresh token and provide the user with a new access token. 

## Database

I decided to use Prisma ORM because,

1. The entire project is type safe, Prisma allows the database communications to also be type safe.
2. Reduce the risk of sql injection attacks.
3. Productivity and developer experience

## Users

The docker setup will also add some dummy data to the db as well. I used one of my [previous projects](https://github.com/Tharusha-dev/GoProfileFromSeed/tree/main/data/by_region/LK) for the data. All users I made have a made up email domain called csa (courier service app). The admin user have a bunch of shipments as well, so its a good place to start.

Admin user :

Email : admin@csa.com

Password: 12345

## P.S.

I mistakenly had two separate git, for client and api. So I also uploaded them separately to GitHub so you can see the commit history using GitHub.

Client 
API 


Secret keys for JWT are hardcoded and obviously needs to be more secure than "mySecretKey" in a production version. 


