//
//  Quizzes.swift
//  newApp
//
//  Created by Zhen Hong Tan on 4/11/23.
//

import Foundation
import SwiftUI
import Firebase
import newApp

struct QuizzesView: View{
    @State private var isTrue = false
    @State var num = Int.random(in: 1..<5140)
    @State var count = 0
    @State var arr = [String]();
    @State var choice1 = ques[Int.random(in: 1..<5140)].Answer
    @State var choice2 = ques[Int.random(in: 1..<5140)].Answer
    @State var choice3 = ques[Int.random(in: 1..<5140)].Answer
    @State var choice4 = ques[Int.random(in: 1..<5140)].Answer
    @State var Question = ques[Int.random(in: 1..<5140)].Answer
    @State var correctAnswerIndex = 0
    
    init() {
        fetch()
        /*
        print("from func")
        print(userDataArray.count)
        if(userDataArray.count > 0) {
            Question = userDataArray[0].Question
            choice1 = userDataArray[0].Answer
            choice2 = ques[Int.random(in: 1..<5140)].Answer
            choice3 = ques[Int.random(in: 1..<5140)].Answer
            choice4 = ques[Int.random(in: 1..<5140)].Answer
            self.arr.append(choice1)
            self.arr.append(choice2)
            self.arr.append(choice3)
            self.arr.append(choice4)
            self.arr.shuffle()
        } else {
            Question = ques[num].Answer
            choice1 = ques[num].Answer
            print(choice1)
            choice2 = ques[Int.random(in: 1..<5140)].Answer
            choice3 = ques[Int.random(in: 1..<5140)].Answer
            choice4 = ques[Int.random(in: 1..<5140)].Answer
            self.arr.append(choice1)
            self.arr.append(choice2)
            self.arr.append(choice3)
            self.arr.append(choice4)
            self.arr.shuffle()
            for i in arr {
                print(i)
            }
        }
         */
    }
    func fetch() {
        let db = Firestore.firestore()
        let userDataRef = db.collection("UserData").document(myGlobalVariable)
        let questionsAndAnswersRef = userDataRef.collection("QuestionsAndAnswers")
        
        questionsAndAnswersRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    
                    let question = document.get("Question") as? String ?? ""
                    let answer = document.get("Answer") as? String ?? ""
                    let chapter = document.get("Chapter") as? String ?? ""
                    let userData = UserData(Question: question, Answer: answer, Chapter: chapter)
                    userDataArray.append(userData)
                }
            }
            print("From Fetch")
            print(userDataArray.count)
        }
        getQuestion()
    }
        
        func getQuestion() {
            print("From get question")
            print(userDataArray.count)
            if(userDataArray.count > count) {
                Question = userDataArray[count].Question
                choice1 = userDataArray[count].Answer
                choice2 = ques[Int.random(in: 1..<5140)].Answer
                choice3 = ques[Int.random(in: 1..<5140)].Answer
                choice4 = ques[Int.random(in: 1..<5140)].Answer
                self.arr.append(choice1)
                self.arr.append(choice2)
                self.arr.append(choice3)
                self.arr.append(choice4)
                self.arr.shuffle()
            } else {
                Question = ques[num].Answer
                choice1 = ques[num].Answer
                choice2 = ques[Int.random(in: 1..<5140)].Answer
                choice3 = ques[Int.random(in: 1..<5140)].Answer
                choice4 = ques[Int.random(in: 1..<5140)].Answer
                self.arr.append(choice1)
                self.arr.append(choice2)
                self.arr.append(choice3)
                self.arr.append(choice4)
                self.arr.shuffle()
            }
            count += 1
        }

    var body: some View {
        //NavigationView {
            VStack{
            
            VStack {
                Text(Question)
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .bold()
                    .padding(.bottom, 50.0)
            }
                VStack {
                    
                    Button(choice1) {
                        //Check if user exists
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.vertical)
                    
                    Button(choice2) {
                        //Check if user exists
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.vertical)
                    
                    
                    Button(choice3) {
                        //Check if user exists
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.vertical)
                    
                    Button(choice4) {
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
                        getQuestion()
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
