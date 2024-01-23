//
//  SettingsOptionsViewModel.swift
//  Messanger
//
//  Created by Soumik Sen on 22/01/24.
//

import Foundation
import SwiftUI

// Why use enum here? Because we use enum we can use switch to handle the metadata associated with this. Anytime we add/move an option it will be really easy to add it
// As code will throw error wherever we need to add metadata associated to it. Same for removal. So solution is super scalable
enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var id: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .darkMode: return "Dark Mode"
        case .activeStatus: return "Active status"
        case .accessibility: return "Accessibility"
        case .privacy: return "Privacy"
        case .notifications: return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode:
            "moon.circle.fill"
        case .activeStatus:
            "message.badge.circle.fill"
        case .accessibility:
            "person.circle.fill"
        case .privacy:
            "lock.circle.fill"
        case .notifications:
            "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode:
            .black
        case .activeStatus:
            Color(.systemGreen)
        case .accessibility:
            .black
        case .privacy:
            Color(.systemBlue)
        case .notifications:
            Color(.systemPurple)
        }
    }
}
