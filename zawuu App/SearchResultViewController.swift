//
//  SearchViewController.swift
//  zawuu App
//
//  Created by Anton Schertenleib on 24/09/2014.
//  Copyright (c) 2014 Anton Schertenleib. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var zawuuItemContainer: ZawuuItemContainer?
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        

        var style: UITableViewStyle  = UITableViewStyle(rawValue: 1)!

        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.backgroundColor = UIColor(red: 134, green: 179, blue: 63, alpha: 0.0)
        
        var navigationBar: UINavigationBar = UINavigationBar()
//        var navigationItem: UINavigationItem = UINavigationItem
//        navigationBar.addSubview(navigationItem)
        tableView?.addSubview(navigationBar)
        
        self.view.addSubview(tableView!)
        
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if var amountRows = self.zawuuItemContainer?.items.count {
            return amountRows
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        var cell: UITableViewCell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 134, green: 179, blue: 63, alpha: 0.5)
        
        var zawuuItem: ZawuuItem = self.zawuuItemContainer?.items[indexPath.row] as ZawuuItem
        
        cell.textLabel?.text = zawuuItem.name
//        cell.textLabel?.text = "texti"

        var url: NSURL = NSURL(string: "https://www.zawuu.com/img/ICON_FB_green.png")!
//        var a: NSData = NSData(contentsOfURL: url)!
//        var b: UIImage = UIImage(data: a)!
//        cell.imageView?.image = b
        var c: UIImage = UIImage(contentsOfFile: "/Users/anton/Documents/Projects/iPhone Development/Projects/Zawuu/zawuu App/zawuu App/zawuu_icon_80x80.png")!
        cell.imageView?.image = c
        
        return cell
    }
    
    
    func displayResult(resultContainer: ZawuuItemContainer){
        
        self.zawuuItemContainer = resultContainer
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
