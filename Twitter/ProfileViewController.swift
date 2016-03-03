//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Shirley Plotnik on 2/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var handleLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user?.name
        handleLabel.text = user?.screenname
        followingCountLabel.text = user?.followersCount?.stringValue
    
        if let imageUrl = user.profileImageUrl {
            profileImageView.setImageWithURL(imageUrl)
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"close", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        
    }
    func close() {
        
        self.dismissViewControllerAnimated(false, completion: {})
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
