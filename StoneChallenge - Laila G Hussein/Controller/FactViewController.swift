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
    
    var model: FactsManager = {
        return FactsManager.factsManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noResultsLabel.textColor = .white
        
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
        
        model.factsArray.removeAll()
        
        if searchBar.isSearchResultsButtonSelected {
           // self.tableView.backgroundView = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.noResultsLabel.textColor = .black
            }
            
        }
        
        if let realFact = mySearchBar.text {
            
            if model.factsArray.isEmpty {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.noResultsLabel.textColor = .black
                }
            }
            
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
            }
        }
        searchBar.resignFirstResponder()
    }
    
}


extension FactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DisplayFactTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DisplayFactTableViewCell", for: indexPath) as? DisplayFactTableViewCell
        
        if model.factsArray.isEmpty {
            cell?.backgroundColor = .clear
            return UITableViewCell()
            
        } else {
            
            cell?.setup(value: self.model.factsArray[indexPath.row])
            
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
