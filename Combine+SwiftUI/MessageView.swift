//
//  MessageView.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    
    @Binding var isTranslating: Bool
    
    var body: some View {
        VStack {
            Text(self.caption(for: message))
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundColor(.gray)
                .onTapGesture {
                    if self.isTranslating, self.message.isTranslated {
                            let url = URL(string: "https://translate.yandex.net")!
                            UIApplication.shared.open(url)
                    }
                }
            
            HStack {
                if message.isFromLocalUser {
                    Spacer()
                }
                
                Text(self.text(for: message))
                    .foregroundColor(.white)
                    .font(.body)
                    .padding()
                    .background(message.isFromLocalUser ? Color.blue : Color.gray)
                    .cornerRadius(20)
                    .padding(.leading, message.isFromLocalUser ? 20 : 8)
                    .padding(.trailing, message.isFromLocalUser ? 8 : 20)
                    .padding(.vertical, 5)
                
                if message.isFromLocalUser == false {
                    Spacer()
                }
                
            }
        }

    }
    
    private func text(for message: Message) -> String {
        isTranslating && message.translatedValue.isEmpty == false ? message.translatedValue : message.value
    }
    
    private func caption(for message: Message) -> String {
        var caption = ""
        
        switch(message.isFromLocalUser, isTranslating){
        case(true, _):
            caption = message.timeStamp
        case(_, true) where message.isTranslated:
            caption = "\nTranslation Powered by Yandex.Translate"
            fallthrough
        default:
            caption = "\(message.username) - \(message.timeStamp)" + caption
        }
        
        return caption
        //(message.isFromLocalUser ? "" : "\(message.username) - ") +  "\(message.timeStamp)"
    }
    
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(message: Message(username: User.local.name, value: "Hello World", timeStamp: ""), isTranslating: true)
//            .previewLayout(.sizeThatFits)
//    }
//}
