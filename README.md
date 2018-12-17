# Dockerised E2E Testing with Cocumber JS and Selenium Webdriver
This package allows to execute End-to-End tests without any local configurations.
It has been developed in a dockerised enviroment, in order to simplify the deployment phase and bypass all issues related to local web-drivers setup.

This tool uses selenium-cucumber-js library that offers some very useful helper methods. 

## Installation
- `npm install` or `yarn` 
- `npm run build:dev:image` to build docker image
- `npm run start` to start the sample defined tests

## Customise your tests
Edit `selenium-cucumber-js-docker.json` to change browser preferences.
It is also possible to edit `customDriver.js` or to use a different browser. Check `chromeMobile.js` and `chromeHeadless.js` for examples.
Please refer to [selenium-cucumber-js] (https://github.com/john-doherty/selenium-cucumber-js) library to customise your tests

## Writing Features and Step-Definitions
WIP

## Testing locally without Docker
This will allow to see real time previews for each definition step.
You will need to have a working webdriver installed on your machine installed (there should be no problem in a standard macOS setup). 
If you using a Linux machine (Debian/Ubuntu), you will probably need to install a `Java Runtime Environement` in order to run Selenium.
Latest Chrome and Firefox versions also provide an headless option.
To run local tests, without Docker: `npm run test` 

