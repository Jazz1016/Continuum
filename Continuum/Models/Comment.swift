//
//  Comment.swift
//  Continuum
//
//  Created by James Lea on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation


class Comment {
    
    var text: String
    var timestamp: Date
    
    weak var post: Post?
    
    init(text: String, timestamp: Date = Date(), post: Post){
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
}
