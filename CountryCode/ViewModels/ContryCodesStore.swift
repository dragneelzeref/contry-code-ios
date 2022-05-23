//
//  ContryCodesStore.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import Foundation
import Combine

class ContryCodesStore: ObservableObject{
    @Published var codes: [ContryCode] = []
    @Published var codeList: [ContryCode] = []
    
    // Search
    @Published var searchText: String = ""
    var cancellables = Set<AnyCancellable>()

    private let contryCodeJSON = "contry-code.json"
    
    init(){
        loadContryCodesFromJSON()
        searchListener()
    }
    
    func loadContryCodesFromJSON(){
        do {
            self.codes = try load(contryCodeJSON)
            codeList = self.codes
        } catch let error {
            debugPrint("\(#function): \(error)")
        }
    }
    
    func searchListener(){
        $searchText
            .combineLatest($codes)
            .debounce(for: .seconds(0.2), scheduler: RunLoop.main)
            .sink { [weak self] newSearchText, newCodes in
                guard let self = self else { return }
                if newSearchText == ""{
                    self.codeList = newCodes
                }
                else{
                    self.codeList = newCodes.filter({
                        $0.name.lowercased().contains(newSearchText.lowercased()) || String("+" + $0.countryCode).contains(newSearchText)
                    })
                }
            }
            .store(in: &cancellables)
    }
}
