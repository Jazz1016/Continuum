//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by James Lea on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var uploadedImageView: UIImageView!
    @IBOutlet weak var imageuploadButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captionTextField.text = nil
    }
    
    // MARK: - Actions
    
    @IBAction func uploadImageButtonTapped(_ sender: Any) {
        self.imageuploadButton.setTitle("", for: .normal)
        uploadedImageView.image = UIImage(named: "spaceEmptyState")
    }
    
    @IBAction func addPostButtonWasTapped(_ sender: Any) {
        
        guard let image = uploadedImageView.image,
              let caption = captionTextField.text, !caption.isEmpty else {
            
            
            let alertController = UIAlertController(title: "Unable to add post", message: "You need a photo and a caption to add a post", preferredStyle: .alert)
            
            let doneAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(doneAction)
            
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        PostController.shared.createPostWith(image: image, caption: caption) { (result) in



        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonWasTapped(_ sender: Any) {
        
        self.tabBarController?.selectedIndex = 0
        self.uploadedImageView.image = nil
        self.captionTextField.text = ""
        self.imageuploadButton.setTitle("Select Image", for: .normal)

    }
    
    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

}
