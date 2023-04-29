# ITS-Swift-Team-Spring-2023
This repository tracks the development for a iOS quiz app. 
So far we've been using the latest version of Swift (5.7), Xcode version 14.0.1 and build it on any IOS device. 

## Setup
**App:** Download the latest Swift and Xcode version. After downloading both, clone this repo as a project and save it. After that, change the build device to ios device.

**Database:** We used a MongoDB Atlas cluster to store the generated questions and answers. To access the database, download MongoDB Compass [here](https://www.mongodb.com/try/download/compass). Since this is a cloud-based database, there is no need to download mongo itself. Connect to the database with the connection string:

- `mongodb+srv://quizAppMobileUser:xkLaBBaa1dTsZuX8@quizappdb.7ltdg.mongodb.net/test`

## Fall 2022 Team Members
- Zhen Hong Tan - Backend Team
- Avyesh Kapadia - Backend Team
- Devang Ajmera - Backend Team
- Sabina Ajjan - Algorithms Team
- Rishi Nopany - Algorithms Team

## [Figma Link to Wireframing](https://www.figma.com/file/QxqNtFrd8C7XOSHJsooLfQ/SWIFT-App-Protype?node-id=0%3A1&t=qOEb56QCIo9ARpFr-0)

## NewAppApp.swift
- Loads the Log In page

## LogIn.swift
- Log in presents a log in page to the user which allows them to enter a valid username and password to access the app. It then presents a menu to the user where they are able to choose from multiple options such as settings, flashcards, quizzes, saved questions, and progress. This file also contains a large portion of the flashcard code which is part of the multiple options presented to the user. 

## QuizView.swift
- Loads the quiz content and the functionality of the flashcard such as flipping the flashcard. 


## Branch Organization
- The new main branch sould contain the most recent running code

## Algorithms

### KeyBERT
- KeyBERT is a keyword extraction tool that is implemented to make searching for questions easier and it utilizes BERT, a powerful bi-directional transformer model developed by Google used heavily in the fields of natural language processing (NLP).
- In order to run the files, a virtual environment needs to be initialized followed by the installation of the pip package keyBERT.


