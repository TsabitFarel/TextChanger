//
//  ContentView.swift
//  Shared
//
//  Created by Tsabit Farel on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = ""
    @State var textMode = 1
    @State var showAlert = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if textMode == 1 {
                Text(userText.uppercased())
                    .font(.largeTitle)
            } else if textMode == 2 {
                Text(userText.lowercased())
                    .font(.largeTitle)
            } else {
                Text(userText.capitalized)
                    .font(.largeTitle)
            }
            
            Spacer()
            
            Button(action:{
                
                if textMode == 1 {
                    UIPasteboard.general.string = userText.uppercased()
                } else if textMode == 2 {
                    UIPasteboard.general.string = userText.lowercased()
                } else {
                    UIPasteboard.general.string = userText.capitalized
                }
        
                showAlert = true
            }){
                RoundedButton(title: "Copy Text", color: .blue)
            }
            .alert("Text Copied", isPresented: $showAlert) {
                Button("Ok", role: .none) { }
            }
            HStack {
                Button(action:{
                    textMode = 1
                }){
                    RoundedButton(title: "Uppercase", color: .purple)
                }
                Button(action:{
                    textMode = 2
                }){
                    RoundedButton(title: "Lowercase", color: .green)
                }
                Button(action:{
                    textMode = 3
                }){
                    RoundedButton(title: "Capitalized", color: .yellow)
                }
            }
            
            TextField("Write Something", text: $userText)
                .padding()
        }
        .padding()
    }
}

struct RoundedButton: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
            .padding(10)
            .frame(maxWidth:.infinity)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(radius: 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
