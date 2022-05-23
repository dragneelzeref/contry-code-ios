//
//  ContentView.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contryCodeStore = ContryCodesStore()
    @State var isOpen: Bool = false
    @State var text: String = ""
    @State var code: ContryCode?
    var body: some View {
        ZStack{
            VStack{
                Button {
                    isOpen = true
                } label: {
                    if let code = code {
                        VStack{
                            Text("\(code.name)")
                            Text("+\(code.countryCode)")
                        }
                    }
                    else{
                        Text("Pick Contry Code")
                    }
                }
            }
            .modelSlideUp(isOpen: $isOpen, header: {
                VStack(spacing: 24){
                    ModelTitleComponent(
                        title: "Country",
                        trailingIcon: "xmark",
                        action: {
                            isOpen = false
                        }
                    )
                    InputField(
                        fieldInput: $contryCodeStore.searchText,
                        placeholder: Text("Search for your country"),
                        postIcon: "magnifyingglass"
                    )
                }
                .padding(24)
            }, content: {
                ContryCodeList(contryCodeStore: contryCodeStore) { code in
                    self.code = code
                    isOpen = false
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
