//
//  File.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    func request<T:Decodable>() async throws -> T {
        
        guard let url = URL(string: "https://dummyjson.com/comments") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
        
    }
}
