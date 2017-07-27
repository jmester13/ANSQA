//
//  ClientDetailVC.swift
//  ANS QA
//
//  Created by Douglas Spencer on 12/22/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import UIKit

class ClientDetailVC: UIViewController {
    
    var plqaData: PairLinkQAData = PairLinkQAData()

    @IBOutlet weak var lblAppsSkipped: UILabel!
    @IBOutlet weak var lblLastReleasedDocument: UILabel!
    @IBOutlet weak var lblLastEofficeDocument: UILabel!
    @IBOutlet weak var lblDocumentsDownloaded: UILabel!
    @IBOutlet weak var lblDocumentsInIOError: UILabel!
    @IBOutlet weak var lblDocumentsInProc: UILabel!
    @IBOutlet weak var lblDocumentsInError: UILabel!
    @IBOutlet weak var lblDocumentsInIRVW: UILabel!
    @IBOutlet weak var lblDocumentsReleased: UILabel!
    @IBOutlet weak var lblNumberOfEofficeDocuments: UILabel!
    
    @IBOutlet weak var imgClientImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let PGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pressimage))
        imgClientImage.addGestureRecognizer(PGR)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SetupView(data: plqaData)
    }
    
    func pressimage() {
        performSegue(withIdentifier: "eofficevc", sender: nil)
    }
    
    @IBAction func GoToEoffice() {
        performSegue(withIdentifier: "eofficevc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _eofficeVC =  segue.destination as? eofficeVC {
            _eofficeVC.MostRecentOfficeDocumentReported = plqaData.MostRecentEofficeReported
            _eofficeVC.NumberOfEofficeDocumentsReported = plqaData.NumberOfEofficeDocs
        }
    }
    
    
    func SetupView(data: PairLinkQAData) {
        
        var logoImagestr: String = ""
        
        lblAppsSkipped.text = data.ApplicationNumbersSkipped
        lblLastReleasedDocument.text = data.MostRecentDocumentReleased
        lblDocumentsDownloaded.text = data.DocumentsDownloaded
        lblDocumentsInIOError.text = data.DocumentsInIOError
        lblDocumentsInProc.text = data.DocumentsInProc
        lblDocumentsInError.text = data.DocumentsInEror
        lblDocumentsInIRVW.text = data.DocumentsInIRVW
        lblDocumentsReleased.text = data.DocumentsReleased
        
        
        switch data.LogoImage.lowercased() {
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
        
        imgClientImage.image = UIImage(named: logoImagestr)
    }
}
