//
//  Views.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI



extension View {
  func readSize(_ onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}





extension View{
    func position(_ cordinatespace: CoordinateSpace, onChange: @escaping (CGRect) -> Void) -> some View{
        background(
          GeometryReader { geometryProxy in
            Color.clear
                  .preference(key: PositionPreferenceKey.self, value: geometryProxy.frame(in: cordinatespace))
          }
        )
        .onPreferenceChange(PositionPreferenceKey.self, perform: onChange)
    }
}

private struct PositionPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
  static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}



extension View{
    func modelSlideUp<Content: View>(isOpen: Binding<Bool>, maxHeight: CGFloat = UIScreen.screenHeight, @ViewBuilder content: () -> Content) -> some View{
         ZStack{
             self
             ModelSlideUp(isOpen: isOpen, maxHeight: maxHeight, header: { EmptyView() }, content: content)
                 .ignoresSafeArea(.container, edges: .bottom)
         }
    }
    
    func modelSlideUp<Header: View, Content: View>(isOpen: Binding<Bool>, maxHeight: CGFloat = UIScreen.screenHeight, @ViewBuilder header: () -> Header, @ViewBuilder content: () -> Content) -> some View{
         ZStack{
             self
             ModelSlideUp(isOpen: isOpen, maxHeight: maxHeight,header: header, content: content)
                 .ignoresSafeArea(.container, edges: .bottom)
         }
    }
}
