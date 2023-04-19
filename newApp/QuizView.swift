//
//  QuizView.swift
//  newApp
//
//  Created by Sanjit Pingili on 03/12/23.


import SwiftUI
//import RealmSwift
//let realmApp = RealmSwift.App(id: "application-0-usith")

let data = DataLoader().userData
var num = Int.random(in: 1..<5140)

/*struct QuizView: View {
    var body: some View {
        var num = Int.random(in: 1..<5140)
        var frontText = data[num].Question
        var backText = data[num].Answer
        Flashcard(front: {
            Text(frontText)
        }, back: {
            Text(backText)
        })
    }

}

struct Flashcard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.front = front
        self.back = back
    }
    
    var body: some View {
        ZStack{
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
                Text("Flashcards")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 500)
            }
            
            VStack {
                
                if flipped {
                    back()
                } else {
                    front()
                }
            }
            .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
            .padding()
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .overlay(
                Rectangle()
                    .stroke(Color.black, lineWidth: 4)
            )
            .padding()
            .onTapGesture {
                flipFlashcard()
            }
            .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
        }
    }
        func flipFlashcard() {
            let animationTime = 0.5
            withAnimation(Animation.linear(duration: animationTime)) {
                flashcardRotation += 180
            }
            
            withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
                contentRotation += 180
                flipped.toggle()
            }
        }
    }



struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
*/

struct QuizView: View {
    //let data = DataLoader().userData
    //@State var num = Int.random(in: 1..<5140)
    @State var frontText = data[num].Question
    @State var backText = data[num].Answer
    @State var flipped = false
    
    var body: some View {
        ZStack{
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
                Text("Flashcards")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 500)
            }
            
            VStack {
                if flipped {
                    Text(backText)
                } else {
                    Text(frontText)
                }
            }
            .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .padding()
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .overlay(
                Rectangle()
                    .stroke(Color.black, lineWidth: 4)
            )
            .padding()
            .onTapGesture {
                withAnimation {
                    flipped.toggle()
                }
            }
            
            VStack {
                Spacer()
                Button(action: {
                    num = Int.random(in: 1..<5140)
                    frontText = data[num].Question
                    backText = data[num].Answer
                    flipped = false
                }, label: {
                    Text("Next")
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.bottom, 150)
                })
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

