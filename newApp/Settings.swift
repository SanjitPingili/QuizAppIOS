//
//  Settings.swift
//  newApp
//
//  Created by Varun Patel on 4/18/23.
//

import Foundation
import SwiftUI
struct Settings: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var goChangeUsername = false
    @State private var goChangePassword = false
    @State private var goAbout = false
    @State private var goAppVersion = false
    @State private var goPrivacy = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Button("Change Username") {
                        //Check if user exists
                        goChangeUsername = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    Button("Change Password") {
                        //Check if user exists
                        goChangePassword = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)

                    Toggle(isOn: Binding<Bool>(
                            get: { self.colorScheme == .dark },
                            set: { _ in
                                if colorScheme == .light {
                                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                                } else {
                                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                                }
                            }
                        )
                    ) {
                        Text("Dark Mode")
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)

                    
                    NavigationLink(destination: Text("Your data is private"), isActive: $goPrivacy) {
                        Button("Privacy") {
                            goPrivacy = true
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: Text("Version 1.0"), isActive: $goAppVersion) {
                        Button("App Version") {
                            goAppVersion = true
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                    }

                    NavigationLink(destination: Text("This is QuizApp"), isActive: $goAbout) {
                        Button("About") {
                            goAbout = true
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
