//
//  ContryCode.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import Foundation

struct ContryCode: Codable, Hashable {
    let name: String
    let alpha2: String
    let alpha3: String
    let countryCode: String
    
    var contryCodeWithPlus: String{
        return "+\(countryCode)"
    }
    
    var flag: String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.alpha2.unicodeScalars {
            if let value = UnicodeScalar(base + v.value){
                s.unicodeScalars.append(value)
            }
        }
        return s
    }
    
    init(name: String, alpha2: String, alpha3: String, countryCode: String) {
        self.name = name
        self.alpha2 = alpha2
        self.alpha3 = alpha3
        self.countryCode = countryCode
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case alpha2 = "alpha-2"
        case alpha3 = "alpha-3"
        case countryCode = "country-code"
    }
}

