//
//  ContentView.swift
//  DivideSmart
//
//  Created by Shirayo on 15/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var selectedTab: Tab = .main
    @Namespace private var animation

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab,
                    content:  {
                DivideListView()
                    .tag(Tab.main)
                
                ProfileView()
                    .tag(Tab.profile)
            })
            .toolbar(.hidden, for: .tabBar)
            
            CustomTabBar(
                tint: Color("MainTextColor"),
                unactiveTint: Color("MainTextColor")
            )
            
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
                .fill(Color("MainColor"))
                .background {
                    Rectangle()
                        .offset(y: -10)
                        .fill(Color("MainColor"))
                        .brightness(0.05)
                        .blur(radius: 10)
                }
        }
        .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.5), value: selectedTab)
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
                .foregroundStyle(tab == selectedTab ? tint : unactiveTint)
                .frame(width:  tab == selectedTab ? 54 : 34, height:  tab == selectedTab ? 54 : 36)
                .background {
                    if tab == selectedTab {
                        Circle().fill(Color("MainColor"))
                            .makeSimpleNeuromorphic()
                    }
                }
                                            
            Text(tab.rawValue)
                .font(.system(size: 10))
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
