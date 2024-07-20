//
//  Tab.swift
//  DivideSmart
//
//  Created by Apple on 20/07/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case main = "Main"
    case profile = "Profile"
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
    
    var systemImage: String {
        switch self {
        case .main:
            return "chevron.left"
        case .profile:
            return "person.fill"
        }
    }
}
