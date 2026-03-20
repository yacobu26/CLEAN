//
//  CommentUseCaseProtocol.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation
protocol CommentUseCaseProtocol {
    func execute() async throws -> [CommentModel]
}
