//
//  File.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation

extension CommentDTO {
    
    func toDomain() -> CommentModel {
        return CommentModel(id: id, message: body, userName: user.username, likes: likes)
    }
}

