//
//  QuizView.swift
//  newApp
//
//  Created by Neha Lalani on 11/2/22.


import SwiftUI
import Firebase
import newApp


let data = DataLoader().userData
let userD = DataLoader().userD
var seen = DataLoader().seen

struct QuizView: View {
   
   // typealias Body = <#type#>
    @State var backDeg = 90.0
    @State var frontDeg = 0.0
    @State var isFlipped = false
    @State var question: String = data[Int.random(in: 1..<5140)].Question
    @State var answer: String = data[Int.random(in: 1..<5140)].Answer



    let durationAndDelay: CGFloat = 0.2
    
    @State var questionNum = 0
    
    

    var body: some View {
            ZStack {
                //var num = Int.random(in: 1..<5140)
                //seen.append(UserData(Question: data[num].Question, Answer: data[num].Answer, Chapter: ""))
                Button("Next") {
                    if(isFlipped == false) {
                        flipCard()
                        isFlipped.toggle()
                    }
                    var num = Int.random(in: 1..<5140)
                    question = data[num].Question
                    answer = data[num].Answer
                    seen.append(UserData(Question: data[num].Question, Answer: data[num].Answer, Chapter: ""))
                    write()
                }.offset(x: 130, y:380)
                //.onTapGesture(perform: <#T##() -> Void#>)
                CardFront(degree: $frontDeg, textContext: question)
                CardBack(degree: $backDeg, textContext:  answer)
            }.onTapGesture {
                flipCard()
            }
        

    }
    
    func flipCard() {
        isFlipped.toggle()

        if isFlipped{
            withAnimation(.linear(duration: durationAndDelay)) {
                backDeg = 90

            }
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDeg = 0
            }

        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDeg = -90

            }
            withAnimation(.linear(duration: durationAndDelay)) {
                backDeg = 0
            }

        }
    }
    
    func write() {
        print("in writing")
        let db = Firestore.firestore()
        //for item in seen {
            // Get the document reference for the current user
            let userRef = db.collection("UserData").document(myGlobalVariable)
            
            // Create a new collection of questions and answers for this user
            let qaCollectionRef = userRef.collection("QuestionsAndAnswers")
            
            print("writing to firebase")
            // Write the data to the collection
        let data = ["Question": seen[seen.count-1].Question, "Answer": seen[seen.count-1].Answer]
            qaCollectionRef.addDocument(data: data)
       // }
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
