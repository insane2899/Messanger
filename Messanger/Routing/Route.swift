//
//  Route.swift
//  Messanger
//
//  Created by Soumik Sen on 28/03/24.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
