//
//  TranslationResponse.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import Foundation

struct TranslationResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case languageCode = "lang"
        case translations = "text"
    }
    
    let languageCode: String
    let translations: [String]
    
}
