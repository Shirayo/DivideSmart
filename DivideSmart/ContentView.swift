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
    
    @Namespace private var animation
    
    var body: some View {
        VStack {
           
            
            TabView(selection: $selectedTab,
                    content:  {
                DivideListView()
                    .tag(Tab.main)
                    .toolbar(.hidden, for: .tabBar)
                    .toolbarBackground(.hidden, for: .tabBar)

                ProfileView()
                    .tag(Tab.profile)
                    .toolbar(.hidden, for: .tabBar)
                    .toolbarBackground(.hidden, for: .tabBar)

            })
            .toolbar(.hidden, for: .tabBar)
            
            CustomTabBar()
                .background(.red)
        }
    }

    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(alignment: .bottom) {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabItem(
                    tint: .red,
                    unactiveTint: .green,
                    tab: tab,
                    selectedTab: $selectedTab,
                    namespace: animation
                )
            }
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: selectedTab)
    }
    
}

struct TabItem: View {
    
    var tint: Color
    var unactiveTint: Color
    var tab: Tab
    @Binding var selectedTab: Tab
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .tint(tab == selectedTab ? .white : unactiveTint)
                .frame(width:  tab == selectedTab ? 58 : 35, height:  tab == selectedTab ? 58 : 35)
                .background {
                    if tab == selectedTab {
                        Circle()
                            .tint(tint.gradient)
                            .matchedGeometryEffect(id: "tab", in: namespace)
                    }
                }
                                            
            Text(tab.rawValue)
                .font(.caption)
                .tint(tab == selectedTab ? tint : unactiveTint)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                selectedTab = tab
            }
        }
    }
}


#Preview {
    ContentView()
}
