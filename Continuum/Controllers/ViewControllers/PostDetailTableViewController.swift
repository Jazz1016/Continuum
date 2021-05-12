//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by James Lea on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Properties
    
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    
    // MARK: - Actions
    @IBAction func commentButtonPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Comment", message: "add new content", preferredStyle: .alert)
        
        alertController.addTextField { textfield in
            textfield.placeholder = "Enter new comment here"
        }
        
        let addCommentAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let commentText = alertController.textFields?.first?.text, !commentText.isEmpty,
                  let post = self.post else {
                
                let alertController1 = UIAlertController(title: "Unable to add a comment", message: "Comment needs a text body", preferredStyle: .alert)
                
                let doneAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alertController1.addAction(doneAction)
                
                self.present(alertController1, animated: true, completion: nil)
                
                return}
            PostController.shared.addComment(text: commentText, post: post) { (result) in
                // JAMLEA: - ADD COMMENT NOT BUILT OUT YET
            }
            
        }
        
        alertController.addAction(addCommentAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
        
    }
    
    // MARK: - Functions
    
    func updateViews(){
        guard let post = post else {return}
        self.imageView.image = post.photo
        
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let post = post else {return 1}
        return post.comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        let comment = post?.comments[indexPath.row].text
        
        cell.textLabel?.text = comment
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
