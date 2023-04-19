//  QuizView.swift
//  newApp
//
//  Created by Sanjit Pingili on 03/12/23.

import SwiftUI

let data = DataLoader().userData
var num = Int.random(in: 1..<5140)

struct QuizView: View {
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
                ZStack {
                    Text(frontText)
                        .opacity(flipped ? 0 : 1)
                        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    Text(backText)
                        .opacity(flipped ? 1 : 0)
                        .rotation3DEffect(.degrees(flipped ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                }
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
