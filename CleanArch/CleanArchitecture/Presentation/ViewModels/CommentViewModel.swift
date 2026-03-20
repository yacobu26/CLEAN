//
//  CommentViewModel.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation
import Combine

@MainActor
final class CommentViewModel: ObservableObject {

    @Published var comments:[CommentModel] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let useCase: CommentUseCaseProtocol
    
    init(useCase: CommentUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func loadComments() async {
        isLoading = true
        do {
            comments = try await useCase.execute()
        }catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
}
