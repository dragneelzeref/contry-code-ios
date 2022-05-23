//
//  BottomSheetView.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 40
    static let indicatorHeight: CGFloat = 4
    static let indicatorWidth: CGFloat = 48
}


struct ModelSlideUp<Header: View, Content: View>: View {
    @Binding var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let header: Header
    let content: Content
    
    @GestureState private var translation: CGFloat = 0

    private enum ModelOpenStatus{
        case full, half
    }
    @State private var status: ModelOpenStatus
    
    private let ScrollCordinateSpace = "BottomSheetViewScroll"

    private var offset: CGFloat {
        if isOpen{
            return status == .full ? 0 : maxHeight - minHeight
        }
        else{
            return maxHeight
        }
    }
    
    init(isOpen: Binding<Bool>, maxHeight: CGFloat,@ViewBuilder header: () -> Header, @ViewBuilder content: () -> Content) {
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * 3 / 4
        self.header = header()
        self.content = content()
        self._isOpen = isOpen
        self._status = State(initialValue: .half)
    }

    
    var body: some View {
        ZStack {
            backgroud
            VStack(spacing: 0) {
                indicator
                    .padding(32)
                header
                ScrollView{
                    VStack(spacing: 0) {
                        scrollDetector
                        content
                    }
                }
                .coordinateSpace(name: ScrollCordinateSpace)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.ModelBackground)
            .cornerRadius(Constants.radius)
            .offset(y: max(offset + translation, 0))
            .animation(.easeInOut, value: isOpen)
            .animation(.easeInOut, value: translation)
            .animation(.easeInOut, value: isOpen)
            .animation(.easeInOut, value: status)
            .gesture(
                DragGesture()
                    .updating($translation) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded(dragEnd(_:))
        )
        }
    }
    
    private func dragEnd(_ value: DragGesture.Value){
        guard isOpen else { return }
        let dy = value.translation.height
        
        if dy < 0 && status == .half{
            status = .full
        }
        else if dy > 0 {
            if status == .full{
                status = .half
            }
            else {
                isOpen = false
                status = .half
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ModelSlideUp(isOpen: .constant(true), maxHeight: 600) {
            Text("Hello")
        } content: {
            Rectangle().fill(Color.red)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


extension ModelSlideUp{
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.ModelIndicator)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
            )
            .onTapGesture {
                if status == .half{
                    status = .full
                }
                else{
                    status = .half
                }
            }
    }
    
    private var scrollDetector: some View{
        HStack{}
        .frame(height: 0)
        .frame(maxWidth: .infinity)
        .background(.black)
        .position(.named(ScrollCordinateSpace)) { position in
            guard isOpen else { return }
            let y = position.minY
            if y < 0{
                status = .full
            }
            else if y > 0{
                if status == .full{
                    status = .half
                }
            }
        }
    }
    
    private var backgroud: some View{
        Color.black.opacity(isOpen ? 0.2 : 0)
            .ignoresSafeArea(.container, edges: .all)
            .animation(.easeInOut, value: isOpen)
    }
}

