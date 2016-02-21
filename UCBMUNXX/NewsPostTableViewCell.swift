//
//  File.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/13/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class NewsPostTableViewCell: PFTableViewCell {
    

    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImage: PFImageView!
    
    @IBOutlet weak var newsHeadline: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    @IBOutlet weak var progressLoading: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
