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

struct QuizView: View {
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
   /*
   // typealias Body = <#type#>
    @State var backDeg = 90.0
    @State var frontDeg = 0.0
    @State var isFlipped = false


    let durationAndDelay: CGFloat = 0.2

    @State var questionNum = 0

    var body: some View {
        /*
        let realm = try! Realm()
        var token: NotificationToken?
        // Read from realm
        try! realm.write {
            realm.write()
        }

        //  Set up the listener & observe object notifications.
        token = realm.observe { change in
            switch change {
            case .change(let properties):
                for property in properties {
                    print("Property '(property.name)' changed to '(property.newValue!)'");
                }
            case .error(let error):
                print("An error occurred: (error)")
            case .deleted:
                print("The object was deleted.")
            }
        }
         */
            ZStack {
                var num = Int.random(in: 1..<5140)
                Button("Next") {
                }.offset(x: 130, y:380)
                //.onTapGesture(perform: <#T##() -> Void#>)
                CardFront(degree: $frontDeg, textContext: data[num].Question)
                CardBack(degree: $backDeg, textContext:  data[num].Answer)
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




*/

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
