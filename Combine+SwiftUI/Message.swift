//
//  Message.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import Foundation

struct Message: Identifiable, Codable {
    let id = UUID()
    let username: String
    let value: String
    let timeStamp: String
    let languageCode: String
    let translationLanguageCode: String
    let translatedValue: String
    
    var isFromLocalUser: Bool { username == User.local.name }
    var isTranslated: Bool { translatedValue.isEmpty == false }
}
