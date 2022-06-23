//
//  Combine_SwiftUIApp.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import SwiftUI

@main
struct Combine_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ChatViewModel())
        }
    }
}
