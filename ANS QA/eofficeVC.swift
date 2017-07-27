//
//  eofficeVC.swift
//  ANS QA
//
//  Created by Douglas Spencer on 1/24/17.
//  Copyright © 2017 Douglas Spencer. All rights reserved.
//

import UIKit

class eofficeVC: UIViewController {

    var _MostRecentOfficeDocumentReported: String? = nil
    var _NumberOfEofficeDocumentsReported: String? = nil
    
    @IBOutlet weak var lblMostRecentEofficeDocumentsReported: UILabel!
    @IBOutlet weak var lblNumberOfEofficeDocumentsReported: UILabel!
    
    var MostRecentOfficeDocumentReported: String {
        get {
            return _MostRecentOfficeDocumentReported!
        }
        set  {
            _MostRecentOfficeDocumentReported = newValue
        }
    }
    
    var NumberOfEofficeDocumentsReported: String {
        get {
            return _NumberOfEofficeDocumentsReported!
        }
        set {
            _NumberOfEofficeDocumentsReported = newValue
        }
    }
    
    
    func UpdateView() {
        lblMostRecentEofficeDocumentsReported.text = MostRecentOfficeDocumentReported
        lblNumberOfEofficeDocumentsReported.text = NumberOfEofficeDocumentsReported
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UpdateView()
    }
}
