//
//  ActiveNowViewModel.swift
//  Messanger
//
//  Created by Soumik Sen on 28/03/24.
//

import Foundation
import Firebase

class ActiveNowViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        self.users = try await UserService.fetchAllUsers(limit: 10)
        self.users = users.filter { $0.id != currentUid }
    }
}
