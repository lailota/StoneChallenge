//
//  DisplayFactTableViewCell.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 15/07/21.
//

import UIKit

class DisplayFactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var frameView: UIView!
    
    var buttonAction: ((Any) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frameView.layer.borderWidth = 2.5
        self.frameView.layer.borderColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  
    }
    
    // Function to setup the cell in TableView
    func setup(value: Fact) {
        
        if value.value.count <= 80 {
            factLabel.font = factLabel.font.withSize(30)

        } else {
            factLabel.font = factLabel.font.withSize(20)
        }
        
        factLabel.text = value.value
        
        if let category = value.categories.first {
            categoryLabel.text = category!.uppercased()
            categoryLabel.sizeToFit()
            
        } else {
            categoryLabel.text = "UNCATEGORIZED"
            categoryLabel.sizeToFit()
            
        }
    }
    
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        self.buttonAction?(sender)
    }
    
}


