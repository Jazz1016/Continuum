//
//  PostController.swift
//  Continuum
//
//  Created by James Lea on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation
import UIKit

class PostController {
     
    static let shared = PostController()
    
    var posts: [Post] = []
    
    func addComment(text: String, post: Post, completion: @escaping (Result <Comment, PostError>) -> Void){
        
        let newComment = Comment(text: text, post: post)
        
        
    }
    
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?, PostError>) -> Void){
        
        
        let newPost = Post(photo: image, caption: caption)
        
        posts.append(newPost)
        
    }
}
