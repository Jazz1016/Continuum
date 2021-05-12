//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by James Lea on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var captionTextLabel: UILabel!
    @IBOutlet weak var commentsTextLabel: UILabel!
    
    // MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    
    func updateViews(){
        guard let post = post else {return}
        
        self.postImage.image = post.photo
        self.captionTextLabel.text = post.caption
        // JAMLEA: Fill in Comments label
    }
}
