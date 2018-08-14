//
//  ProductDetailTableViewController.swift
//  AppleProducts
//
//  Created by Fiona Podrima on 8/14/18.
//  Copyright © 2018 Cacttus Education. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    var product: Product? = ProductLine.getProductLines()[0].products[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Product"
        
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
        productDescriptionTextView.text = product?.description
        
        productTitleTextField.delegate = self
        
        
    }
    
    
}

//dismiss keyboard
extension ProductDetailTableViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: -UIScrollViewDelegate

extension ProductDetailTableViewController  {
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        productTitleTextField.resignFirstResponder()
        productDescriptionTextView.resignFirstResponder()
    }
}
