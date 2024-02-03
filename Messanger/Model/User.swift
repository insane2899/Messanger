//
//  User.swift
//  Messanger
//
//  Created by Soumik Sen on 23/01/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
//    var id = NSUUID().uuidString
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?

    var id: String {
        return uid ?? NSUUID().uuidString
    }
}

extension User {
    static let MOCK_USER = User(fullname: "Bruce Wayne", email: "batman@gmail.com", profileImageUrl: "Bruce")
}
