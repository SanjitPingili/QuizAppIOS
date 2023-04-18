//
//  SavedQuestions.swift
//  newApp
//
//  Created by Varun Patel on 4/18/23.
//

import Foundation
import SwiftUI
struct SavedQuestions: View {
    @State private var flag = false
    var body: some View {
        // NavigationView {
        VStack {
            List {
                Button("Flagged Questions") {
                    flag = true;
                }
                .foregroundColor(.black)
                .frame(width: 300, height: 50)
                .background(Color.orange)
                .cornerRadius(10)
                
//                    NavigationLink(destination: SavedView(), isActive: $flag) {
//                        EmptyView()
//                    }
                Button("Incorrect Questions") {
                    //Check if user exists
                }
                .foregroundColor(.black)
                .frame(width: 300, height: 50)
                .background(Color.orange)
                .cornerRadius(10)
            }
        }
        
    }
}


