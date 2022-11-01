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
                Text("Options")
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
                    
                    
                    NavigationLink(destination: Profile(), isActive: $goProfile) {
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
                    
                    
                    NavigationLink(destination: CardFront(), isActive: $goFlashcards) {
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
        var body: some View {
            NavigationView {
                VStack{
                
                VStack {
                    Text("Question")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .bold()
                        .padding(.bottom, 50.0)
                }
                    VStack {
                        
                        Button("Answer Choice 1") {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        
                        Button("Answer Choice 2") {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        
                        
                        Button("Answer Choice 3") {
                            //Check if user exists
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.vertical)
                        
                        Button("Answer Choice 4") {
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


//flipping the flashcard code
//implement to new page

//struct NewCards<Front, Back> : View where Front: View, Back: View {
//    var front: () -> Front
//    var back: () -> Back
//
//    @State var flipped: Bool = false
//    @State var flashcardRotation = 0.0
//    @State var contentRotation = 0.0
//
//    init (@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
//        self.front = front
//        self.back = back
//    }
//
//    var body: some View {
//        ZStack {
//            if flipped {
//                back()
//
//            } else {
//                front()
//            }
//        }
//        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
//        .padding()
//        .frame(height: 200)
//        .frame(maxWidth: .infinity)
//        .background(Color.white)
//        .overlay(
//            Rectangle()
//                .stroke(Color.black, lineWidth: 2)
//
//        )
//        .padding()
//        .onTapGesture {
//            flipFlashcard()
//        }
//        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
//    }
//
//    func flipFlashcard() {
//        let animationTime = 0.5
//        withAnimation(Animation.linear(duration: 0.5)) {
//            flashcardRotation += 180
//            flipped.toggle()
//
//        }
//        withAnimation(Animation.linear(duration: 0.001).delay(animationTime/2)) {
//            contentRotation += 180
//            flipped.toggle()
//        }
//    }
//
//
//}
//


//new flash cards implementation

struct CardFront: View {
//    var degree : Double
//    let textContext : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).stroke(.green.opacity(0.5), lineWidth: 10).padding()
            
            RoundedRectangle(cornerRadius: 20).stroke(.green.opacity(0.5), lineWidth: 10).padding()
            
            VStack {
                Text("Question:")
                    Text("New question 1")
                
//                Text (textContext)
//                    .lineLimit(10)
//                    Text("answer here")
        
        }
            
            
        }
    }
}

//struct CardFront_Previews : PreviewProvider {
//    static var previews: some View {
//        CardFront(degree: 0.0, textContext: "Question string goes here")
//    }
//}
