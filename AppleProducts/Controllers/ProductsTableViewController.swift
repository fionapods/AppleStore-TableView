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
}
