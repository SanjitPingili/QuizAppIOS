//
//  ContentView.swift
//  newApp
//
//  Created by Neha Lalani on 9/27/22.
//

import SwiftUI
let ques = DataLoader().userData

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
    @State private var goSettings = false
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
                    
                    Button("Settings") {
                        //Check if user exists
                        goSettings = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    
                    NavigationLink(destination: Settings(), isActive: $goSettings) {
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
                    
                    
                    NavigationLink(destination: QuizView(), isActive: $goFlashcards) {
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
                    
                    NavigationLink(destination: SavedQuestions(), isActive: $goSaved) {
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

                    NavigationLink(destination: Progress(), isActive: $goProgress) {
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
        @State private var isTrue = false
        /**
                    First get a question and answer, then get another 3 random answers from the database. Store all answers in array and shuffle it to display to the screen.
         */
        var num = Int.random(in: 1..<5140)
        var arr = [String]();
        init() {
            var choice1 = ques[num].Answer
            var choice2 = ques[Int.random(in: 1..<5140)].Answer
            var choice3 = ques[Int.random(in: 1..<5140)].Answer
            var choice4 = ques[Int.random(in: 1..<5140)].Answer
            arr.append(choice1)
            arr.append(choice2)
            arr.append(choice3)
            arr.append(choice4)
        }

        var body: some View {
            NavigationView {
                VStack{
                
                VStack {
                    Text(ques[num].Question)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .bold()
                        .padding(.bottom, 50.0)
                }
                    VStack {
                        
                        Button(arr[0]) {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        
                        Button(arr[1]) {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        
                        
                        Button(arr[2]) {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        
                        Button(arr[3]) {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                    }
                    HStack {
                        Button("Save") {
                            //add to a list of saved questions that need to be reviewd
                        }
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        Button("Next") {
                            //goes to next question
                        }
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                    }
                }
            }
        }
    }

    struct Settings: View {
        var body: some View {
            NavigationView {
                VStack {
                    List {
                        Text("View Profile")
                        Text("Change  Username")
                        Text("Change Password")
                        Text("Dark Mode")
                        Text("App Version")
                        Text("Privacy")
                        Text("About")
                    }
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


//new flash cards implementation

struct CardFront: View {
    @Binding var degree : Double
    let textContext : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).stroke(.green.opacity(0.5), lineWidth: 10).padding()
            
            RoundedRectangle(cornerRadius: 20).stroke(.green.opacity(0.5), lineWidth: 10).padding()
            
            VStack {
                Text("Question:")
//                Text("New question 1")
                
                Text (textContext)
                    .lineLimit(10)
//                Text("answer here")
                
            }
        } .rotation3DEffect(Angle(degrees: degree), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}





struct CardBack: View {
    @Binding var degree : Double
    let textContext : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).stroke(.green.opacity(0.5), lineWidth: 10).padding()
            
            RoundedRectangle(cornerRadius: 20).stroke(.green.opacity(0.5), lineWidth: 10).padding()
            
            VStack {
//                Text("Question:")
//                Text("New question 1")
                
                Text (textContext)
                    .lineLimit(10)
                //Text("answer here")
                
            }
        } .rotation3DEffect(Angle(degrees: degree), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

