//
//  ChatView.swift
//  Messanger
//
//  Created by Soumik Sen on 23/01/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                //header
                VStack {
                    CircularProfileImageView(user: user, size: .xLarge)
                    
                    VStack (spacing: 4) {
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                //messages
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        ChatMessageCell(message: message)
                    }
                }
            }
            Spacer()
            
            //message input view
            ZStack(alignment: .trailing) {
                TextField("Message ...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)                     // To give space to "Send
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button(action: {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                }) {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
