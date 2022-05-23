//
//  ContryCodeRow.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI

struct ContryCodeRow: View {
    let code: ContryCode
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 12){
                Text("\(code.flag)")
                Text("\(code.name) (\(code.contryCodeWithPlus))")
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
        }
    }
}

struct ContryCodeRow_Previews: PreviewProvider {
    static var previews: some View {
        ContryCodeRow(code: dev.contryCode)
            .previewLayout(.sizeThatFits)
    }
}
