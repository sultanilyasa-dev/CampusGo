//
//  StudentAccessIDView.swift
//  CampusGo
//
//  Created by Training-05 on 12/05/26.
//


import SwiftUI

struct StudentAccessIDView: View {
    let photoURL = URL(string: "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-881954-2379004.jpg&fm=jpg")!
    
    var body: some View {
        ZStack {
            Color(.systemGray)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("CampusGo Student Access ID")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                AsyncImage(url: photoURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 140, height: 140)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                    case .failure:
                        Image(systemName: "person.crop.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.gray)

                    @unknown default:
                        EmptyView()
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Name: John Doe")
                    Text("Student ID: UNI-2026-001")
                    Text("Faculty: Computer Science")
                    Text("Valid Until: Dec 2026")
                }
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)

                Text("Authorized Student Access")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: 320)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 8)
            .padding()
        }
    }
}

#Preview {
    StudentAccessIDView()
}
