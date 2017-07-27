//
//  PairlinkDataCell.swift
//  ANS QA
//
//  Created by Douglas Spencer on 12/21/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import UIKit

class PairlinkDataCell: UITableViewCell {
    
    @IBOutlet weak var imgViewClientImage: UIImageView!
    
    @IBOutlet weak var lblDocumentsReleasedValue: UILabel!
    @IBOutlet weak var lblDocumentsDownloadedValue: UILabel!
    @IBOutlet weak var lblDocumentsInErrorValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func UpdateCell(celldata: PairLinkQAData) {
        
        lblDocumentsReleasedValue.text = celldata.DocumentsReleased
        lblDocumentsInErrorValue.text = celldata.DocumentsInEror
        lblDocumentsDownloadedValue.text = celldata.DocumentsDownloaded
        
        
        var logoImagestr: String = ""
        
        
        switch celldata.LogoImage.lowercased() {
        case "sughrue":
            logoImagestr = "sughrue_logo"
        case "baker":
            logoImagestr = "baker_logo"
        case "marshall":
            logoImagestr = "marshall_logo"
        case "fish":
            logoImagestr = "fish_logo"
        case "nelsonmullins":
            logoImagestr = "nelson_logo"
        case "merchant":
            logoImagestr = "merchant_logo"
        case "lerner":
            logoImagestr = "lerner_logo"
        case "arentfox":
            logoImagestr = "arentfox_logo"
        case "lathrop":
            logoImagestr = "lathrop_logo"
        case "milesstockbridge":
            logoImagestr = "miles_logo"
        case "nixonpeabody":
            logoImagestr = "nixon_logo"
        case "mbhb":
            logoImagestr = "mbhb_logo"
        case "cozenpairlink":
            logoImagestr = "cozen_logo"
        case "bskbpairlink":
            logoImagestr = "bskb_logo"
        case "sutherlandpairlink":
            logoImagestr = "sutherland_logo"
        default: break
            
        }
        
        
        imgViewClientImage.image = UIImage(named: logoImagestr)
    
    }

}
