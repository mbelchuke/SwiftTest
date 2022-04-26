## Co3 Dynamicweb x Swift
This is the default codebase for Co3

It uses the newest stable Dynamicweb version and the newest stable Swift version

If you need features from a newer Dynamicweb version, feel free to upgrade once cloned to your local system.

## Install Node.js and build design

Swift uses webpack to calculate dependencies and bundle scripts, images and other assets. This means that the design must be built after being cloned:

1. Download and install [Node.js](https://nodejs.org/en/)
2. Open a command prompt and navigate to folder Swift is cloned to
3. Run `npm install`
4. Run `npm run build:webpack`
5. Run `npm run start`

## CI/CD

This project is automatically builded on our build server

## Log in and install a license

* After successfully connecting the database and solution you can go to ***yoururl.com/admin*** and log in with the administrator username and password.

* After logging in you will be asked to [Install a license](https://doc.dynamicweb.com/get-started/introduction/installation/installing-a-license "Install a license").  

* If you instead see the Dynamicweb Installer the database and solution are not correctly linked. Try recycling the application pool and trying again.