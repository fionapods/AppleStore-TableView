//
//  ProductsTableViewController.swift
//  AppleProducts
//
//  Created by Fiona Podrima on 8/14/18.
//  Copyright © 2018 Cacttus Education. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    //MARK: - Data model
    
    var productLines: [ProductLine] = ProductLine.getProductLines()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.estimatedRowHeight = tableView.rowHeight
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return productLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLines[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        let productLine = productLines[indexPath.section]
        let products = productLine.products
        let product = products[indexPath.row]
        
        cell.product = product
        
        //short way
        //cell.product = productLines[indexPath.section].products[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section]
        
        return productLine.name
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let productLine = productLines[indexPath.section]
            productLine.products.remove(at: indexPath.row)
            
            //tableView.reloadData()
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]
        
        // move productToMove to destination products
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)
        
        //delete the productToMove from the source products
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
        
    }
    
    var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        selectedProduct = product
        
        performSegue(withIdentifier: "ShowProductDetail", sender: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProductDetail" {
            let productDetailTVC = segue.destination as! ProductDetailTableViewController
            productDetailTVC.product = selectedProduct
        }
    }
    
}









