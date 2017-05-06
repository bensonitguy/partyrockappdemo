//
//  PartyCell.swift
//  PartyRockApp2
//
//  Created by Benson on 05/05/17.
//  Copyright © 2017 Benson. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
   
    @IBOutlet weak var videoTitile: UILabel!
    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
          }
    
    func updateUI(partyRock: PartyRock){
        
        videoTitile.text = partyRock.videoTitle
        // TODO: set fucn to get image
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle error
            }
        }
        
    }

}
