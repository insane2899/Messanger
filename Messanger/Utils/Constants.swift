//
//  Constants.swift
//  Messanger
//
//  Created by Soumik Sen on 04/03/24.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
