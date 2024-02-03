//
//  InboxView.swift
//  Messanger
//
//  Created by Soumik Sen on 22/01/24.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                
                List {
                    ForEach(0 ... 10, id: \.self) { message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
                //Lists inside a scrollView behave strangely so we need to add the modifiers
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button( action: {
                        showNewMessageView.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    })
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
