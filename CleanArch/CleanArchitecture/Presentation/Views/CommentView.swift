//
//  CommentView.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import SwiftUI

struct CommentView: View {
    
    @StateObject private var vm: CommentViewModel
    
    
    init() {
        let service = NetworkService()
        let useCase = FetchCommentsUseCase(service: service)
        _vm = StateObject(wrappedValue: CommentViewModel(useCase: useCase))
    }
    
    var body: some View {
        
        List(vm.comments, id:\.id) { comment in
            
            VStack(alignment: .leading) {
                Text(comment.userName).bold()
                Text(comment.message)
                Text("❤️")
            }

        }
        .task {
            await vm.loadComments()
        }
        
        
    }
}
