//
//  Networkservice.swift
//  NetworkInterchangable
//
//  Created by halil ibrahim Elkan on 16.12.2023.
//

import Foundation

protocol NetworkService{
    func download(_ resource: String) async throws -> [User]
    var type : String {get}
}
