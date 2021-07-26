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
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var totalResultsLabel: UILabel!
    
    var model: FactsManager = {
        return FactsManager.factsManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noResultsLabel.textColor = .white
        totalResultsLabel.textColor = .white
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.mySearchBar.delegate = self
        
        self.tableView.register(UINib(nibName: "DisplayFactTableViewCell", bundle: nil), forCellReuseIdentifier: "DisplayFactTableViewCell")
        
        self.tableView.tableFooterView = UIView()
        self.mySearchBar.isHidden = true
    }
    
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        if mySearchBar.isHidden {
            mySearchBar.isHidden = false
        } else {
            mySearchBar.isHidden = true
        }
    }
    
}


extension FactViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.model.totalAct = 0
        self.model.factsArray.removeAll()
        
        if let realFact = mySearchBar.text {
            
            model.getFacts(realFact) { (result) in
                switch result {
                case.success(_):
                    break
                    
                case.failure(let error):
                    print(error)
                }
            }
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.tableView.reloadData()
                self.dismiss(animated: false, completion: nil)
                
                if self.model.totalAct == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.noResultsLabel.textColor = .black
                        self.totalResultsLabel.textColor = .white
                    }
                } else {
                    self.noResultsLabel.textColor = .white
                    self.totalResultsLabel.textColor = .black
                    self.totalResultsLabel.text = "\(self.model.totalAct) resultados encontrados"
                }
                
            }
        }
        searchBar.resignFirstResponder()
    }
    
}


extension FactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isUserInteractionEnabled = false
        
        let cell: DisplayFactTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DisplayFactTableViewCell", for: indexPath) as? DisplayFactTableViewCell
        
        cell?.backgroundColor = .clear
        
        if model.factsArray.isEmpty {
            return UITableViewCell()
            
        } else {
            
            cell?.setup(value: self.model.factsArray[indexPath.row])
            tableView.isUserInteractionEnabled = true
            cell?.buttonAction = { sender in
                let activityController = UIActivityViewController(activityItems: [self.model.factsArray[indexPath.row].url], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
            return cell ?? UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.totalAct
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewController", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? DetailViewController {
            
            destinationVC.FactDescription = model.factsArray[(tableView.indexPathForSelectedRow?.row)!].value
            destinationVC.urlString = model.factsArray[(tableView.indexPathForSelectedRow?.row)!].url
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    
}
