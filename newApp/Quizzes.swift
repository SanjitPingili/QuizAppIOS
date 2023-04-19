//
//  Quizzes.swift
//  newApp
//
//  Created by Varun Patel on 4/18/23.
//

import Foundation
import SwiftUI

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
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical)
                
                Button(arr[1]) {
                    //Check if user exists
                }
                .foregroundColor(.black)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical)
                
                
                Button(arr[2]) {
                    //Check if user exists
                }
                .foregroundColor(.black)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical)
                
                Button(arr[3]) {
                    //Check if user exists
                }
                .foregroundColor(.black)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical)
            }
            HStack {
                Button("Save") {
                    //add to a list of saved questions that need to be reviewd
                }
                .foregroundColor(.black)
                .frame(width: 100, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical)
                
                Button("Next") {
                    //goes to next question
                    numQuestionsAnswered += 1 // update number of questions answered
                }
                .foregroundColor(.black)
                .frame(width: 100, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical)
            }
        }.navigationTitle(Text("Quizzes").font(.system(size: 56)))
    }
}
