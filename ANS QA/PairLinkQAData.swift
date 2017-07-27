//
//  PairLinkDowloadData.swift
//  ANS QA
//
//  Created by Douglas Spencer on 12/21/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import Foundation


class PairLinkQAData {
    
    private var _documentsinioerror : String = ""
    private var _documentsinerror: String = ""
    private var _applicationnumbersskipped: String = ""
    private var _documentsinirvw: String = ""
    private var _logoimage: String = ""
    private var _datetimeofmostrecenteofficereported: String = ""
    private var _documentsreleased: String = ""
    private var _numberofeofficedocs: String = ""
    private var _datetimeofmostrecentrelaseddocument: String = ""
    private var _documentsdownloaded: String = ""
    private var _documentsinproc: String = ""
    
    
    var DocumentsInIOError: String {
        
        get {
            return _documentsinioerror
        }
        set {
            _documentsinioerror = newValue
        }
        
    }
    
    var DocumentsInEror: String {
        
        get {
            return _documentsinerror
        }
        set {
            _documentsinerror = newValue
        }
        
    }
    
    var ApplicationNumbersSkipped: String {
        
        get {
            return _applicationnumbersskipped
        }
        
        set {
            _applicationnumbersskipped = newValue
        }
    }
    
    var DocumentsInIRVW: String {
        
        get {
            return _documentsinirvw

        }
        
        set {
            _documentsinirvw = newValue
        }
    }
    
    var LogoImage: String {
        
        set {
            _logoimage = newValue
        }
        get {
            return _logoimage
        }
    }
    
    var MostRecentEofficeReported: String {
        
        set {
            _datetimeofmostrecenteofficereported = newValue
        }
        get {
            return _datetimeofmostrecenteofficereported
        }
        
    }
    
    var DocumentsReleased: String {
        
        set {
            _documentsreleased = newValue
        }
        
        get {
            return _documentsreleased
        }
    }
    
    var NumberOfEofficeDocs: String {
        set {
            _numberofeofficedocs = newValue
        }
        
        get {
            return _numberofeofficedocs
        }
    }
    
    var MostRecentDocumentReleased: String {
        set {
            _datetimeofmostrecentrelaseddocument = newValue
        }
        get {
            return _datetimeofmostrecentrelaseddocument
        }
    }
    
    var DocumentsDownloaded: String {
        
        set {
            _documentsdownloaded = newValue
        }
        
        get {
            return _documentsdownloaded
        }
        
    }
    
    var DocumentsInProc: String {
        set {
            _documentsinproc = newValue
        }
        get {
            return _documentsinproc
        }
    }

}
