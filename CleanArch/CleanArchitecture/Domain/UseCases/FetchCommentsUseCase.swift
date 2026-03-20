//
//  FetchCommentsUseCase.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation

final class FetchCommentsUseCase: CommentUseCaseProtocol {
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func execute() async throws -> [CommentModel] {
        let response:CommentResponseDTO = try await service.request()
        return response.comments.map { $0.toDomain()}
    }
}
