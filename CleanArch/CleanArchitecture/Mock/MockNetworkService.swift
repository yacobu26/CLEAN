//
//  MockNetworkService.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation

final class MockNetworkService: NetworkServiceProtocol {
    
    var fileName: String = "MockResponse"
    var shouldReturnError = false
    
    func request<T:Decodable>() async throws -> T {
        
        if shouldReturnError {
            throw URLError(.badServerResponse)
        }
        let bundle = Bundle(for: MockNetworkService.self)
        
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        
        let data = try Data(contentsOf: url)
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }catch {
            print("❌ Decoding error:",error)
            throw error
        }
    }
    
}
