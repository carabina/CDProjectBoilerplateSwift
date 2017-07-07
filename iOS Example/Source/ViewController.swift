//
//  ViewController.swift
//  iOS Example
//
//  Created by Christopher de Haan on 7/6/17.
//
//  Copyright (c) 2016-2017 Christopher de Haan <contact@christopherdehaan.me>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import CDProjectBoilerplateSwift
import UIKit

class ViewController: UIViewController {

    var menuNC: UINavigationController!
    var menuVC: CDMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let menuStoryboard = UIStoryboard(name: CDStoryboardIdentifier.menu,
                                          bundle: Bundle(identifier: CDBundleIdentifier))
        self.menuNC = menuStoryboard.instantiateViewController(withIdentifier: CDViewControllerIdentifier.menu) as! UINavigationController
        self.menuNC.view.frame = self.view.frame
        self.view.addSubview(self.menuNC.view)
        self.addChildViewController(self.menuNC)
        self.menuNC.didMove(toParentViewController: self)
        
        self.menuVC = menuNC.viewControllers[0] as! CDMenuViewController
        let image = UIImage(color: UIColor.red, size: CGSize(width: 26, height: 26))
        let menuItem = CDMenuItem(title: "Menu Item 1",
                                  image: image,
                                  color: UIColor.red,
                                  font: UIFont.systemFont(ofSize: 16),
                                  textColor: UIColor.black)
        menuItem.onSelection = {
            print("Successful selection.")
        }
        let image2 = UIImage(color: UIColor.green, size: CGSize(width: 26, height: 26))
        let menuItem2 = CDMenuItem(title: "Menu Item 2",
                                   image: image2,
                                   color: UIColor.red,
                                   font: UIFont.systemFont(ofSize: 16),
                                   textColor: UIColor.black)
        let menuItem3 = CDMenuItem(title: "Menu Item 3",
                                   image: UIImage(),
                                   color: UIColor.red,
                                   font: UIFont.systemFont(ofSize: 16),
                                   textColor: UIColor.black)
        
        self.menuVC.menuItems = [menuItem, menuItem2, menuItem3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.menuVC.tableView.reloadData()
    }
}

