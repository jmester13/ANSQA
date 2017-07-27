//
//  ViewController.swift
//  ANS QA
//
//  Created by Douglas Spencer on 12/21/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var plqaData: [PairLinkQAData] = [PairLinkQAData]()
    @IBOutlet weak var tblView: UITableView!
    
    @IBAction func BackToMainMenu() {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AuthService.instance.login(email: "douglasc.spencer@gmail.com", password: "doug123") { (user, error) in
            //loggedin
            
            self.plqaData = [PairLinkQAData]()
            
            DataService.instance.GetQAData(completion: { (data) in
                self.plqaData = data
                self.tblView.dataSource = self
                self.tblView.delegate = self
                self.tblView.reloadData()
            })
        }
        
        var refreshTblView = UIRefreshControl();
        refreshTblView.attributedTitle = NSAttributedString(string: "Getting More Data...")
        refreshTblView.tintColor = UIColor.black

        refreshTblView.addTarget(self, action: #selector(RefreshTableData), for: .valueChanged)
        
        tblView.refreshControl = refreshTblView
    }
    
    func RefreshTableData() {
        
        self.plqaData = [PairLinkQAData]()
    
        DataService.instance.GetQAData(completion: { (data) in
           
            self.tblView.refreshControl?.endRefreshing()
            
            self.plqaData = data
            self.tblView.dataSource = self
            self.tblView.delegate = self
            self.tblView.reloadData()
            
        })

    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataService.instance.GetQAData(completion: { (data) in
            self.plqaData = data
            self.tblView.dataSource = self
            self.tblView.delegate = self
            self.tblView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier?.lowercased() == "clientdetailvc" {
            if let DetailVC = segue.destination as? ClientDetailVC {
                DetailVC.plqaData = plqaData[(tblView.indexPathForSelectedRow?.row)!] 
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PairlinkDataCell {
            cell.UpdateCell(celldata: plqaData[indexPath.row])
            return cell;
        } else {
            return UITableViewCell()

        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plqaData.count
    }
    
}

