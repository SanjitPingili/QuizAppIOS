//
//  ContentView.swift
//  newApp
//
//  Created by Neha Lalani on 9/27/22.
//

import SwiftUI

struct ContentView: View {
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
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
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
        
//        VStack {
////            Image(systemName: "globe")
////                .imageScale(.large)
////                .foregroundColor(.accentColor)
//            Text("Welcome to TutorBot")
//                .padding(/*@START_MENU_TOKEN@*/.vertical, 5.0/*@END_MENU_TOKEN@*/)
//            Text("Sign In!")
//                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
//
//        }
//        .padding()
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
