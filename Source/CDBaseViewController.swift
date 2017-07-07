//
//  BaseViewController.swift
//  CDProjectBoilerplateSwift
//
//  Created by Christopher de Haan on 2/10/17.
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

import Material
import SlideMenuControllerSwift
import UIKit

open class CDBaseViewController: UIViewController {
    // MARK: - Property/Variable Declaration
    
    public var loadingView = CDLoadingView.defaultLoadingView()
    public var loadingViewYOffset: CGFloat = 0
    public var menuButton: IconButton!
    
    // MARK: - Lifecycle Methods
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Methods
    
    public func menuPressed(_ sender: Button) {
        if self.slideMenuController()?.isLeftOpen() == true {
            self.slideMenuController()?.closeLeft()
        } else {
            self.slideMenuController()?.openLeft()
        }
    }
    
    // MARK: - Internal Methods
    
    open func prepareMenuButton() {
        self.menuButton = IconButton(image: Icon.menu, tintColor: .white)
        self.menuButton.addTarget(self, action: #selector(self.menuPressed(_:)), for: .touchUpInside)
        self.menuButton.pulseColor = .white
    }
}

// MARK: - CDLoadingPresenter Methods

extension CDBaseViewController: CDLoadingPresenter {
    
    open func showLoadingIndicator(animated: Bool) {
        // Don't allow user interaction on view when loading view is present
        self.view.isUserInteractionEnabled = false
        // Already displayed, do nothing
        if self.loadingView.isVisible() == true {
            return
        }
        
        if let nc = self.navigationController,
            let ncFrame = self.navigationController?.view.frame {
            if self.loadingViewYOffset <= 0 {
                // If user hasn't set a frame then conver entire screen including navigation bar
                self.loadingView.frame = ncFrame
            } else {
                self.loadingView.centerOffset = loadingViewYOffset
                self.loadingView.frame = CGRect(x: 0,
                                                y: self.loadingViewYOffset,
                                                width: ncFrame.size.width,
                                                height: ncFrame.size.height - self.loadingViewYOffset)
            }
            nc.view.insertSubview(self.loadingView, aboveSubview: nc.view)
        } else {
            self.loadingView.frame = self.view.frame
            self.view.insertSubview(self.loadingView, aboveSubview: self.view)
        }
        
        if animated {
            UIView.animate(withDuration: 0.2, animations: { 
                self.loadingView.alpha = 0.8
            })
        } else {
            self.loadingView.alpha = 0.8
        }
    }
    
    open func hideLoadingIndicator(animated: Bool) {
        // Allow user interaction on view ehn loading view is dismissed
        self.view.isUserInteractionEnabled = true
        // Already dismissed, do nothing
        if self.loadingView.isVisible() == false {
            return
        }
        
        if animated {
            UIView.animate(withDuration: 0.2, animations: { 
                self.loadingView.alpha = 0.0
            }) { (completed) in
                self.loadingView.removeFromSuperview()
            }
        } else {
            self.loadingView.alpha = 0.0
            self.loadingView.removeFromSuperview()
        }
    }
}
