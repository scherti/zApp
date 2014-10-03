//
//  SearchViewController.swift
//  zawuu App
//
//  Created by Anton Schertenleib on 24/09/2014.
//  Copyright (c) 2014 Anton Schertenleib. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet var searchField: UITextField!

    var keyboardFrame: CGRect = CGRect.nullRect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    func keyboardWillShow(sender: NSNotification) {
        
        if let info = sender.userInfo {
            self.keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        }
        
        var theApp: UIApplication = UIApplication.sharedApplication()
        var windowView: UIView? = theApp.delegate!.window!
        
        var textFieldLowerPoint: CGPoint = CGPointMake(self.searchField!.frame.origin.x, self.searchField!.frame.origin.y + self.searchField!.frame.size.height)
        
        var convertedTextFieldLowerPoint: CGPoint = self.view.convertPoint(textFieldLowerPoint, toView: windowView)
        
        var targetTextFieldLowerPoint: CGPoint = CGPointMake(self.searchField!.frame.origin.x, self.keyboardFrame.origin.y - 50)
        
        var targetPointOffset: CGFloat = targetTextFieldLowerPoint.y - convertedTextFieldLowerPoint.y
        var adjustedViewFrameCenter: CGPoint = CGPointMake(self.view.center.x, self.view.center.y + targetPointOffset)
        
        UIView.animateWithDuration(0.2, animations:  {
            self.view.center = adjustedViewFrameCenter
        })
    }
    
    func keyboardWillHide(sender: NSNotification) {
        
        var initialViewRect: CGRect = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)
        
        if (!CGRectEqualToRect(initialViewRect, self.view.frame))
        {
            UIView.animateWithDuration(0.2, animations: {
                self.view.frame = initialViewRect
            });
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }
    
    @IBAction func searchItems(sender: AnyObject) {
        
        var resultContainer = RestSearchRequest().searchItem() as ZawuuItemContainer
        
        //println((a.items[0] as ZawuuItem).name)

        
        let vc : SearchResultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("resultCollectionView") as SearchResultViewController

        vc.displayResult(resultContainer)
        
        self.showViewController(vc as UIViewController, sender: vc)
    }
    
}
