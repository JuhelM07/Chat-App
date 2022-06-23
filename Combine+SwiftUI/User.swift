//
//  User.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import Foundation
import UIKit

class User {
    static let local = User()
    
    let id = UUID()
    var name: String { UIDevice.current.name }
    
    private init() { }
    
}
