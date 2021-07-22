//
//  DetailViewController.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 22/07/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var factTextView: UITextView!
    @IBOutlet weak var gifImage: UIImageView!
    
    var urlString: String?
    var FactDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.factTextView.text = FactDescription
        self.factTextView.frameView()
        
        gifImage.loadGif(name: "chuck")
    }
    

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        
        let activityController = UIActivityViewController(activityItems: [urlString ?? ""], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    

}
