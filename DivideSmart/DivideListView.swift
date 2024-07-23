//
//  DivideListView.swift
//  DivideSmart
//
//  Created by Apple on 20/07/2024.
//

import SwiftUI
import testLibrary

struct DivideListView: View {
    var body: some View {
        ZStack {
            Color("Background")
                  
            Circle()
                .fill(Color("Background"))
            
            Image(systemName: "person.fill")
                .foregroundStyle(.gray)
                
        }
    }
}

#Preview {
    DivideListView()
}


struct testModifier: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
            
            content
        }
    }
    
}

extension View {
    func testMod() -> some View {
        modifier(testModifier())
    }
}
