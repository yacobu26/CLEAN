//
//  CleanArchApp.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import SwiftUI

@main
struct CleanArchApp: App {
    var body: some Scene {
        WindowGroup {
            CommentView(container: AppContainer(environment: .live))
        }
    }
}
