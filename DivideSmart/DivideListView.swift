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
        ZStack(alignment: .center) {
            Color("Background")
            
            VStack {
                Circle()
                    .fill(Color("Background"))
                    .frame(width: 200, height: 200)
                    .makeNeuromorphic(tint: Color("Background"))
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Background"))
                    .frame(height: 200)
                    .makeNeuromorphic(tint: Color("Background"))
                    
                Image(systemName: "person.fill")
                    .foregroundStyle(.gray)
                    .makeNeuromorphic(tint: Color("Background"))
            }
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
