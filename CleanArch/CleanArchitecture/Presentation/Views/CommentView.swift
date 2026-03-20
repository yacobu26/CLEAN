//
//  CommentView.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import SwiftUI

struct CommentView: View {
    
    @StateObject private var vm: CommentViewModel
    
    init(container: AppContainer) {
        _vm = StateObject(wrappedValue: container.commentViewModel)
    }
    
    var body: some View {
        
        ZStack {
           
            List(vm.comments, id:\.id) { comment in
                
                VStack(alignment: .leading) {
                    Text(comment.userName).bold()
                    Text(comment.message)
                    Text("❤️")
                }
            }
            if vm.isLoading {
                ProgressView()
            }
        }
        .task {
            await vm.loadComments()
        } 
    }
}

#Preview {
    CommentView(container: AppContainer(environment: .mock))
}
