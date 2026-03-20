//
//  NetworkServiceProtocol.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T:Decodable>() async throws -> T
}
