//
//  ContentView.swift
//  Combine+SwiftUI
//
//  Created by Mohammad Miah on 23/09/2021.
//

import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject private var viewModel: ChatViewModel
    @State private var showActionSheet = false
    
    private let formatter = DateFormatter(dateStyle: .short, timeStyle: .short)
    
    var body: some View {
        NavigationView {
            VStack {
                ChatScrollView()
                ToolbarView(showActionSheet: $showActionSheet)
                    .padding()
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: viewModel.keyboardOffset)
                    .animation(.easeInOut(duration: viewModel.keyboardAnimationDuration))
            }
            .navigationBarTitle(Text(viewModel.appState.rawValue), displayMode: .inline)
            .animation(.easeInOut)
            .onTapGesture {
                UIApplication.shared.windows
                    .first{ $0.isKeyWindow }?
                    .endEditing(true)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text(viewModel.actionSheetTitle), message: nil, buttons: actionSheetButtons())
        }
    }
    
    private func actionSheetButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        
        switch viewModel.appState {
        case .inactive:
            buttons += [
                .default(Text("Host Chat"), action: {
                    self.viewModel.startAdvertising()
                }),
                .default(Text("Join Chat"), action: {
                    self.viewModel.startBrowsing()
                })
            ]
        default:
            buttons += [
                .default(Text(viewModel.isTranslating ? "Stop Translating" : "Start Translating"), action: {
                    self.viewModel.isTranslating.toggle()
                }),
                .default(Text("Disconnect"), action: self.viewModel.disconnect)
            ]
        }
        buttons.append(.cancel())
        return buttons
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("iPhone 11 Pro Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
}
