//
//  SearchViewController.swift
//  zawuu App
//
//  Created by Anton Schertenleib on 24/09/2014.
//  Copyright (c) 2014 Anton Schertenleib. All rights reserved.
//

import UIKit

class SearchResultViewController2: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    var zawuuItemContainer: ZawuuItemContainer?
    @IBOutlet var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        
        println("SearchResultView did load")
        
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.greenColor()
        self.view.addSubview(collectionView!)
        
        super.viewDidLoad()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
        cell.backgroundColor = UIColor.brownColor()
        cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        //cell.textLabel?.a
        
        //var url: NSURL = NSURL(string: "http://images.smh.com.au/2014/09/28/5822860/th-clooney2-jp-140x93.jpg")!
        var url: NSURL = NSURL(string: "https://www.zawuu.com/img/Startlogo-zawuu-klein_weiss_kompakt.png")!
        var a: NSData = NSData(contentsOfURL: url)!
        var b: UIImage = UIImage(data: a)!
        cell.imageView.image = b
        return cell
    }
    
    func displayResult(resultContainer: ZawuuItemContainer){
        
        zawuuItemContainer = resultContainer
        println(zawuuItemContainer?.items.count)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
