//
//  ContentView.swift
//  MyHappyApp
//
//  Created by SinhLH.AVI on 21/10/25.
//

import SwiftUI
import MyHappyInterfaceFramework

struct ContentView: View {
    
    @State private var name: String?
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button("Say my name...") {
                
                Task {
                    
                    name = MyHappyInterfaceLoader
                        .shared
                        .sayMyName()
                }
            }
            .font(.headline)
            .padding()
            
            if let name {
                Text(name)
                    .font(.title2)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: name)
        .padding()
    }
}
