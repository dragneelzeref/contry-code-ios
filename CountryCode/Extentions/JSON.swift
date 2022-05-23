//
//  JSON.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

enum JSONFileError<T>: Error{
    case fileNotFound(String)
    case load(String, Error)
    case parse(String, Error)
    
    var description: String{
        switch self {
        case .fileNotFound(let filename):
            return "File: \(filename) not found"
        case .load(let filename, let error):
            return "Couldn't load \(filename) from main bundle:\n\(error)"
        case .parse(let filename,  let error):
            return "Couldn't parse \(filename) as \(T.self):\n\(error)"
        }
    }
}


import Foundation

func load<T: Decodable>(_ filename: String) throws -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        throw JSONFileError<T>.fileNotFound(filename)
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        throw JSONFileError<T>.load(filename, error)
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw JSONFileError<T>.parse(filename, error)
    }
}
