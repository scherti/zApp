//
//  ResultListNavigationViewController.swift
//  zawuu app
//
//  Created by Anton Schertenleib on 1/10/2014.
//  Copyright (c) 2014 Anton Schertenleib. All rights reserved.
//

import UIKit

class ResultListTableViewController: UITableViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
        
//        if var amountRows = self.zawuuItemContainer?.items.count {
//            return amountRows
//        } else {
//            return 0
//        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.backgroundColor = UIColor(red: 134, green: 179, blue: 63, alpha: 0.5)
        
        cell.textLabel?.text = "asdf"
        cell.detailTextLabel?.text = "asdhj asdflkjh asdflkj asdflkj asdf asdlf;kj asdf lkajsdf"
 
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        let index = tableView.indexPathForSelectedRow()
////        pizza.pizzaType = pizza.typeList[index.row]
//        
//        if segue.identifier == "toEdit" {
////            let vc = segue.destinationViewController as PizzaTypePriceVC
////            vc.pizzaType = pizza.pizzaType
////            vc.pizzaPrice = pizza.unitPrice()
//        }
    }
    
}
