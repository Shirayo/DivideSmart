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

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: -32) {
            TabView(selection: $selectedTab,
                    content:  {
                DivideListView()
                    .tag(Tab.main)
                
                ProfileView()
                    .tag(Tab.profile)
            })
            .toolbar(.hidden, for: .tabBar)
            
            CustomTabBar(tint: .blue, unactiveTint: .gray)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    func CustomTabBar(tint: Color, unactiveTint: Color) -> some View {
        HStack(alignment: .bottom) {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabItem(
                    tint: tint,
                    unactiveTint: unactiveTint,
                    tab: tab,
                    animation: animation,
                    selectedTab: $selectedTab
                )
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.white)
                .shadow(color: tint.opacity(0.2), radius: 5, y: -2)
                .blur(radius: 2)
                .padding(.top, 32)
        }
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5), value: selectedTab)
    }
    
}

struct TabItem: View {
    
    var tint: Color
    var unactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundStyle(tab == selectedTab ? .white : unactiveTint)
                .frame(width:  tab == selectedTab ? 58 : 35, height:  tab == selectedTab ? 58 : 35)
                .background {
                    if tab == selectedTab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "activeTab", in: animation)
                    }
                }
                                            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundStyle(tab == selectedTab ? tint : unactiveTint)
                .clipped()
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            selectedTab = tab
        }
    }
}


#Preview {
    ContentView()
}
