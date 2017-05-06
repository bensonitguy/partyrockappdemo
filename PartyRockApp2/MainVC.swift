//
//  ViewController.swift
//  PartyRockApp2
//
//  Created by Benson on 05/05/17.
//  Copyright © 2017 Benson. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlTest = "<iframe src=\"https://www.youtube.com/embed/xYcL5_iSZJE?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe>"
        
        let p1 = PartyRock(imageURL: "https://yt3.ggpht.com/-Q-dvKsbFGbo/AAAAAAAAAAI/AAAAAAAAAAA/jZKh3hzajAM/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: urlTest, videoTitle: "Vidya Vox Tum Hi Ho")
        
        let p2 = PartyRock(imageURL: "https://yt3.ggpht.com/-ta-bz8wRDbE/AAAAAAAAAAI/AAAAAAAAAAA/M2hcPaj1cEU/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: urlTest, videoTitle: "Shirley Setia - Sanam Re")
        
        let p3 = PartyRock(imageURL: "https://yt3.ggpht.com/-RtOYhuDkXUQ/AAAAAAAAAAI/AAAAAAAAAAA/WVo593thmsM/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: urlTest, videoTitle: "Review for Apache RTR 180")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else  {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

