//
//  AppContainer.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation


enum AppEnvironment {
    case live
    case mock
}

final class AppContainer {
    
    let commentViewModel: CommentViewModel
    
    init(environment: AppEnvironment) {
        let service: NetworkServiceProtocol
        switch environment {
        case .live:
            service = NetworkService()
        case .mock:
            let mock = MockNetworkService()
            mock.fileName = "MockResponse"
            service = mock
        }
        let useCase = FetchCommentsUseCase(service: service)
        self.commentViewModel = CommentViewModel(useCase: useCase)
    }
}
