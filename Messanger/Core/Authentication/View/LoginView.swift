//
//  LoginView.swift
//  Messanger
//
//  Created by Soumik Sen on 22/01/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // logo image
                Image("messanger-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                //text fields
                //Separate VStack as we can control the spacing between these textfields with its own spacer
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                
                //forgot password
                
                Button {
                    print("forgot password")
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing) // Hack to send this to right side
                
                //login button
                
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
        
                
                //facebook login
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack {
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink(destination: {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                }, label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                })
                .padding(.vertical)
                
                //sign up link
            }
        }
    }
}

#Preview {
    LoginView()
}
