//
//  CommentResponseDTO.swift
//  CleanArch
//
//  Created by G Yacobu on 20/03/26.
//

import Foundation

struct CommentResponseDTO: Decodable {
    let comments: [CommentDTO]
    let total,skip,limit: Int
}


struct CommentDTO: Decodable {
    let id: Int
    let body: String
    let postId: Int
    let likes: Int
    let user: UserDTO
}

struct UserDTO: Decodable {
    let id: Int
    let username: String
    let fullName: String
}
