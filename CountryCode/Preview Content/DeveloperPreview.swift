//
//  DeveloperPreview.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import Foundation

class DeveloperPreview{
    static let shared = DeveloperPreview()
    let contryCode = ContryCode(name: "India", alpha2: "IN", alpha3: "IND", countryCode: "91")
    
    private init (){}
    
}
