//
//  DivideListView.swift
//  DivideSmart
//
//  Created by Apple on 20/07/2024.
//

import SwiftUI
import testLibrary
//import UIKit

struct DivideListView: View {
    
    @State private var totalOffset = CGSize.zero
    @State private var currentOffset = CGSize.zero
    @State private var size = CGSize.zero
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    @State private var frameRotation: Angle = .zero
    
    @State private var imageSize: CGSize = .zero
    @State private var wholeImageOpacity = 0.0
    
    var body: some View {
        ZStack(alignment: .center) {
            Color("MainColor")

            Button(action: {
                
            }, label: {
                Text("Button")
            })
        }
        .gesture(
            MagnifyGesture()
                .onChanged { value in
                    withAnimation {
                        wholeImageOpacity = 0.5
                    }
                    currentZoom = value.magnification - 1
                }
                .onEnded { value in
                    withAnimation {
                        wholeImageOpacity = 0
                    }
                    totalZoom += currentZoom
                    currentZoom = 0
                }
        )
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


struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            size = proxy.size
                        }
                }
            )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
    
    func asUiImage() -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: self)
        
        if let view = controller.view {
            let contentSize = view.intrinsicContentSize
            view.bounds = CGRect(origin: .zero, size: contentSize)
            view.backgroundColor = .clear
            
            let renderer = UIGraphicsImageRenderer(size: contentSize)
            uiImage = renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
        return uiImage
    }
    
    @MainActor
        func snapshot(scale: CGFloat? = nil) -> UIImage? {
            let renderer = ImageRenderer(content: self)
            renderer.scale = scale ?? UIScreen.main.scale
            return renderer.uiImage
        }
}
