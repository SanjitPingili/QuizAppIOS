//
//  SearchPage.swift
//  newApp
//
//  Created by Samarth Parameswar on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    private var listOfsets = Sets
    private var listOfQuestions = Questions
    @State var searchText = ""

    var body: some View {
        // Move the initialization of `sets` and `Questions` here
        let sets: [String] = {
            // Make countries lowercased
            let lcSets = listOfsets.map { $0.lowercased() }
            return searchText == "" ? lcSets : lcSets.filter { $0.contains(searchText.lowercased()) }
        }()
        let questions: [String] = {
            // Make countries lowercased
            let lcQuestions = listOfQuestions.map { $0.lowercased() }
            return searchText == "" ? lcQuestions : lcQuestions.filter { $0.contains(searchText.lowercased()) }
        }()

        return NavigationView {
            List {
                ForEach(sets, id: \.self) { set1 in
                    HStack {
                        Text(set1.capitalized)
                        Spacer()
                        Image(systemName: "studentdesk")
                            .foregroundColor(Color.blue.opacity(0.8))
                    }
                    .padding()
                }
                ForEach(questions, id: \.self) { set1 in
                    HStack {
                        Text(set1.capitalized)
                        Spacer()
                        Image(systemName: "pencil")
                            .foregroundColor(Color.blue.opacity(0.8))
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Let's Study")
        }
    }
    
}

struct New: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
