//
//  Webservice.swift
//  NetworkInterchangable
//
//  Created by halil ibrahim Elkan on 16.12.2023.
//

import Foundation

enum NetwokError : Error {
    case invalidUrl
    case invalidServerResponse
}

class Webservice : NetworkService {
    var type: String = "Webservice"
    func download(_ resource: String) async throws -> [User]{
        guard let url = URL(string: resource) else{
            throw NetwokError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetwokError.invalidServerResponse
            }
        return try JSONDecoder().decode([User].self, from: data)
        
    }
}
