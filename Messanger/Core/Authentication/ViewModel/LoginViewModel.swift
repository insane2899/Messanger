//
//  LoginViewModel.swift
//  Messanger
//
//  Created by Soumik Sen on 24/01/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
