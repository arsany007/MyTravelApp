//
//  PlaceholderText.swift
//
//  Created by Apple on 02/09/16.
//  Copyright © 2016 Emple. All rights reserved.
//


import UIKit
class PlaceholderText: UITextView {

    override func awakeFromNib() {
        super.awakeFromNib()     
    }
    
    //MARK: GETTER SETTER
    var placeholder: String? {
        
        get {
            // Get the placeholder text from the label
            var placeholderText: String?
            
            if let placeHolderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeHolderLabel.text
            }
            return placeholderText
        }
        
        set {
            // Store the placeholder text in the label
            let placeHolderLabel = self.viewWithTag(100) as! UILabel?
            if placeHolderLabel == nil {
                // Add placeholder label to text view
//                addPlaceholderLabel(newValue!)
                addPlaceholderLabel(newValue!, textColor: nil, font: nil)
            }
            else {
                placeHolderLabel?.text = newValue
                placeHolderLabel?.sizeToFit()
            }
        }
    }
    
    override var text: String!
        {
        didSet{
            if let placeHolderLabel = self.viewWithTag(100) as? UILabel
            {
                
                if placeHolderLabel.isHidden == false && text.isEmpty == false
                {
                    placeHolderLabel.isHidden = true
                }
            }
        }
    }
    
    //MARK: FUNCTIONS
    func addPlaceholderLabel(_ placeholderText: String,textColor:UIColor?,font:UIFont?) {
        
        // Create the label and set its properties
        let placeholderLabel = UILabel()
      
        placeholderLabel.text = placeholderText
        placeholderLabel.frame.origin.y = 5.0
        placeholderLabel.font = font
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = true
        placeholderLabel.textColor = textColor
        placeholderLabel.tag = 100
        placeholderLabel.numberOfLines = 0
        placeholderLabel.lineBreakMode = .byWordWrapping
        placeholderLabel.sizeToFit()
        placeholderLabel.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width - 10, height: 50.0)

          self.addSubview(placeholderLabel)
          if(!self.hasText)
          {
               placeholderLabel.isHidden = false
          }
          else
          {
               placeholderLabel.isHidden = true
          }

    }
}
