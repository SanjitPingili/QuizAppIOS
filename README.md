# ITS-Swift-Team-Spring-2023
This repository tracks the development for a iOS quiz app. 
So far we've been using the latest version of Swift (5.7), Xcode version 14.0.1 and build it on any IOS device.
 
## Branch Organization
- The branch called Zhen contains the most recent running code for the backend Swift Team.

## Setup
**App:** Download the latest Swift and Xcode version. After downloading both, clone this repo as a project and save it. Open the project from the file called **newApp.xcworkspace**. After that, change the **build device to ios device**.

**Database:** We used a MongoDB Atlas cluster to store the generated questions and answers. To access the database, download MongoDB Compass [here](https://www.mongodb.com/try/download/compass). Since this is a cloud-based database, there is no need to download mongo itself. Connect to the database with the connection string:

- `mongodb+srv://quizAppMobileUser:xkLaBBaa1dTsZuX8@quizappdb.7ltdg.mongodb.net/test`

We used GCP Firebase as the main database for storing user profile data. Login to [here](https://firebase.google.com/) and login with the details below. Then go to swift-backend(swift-backend-3623b) -> Firestore Database.

Gmail: vipitsgpt@gmail.com

Password: @abc1234

## Spring 2023 Team Memebrs
- Sanjit Pingili - Frontend Team
- Sahana Krishnan - Frontend Team
- Varun Patel - Frontend Team
- Sakshi Deshpande - Frontend Team
- Zhen Hong Tan - Backend Team
- Alvin Fabrio - Backend Team
- Rishi Nopany - Backend Team
- Devang Ajmera - Backend Team
- Samarth Parameswar - Backend team

## [Figma Link to Wireframing](https://www.figma.com/file/QxqNtFrd8C7XOSHJsooLfQ/SWIFT-App-Protype?node-id=0%3A1&t=qOEb56QCIo9ARpFr-0)

## NewAppApp.swift
- Loads the Log In page

## LogIn.swift
- Log in presents a log in page to the user which allows them to enter a valid username and password to access the app. It then presents a menu to the user where they are able to choose from multiple options such as settings, flashcards, quizzes, saved questions, and progress. This file also contains a large portion of the flashcard code which is part of the multiple options presented to the user. 

## QuizView.swift
- Loads the quiz content and the functionality of the flashcard such as flipping the flashcard, and going to the next question. 
- Perform write into the database whenever a user reads a new flashcard.

## DataLoader.swift
- Establish connection to the firebase.
- Perform read and write to the firebase.

## Quizzes.swift
- Loads the multiple choice quiz screen and display questions to the user. Questions can be randomized or fetch from the database from the specific user.




