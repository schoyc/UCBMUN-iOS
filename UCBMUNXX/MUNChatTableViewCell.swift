//
//  MUNChatTableViewCell.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/25/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class MUNChatTableViewCell: PFTableViewCell {
    
    

    @IBOutlet weak var postImage: PFImageView!
    
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postUser: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postScore: UILabel!
 

    @IBOutlet weak var postLoading: UIProgressView!
    
    
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var downVoteButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
