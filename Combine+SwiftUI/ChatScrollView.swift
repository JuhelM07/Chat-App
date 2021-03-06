//
//  ChatScrollView.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import SwiftUI

struct ChatScrollView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.messages) { message in
                    MessageView(message: message, isTranslating: self.$viewModel.isTranslating)
                }
            }
        }
    }
}

struct ChatScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ChatScrollView()
    }
}
