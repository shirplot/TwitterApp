//
//  TwitterClient.swift
//  Twitter
//
//  Created by Shirley Plotnik on 2/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "rn8C3KBLhLEMSYCDlmh0lnkZf"
let twitterConsumerSecret = "jRpvB42ke3Ns7mcJUbDwmc47R39ArGmPZz4cN1aBmoF9KVnn8Y"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance =
            TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }

}
