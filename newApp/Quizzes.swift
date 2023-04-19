//
//  Quizzes.swift
//  newApp
//
//  Created by Sanjit Pingili on 4/19/23.
//

import Foundation
import SwiftUI

struct Quizzes: View {
    @State private var selectedAnswerIndex: Int?
    var num = Int.random(in: 1..<5140)
    var arr = [String]()

    init() {
        let correctAnswer = ques[num].Answer
        var choices = [correctAnswer]
        while choices.count < 4 {
            let randomIndex = Int.random(in: 1..<5140)
            let randomAnswer = ques[randomIndex].Answer
            if !choices.contains(randomAnswer) {
                choices.append(randomAnswer)
            }
        }
        arr = choices.shuffled()
    }

    func getButtonBackground(for index: Int) -> Color {
        if let selected = selectedAnswerIndex {
            if index == selected {
                if arr[selected] == ques[num].Answer {
                    return Color.green
                } else {
                    return Color.red
                }
            }
        }
        return Color.blue
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
                ForEach(arr.indices, id: \.self) { index in
                    Button(action: {
                        selectedAnswerIndex = index
                    }) {
                        Text(arr[index])
                            .foregroundColor(.black)
                            .frame(width: 300, height: 50)
                            .background(getButtonBackground(for: index))
                            .cornerRadius(10)
                            .padding(.vertical)
                    }
                }
            }
            HStack {
                Button("Save") {
                    //add to a list of saved questions that need to be reviewed
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
