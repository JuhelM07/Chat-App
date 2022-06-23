//
//  DateFormatter+.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import Foundation

extension DateFormatter {
    convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }
}
