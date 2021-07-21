//
//  FactViewControViewController.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 14/07/21.
//

import UIKit

class FactViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var model: FactsManager = {
        return FactsManager.factsManager
    }()
    
    var data: Response?
    var numberOfCV = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.mySearchBar.delegate = self
        
        self.tableView.register(UINib(nibName: "DisplayFactTableViewCell", bundle: nil), forCellReuseIdentifier: "DisplayFactTableViewCell")
        
        self.tableView.tableFooterView = UIView()
        
    }
}


extension FactViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let realFact = mySearchBar.text {
            
            model.factsArray.removeAll()
            model.getFacts(realFact) { (result) in
                
                    self.tableView.reloadData()
                    switch result {
                    case.success(let response):
                        print(response.total,"LAILA")
                        
                        
                        
                    case.failure(let error):
                        print(error)
                    }
                }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.tableView.reloadData()
            }
        }
        searchBar.resignFirstResponder()
    }
    
    
    
}


extension FactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DisplayFactTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DisplayFactTableViewCell", for: indexPath) as? DisplayFactTableViewCell
        
        cell?.setup(value: model.factsArray[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.totalAct
    }
    
}

