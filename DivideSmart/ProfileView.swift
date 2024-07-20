//
//  ProfileView.swift
//  DivideSmart
//
//  Created by Apple on 20/07/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Color.red
                        .frame(height: 150)
                    Color.green
                        .frame(height: 150)
                    Color.blue               
                        .frame(height: 150)
                    Color.yellow
                        .frame(height: 150)
                    Color.orange       
                        .frame(height: 150)
                    Color.teal
                        .frame(height: 150)

                }
            }
        }
//        .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
}
