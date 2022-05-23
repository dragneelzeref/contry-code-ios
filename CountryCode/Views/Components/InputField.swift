//
//  InputField.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import SwiftUI

struct InputField: View {
    // properties
    @Binding var fieldInput: String
    let placeholder: Text
    var preIcon: String?
    var postIcon: String?
    
    //body
    var body: some View {
        HStack {
            
            HStack (alignment: .center, spacing: 6
            ) {
                
                //pre icon
                ZStack {
                    if let isPreIcon = preIcon
                    {
                        Image(isPreIcon)
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                    }
                }
                
                //text field with placeholder
                ZStack(alignment: .leading) {
                    if fieldInput == "" {
                        placeholder
                            .font(Font.custom("IBMPlexSans-Regular", size: 16))
                            .foregroundColor(.msColorNeutral50)
                            .frame(height: 20, alignment: .center)
                            .frame(minHeight: 0, maxHeight: 33)
                    }
                    TextField ("", text: $fieldInput)
                        .font(Font.custom("IBMPlexSans-Regular", size: 16))
                        .foregroundColor(.msColorNeutral80)
                        .frame(height: 20, alignment: .center)
                        .frame(minHeight: 0, maxHeight: 33)
                }
                
                //post icon
                ZStack {
                    if let isPostIcon = postIcon {
                        Image(systemName: isPostIcon)
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                    }
                }
            }
            .padding([.top,.bottom], 12)
            .padding([.trailing, .leading], 16)
            .background(Color.white, alignment: .center)
            .cornerRadius(40)
        }
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField(fieldInput: .constant(""), placeholder: Text("Search"))
    }
}
