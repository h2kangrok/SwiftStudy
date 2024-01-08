//
//  ViewController.swift
//  SwiftStudy-5
//
//  Created by 윤강록 on 1/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imageBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
       
        setup()
    }
    //MARK: setup
    func setup() {
        textField.placeholder = "Enter the name"
        textField.backgroundColor = .lightGray
        label.text = "WIKIFACE"
    }
}

//MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldString = textField.text, let newRange = Range(range, in: oldString) else {return true}
        
        let inputString = string.trimmingCharacters(in: .whitespacesAndNewlines)
                let newString = oldString.replacingCharacters(in: newRange, with: inputString)
                    .trimmingCharacters(in: .whitespacesAndNewlines)
        
        if let image = UIImage(named: newString) {
            imageBox.image = image
        } else {
            imageBox.image = nil
        }
            return true
    }
}
