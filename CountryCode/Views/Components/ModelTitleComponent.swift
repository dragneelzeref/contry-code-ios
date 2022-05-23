//
//  ModelTitleComponent.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI

struct ModelTitleComponent: View {
    let title: String
    let trailingIcon: String?
    var action: () -> Void
    var body: some View {
        HStack{
            Text("Country")
                .font(.system(size: 19, weight: .semibold))
            Spacer()
            if let trailingIcon = trailingIcon {
                Button(action: action) {
                    Image(systemName: trailingIcon)
                        .resizable()
                        .frame(width: 14, height: 14)
                }
            }
        }
        .foregroundColor(Color.ModelHeader)
    }
}

struct ModelTitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            ModelTitleComponent(title: "Countrty", trailingIcon: "xmark", action: {})
                .previewLayout(.sizeThatFits)
        }
    }
}
