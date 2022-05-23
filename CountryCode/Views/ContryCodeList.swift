//
//  ContryCodePickerView.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI

struct ContryCodeList: View {
    @StateObject var contryCodeStore: ContryCodesStore
    var action: (ContryCode) -> Void
    var body: some View {
        LazyVStack(spacing: 0){
            ForEach(contryCodeStore.codeList, id: \.self){ code in
                Button {
                    action(code)
                } label: {
                    ContryCodeRow(code: code)
                }

            }
        }
    }
}

struct ContryCodePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            ContryCodeList(
                contryCodeStore: ContryCodesStore(),
                action: { _ in}
            )
        }
    }
}
