//
//  DataService.swift
//  DevChat
//
//  Created by Douglas Spencer on 10/21/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import Foundation
import Firebase
import CoreLocation
import Contacts

class DataService {
    private static let _instance = DataService()
    
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var qaDataRef: FIRDatabaseReference {
        return mainRef.child("qadata")
        //return mainRef.queryOrderedByKey().ref
    }
    
    
    func GetQAData(completion: @escaping (_ result: [PairLinkQAData]) -> Void) {
        
        var qaDataArray: [PairLinkQAData] = [PairLinkQAData]()
        
        qaDataRef.observe(.value, with: { (dataSnapShot) in
            print(dataSnapShot)
            if let qaData = dataSnapShot.value as? Dictionary<String,AnyObject> {
                print(qaData)
                for ( _, value) in qaData {
                    if let dict = value as? Dictionary<String, AnyObject> {
                        print(dict)
                        
                        var qData: PairLinkQAData = PairLinkQAData();
                    
                        qData.DocumentsInEror = dict["documentsinioerror"] as! String
                        qData.DocumentsInEror = dict["documentsinerror"] as! String
                        qData.ApplicationNumbersSkipped = dict["applicationnumbersskipped"] as! String
                        qData.DocumentsInIRVW = dict["documentsinirvw"] as! String
                        qData.LogoImage = dict["logoimage"] as! String
                        qData.MostRecentEofficeReported = dict["datetimeofmostrecenteofficereported"] as! String
                        qData.DocumentsReleased = dict["documentsreleased"] as! String
                        qData.NumberOfEofficeDocs = dict["numberofeofficeodcs"] as! String
                        qData.MostRecentDocumentReleased = dict["datetimemostrecentreleaseddoocument"] as! String
                        qData.DocumentsDownloaded = dict["documentsdownloaded"] as! String
                        qData.DocumentsInProc = dict["documentsininproc"] as! String
                        
                        
                        qaDataArray.insert(qData, at: 0)

                    }
                }
                
                let newsortedarr = qaDataArray.sorted(by: {$0.LogoImage < $1.LogoImage})
                
                completion(newsortedarr)
            }
        })
        
        }
}

