//
//  DivideListView.swift
//  DivideSmart
//
//  Created by Apple on 20/07/2024.
//

import SwiftUI

struct DivideListView: View {
    var body: some View {
        ZStack {
            Color("Background")
                  
            Circle().fill(Color("Background"))
                .frame(width: 50, height: 50)
                .shadow(color: Color("LightShadow"), radius: 4, x: -4, y: -4)
                .shadow(color: Color("DarkShadow"), radius: 4, x: 4, y: 4)
            
            Image(systemName: "person.fill")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    DivideListView()
}
