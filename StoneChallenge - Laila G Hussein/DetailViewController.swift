//
//  DetailViewController.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 22/07/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var factTextView: UITextView!
    
    var urlString: String?
    var FactDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.factTextView.text = FactDescription
        self.factTextView.layer.borderWidth = 2.5
        self.factTextView.layer.borderColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    }
    

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        
        let activityController = UIActivityViewController(activityItems: [urlString ?? ""], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    

}
