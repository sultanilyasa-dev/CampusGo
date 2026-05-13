//
//  ContentView.swift
//  CampusGo
//
//  Created by Training-06 on 12/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var email = "student@university.edu"
    @State private var password = "123456"

    var body: some View {
        if isLoggedIn {
            MainTabView()
        } else {
            LoginView(
                email: $email,
                password: $password,
                onLogin: {
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }
            )
        }
    }
}

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    let onLogin: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer()

                    Text("Sign in")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Sign in to access your campus information")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)

                    VStack(spacing: 16) {
                        TextField("Email", text: $email)
                            .autocorrectionDisabled()
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)

                        Button(action: onLogin) {
                            Text("Login")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()

                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            StudentAccessIDView()
                .tabItem {
                    Label("Access ID", systemImage: "person.text.rectangle")
                }

            Text("Profile Page")
                .font(.title2)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }

            Text("Settings Page")
                .font(.title2)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
