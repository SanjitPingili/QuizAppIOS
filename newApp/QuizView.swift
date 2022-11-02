//
//  QuizView.swift
//  newApp
//
//  Created by Neha Lalani on 11/2/22.


import SwiftUI


struct QuizView: View {
   // typealias Body = <#type#>
    @State var backDeg = 90.0
    @State var frontDeg = 0.0
    @State var isFlipped = false

    let durationAndDelay: CGFloat = 0.2

    @State var questionNum = 0


    var body: some View {

            ZStack {
                CardFront(degree: $frontDeg, textContext: "question here")
                CardBack(degree: $backDeg, textContext: "answer string")
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






}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {

        QuizView()
    }
}
