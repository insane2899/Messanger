//
//  InboxViewModel.swift
//  Messanger
//
//  Created by Soumik Sen on 03/02/24.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
