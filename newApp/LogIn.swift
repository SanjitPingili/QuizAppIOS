//
//  ContentView.swift
//  newApp
//
//  Created by Neha Lalani on 9/27/22.
//

import SwiftUI

struct LogIn: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.4))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.4))
                Circle()
                    .scale(1)
                    .foregroundColor(.white)
                VStack {
                    Text("Welcome to TutorBot")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 2.0)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login") {
                        //Check if user exists
                        checkUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Home(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    func checkUser(username: String, password: String) {
        //add check for usernames
        if username.lowercased() == "test" {
            wrongUsername = 0
            if password.lowercased() == "password" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
        

}

struct Home: View {
    @State private var goFlashcards = false
    @State private var goQuizzes = false
    @State private var goProgress = false
    @State private var goProfile = false
    @State private var goSaved = false
    var body: some View {
        NavigationView {
            VStack{
            
            VStack {
                Text("Menu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .bold()
                    .padding(.bottom, 50.0)
            }
                VStack {
                    
                    Button("Profile") {
                        //Check if user exists
                        goProfile = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    
                    NavigationLink(destination: Flashcards(), isActive: $goProfile) {
                        EmptyView()
                    }
                    .padding(.vertical)
                    
                    Button("Flashcards") {
                        //Check if user exists
                        goFlashcards = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    
                    NavigationLink(destination: Flashcards(), isActive: $goFlashcards) {
                        EmptyView()
                    }
                    .padding(.vertical)
                    
                    
                    Button("Quizzes") {
                        //Check if user exists
                        goQuizzes = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Quizzes(), isActive: $goQuizzes) {
                        EmptyView()
                    }
                    .padding(.vertical)
                    
                    Button("Saved Questions") {
                        //Check if user exists
                        goSaved = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Flashcards(), isActive: $goSaved) {
                        EmptyView()
                    }
                    .padding(.vertical)
                    
                    Button("Progress") {
                        //Check if user exists
                        goProgress = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Flashcards(), isActive: $goProgress) {
                        EmptyView()
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}
    
    struct Flashcards: View {
        var body: some View {
            NavigationView {
                ZStack {
                    Rectangle()
                        .scale(0.3)
                }
            }
        }
    }
    
    struct Quizzes: View {
        var body: some View {
            NavigationView {
                ZStack {
                    Rectangle()
                        .scale(0.3)
                }
            }
        }
    }
    
    struct Profile: View {
        var body: some View {
            NavigationView {
                ZStack {
                    Rectangle()
                        .scale(0.3)
                }
            }
        }
    }
    
    struct SavedQuestions: View {
        var body: some View {
            NavigationView {
                ZStack {
                    Rectangle()
                        .scale(0.3)
                }
            }
        }
    }
    
    struct Progress: View {
        var body: some View {
            NavigationView {
                ZStack {
                    Rectangle()
                        .scale(0.3)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            LogIn()
        }
    }

