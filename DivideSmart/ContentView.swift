//
//  ContentView.swift
//  DivideSmart
//
//  Created by Shirayo on 15/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State var selectedTab: Tab = .main
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab,
                    content:  {
                Text("Tab Content 1")
                    .tag(Tab.main)
                    .toolbar(.hidden, for: .tabBar)
                
                Text("Tab Content 2")
                    .tag(Tab.profile)
                    .toolbar(.hidden, for: .tabBar)
            })
            
            CustomTabBar()
        }
    }

    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabItem(tab: tab, selectedTab: $selectedTab)
            }
        }
    }
    
}

struct TabItem: View {
    
    var tab: Tab
    @Binding var selectedTab: Tab
    
    var body: some View {
        Button(action:{
            selectedTab = tab
        }, label: {
            VStack {
                Image(systemName: tab.systemImage)
                
                Text(tab.rawValue)
            }
        })
    }
}


#Preview {
    ContentView()
}
