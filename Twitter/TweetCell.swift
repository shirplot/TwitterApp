//
//  TweetCell.swift
//  Twitter
//
//  Created by Shirley Plotnik on 2/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userNameHandle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var tweetID: String = ""
    
    var tweet: Tweet! {
        
        
        didSet {
            userNameLabel.text = "\((tweet.user?.name)!)"
            userNameHandle.text = "@" + "\((tweet.user?.screenname)!)"
            tweetTextLabel.text = tweet.text
            dateLabel.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
        
            //let profileImageUrl = tweet.user?.profileImageUrl!
            profilePictureImageView.setImageWithURL(tweet.user!.profileImageUrl!)
                        tweetID = tweet.id
            retweetLabel.text = String(tweet.retweetCount!)
            favoriteLabel.text = String(tweet.favoriteCount!)
            
            retweetLabel.text! == "0" ? (retweetLabel.hidden = true) : (retweetLabel.hidden = false)
            favoriteLabel.text! == "0" ? (favoriteLabel.hidden = true) : (favoriteLabel.hidden = false)
            
            
        }
    }
  
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Converting raw time into format for Twitter time
        var rawTime = Int(timeTweetPostedAgo)
        var timeAgo: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        // Code for time elapsed since tweet was posted
        if (rawTime <= 60) {
            timeAgo = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) {
            timeAgo = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) {
            timeAgo = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) {
            timeAgo = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) {
            timeAgo = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(timeAgo)\(timeChar)"
    }
    
   
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //AutoLayout for profile picture images
        profilePictureImageView.layer.cornerRadius = 3
        profilePictureImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func retweetAction(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(Int(tweetID)!, params: nil, completion: {(error) -> () in
            self.retweetButton.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Selected)
            
            if self.retweetLabel.text! > "0" {
                self.retweetLabel.text = String(self.tweet.retweetCount! + 1)
            } else {
                self.retweetLabel.hidden = false
                self.retweetLabel.text = String(self.tweet.retweetCount! + 1)
            }
        })
    }
    
    @IBAction func favoriteAction(sender: AnyObject) {
        TwitterClient.sharedInstance.likeTweet(Int(tweetID)!, params: nil, completion: {(error) -> () in
            self.favoriteButton.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Selected)
            
            if self.favoriteLabel.text! > "0" {
                self.favoriteLabel.text = String(self.tweet.favoriteCount! + 1)
            } else {
                self.favoriteLabel.hidden = false
                self.favoriteLabel.text = String(self.tweet.favoriteCount! + 1)
            }
        })
    }
    
    

}
