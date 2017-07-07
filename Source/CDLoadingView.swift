//
//  CDLoadingView.swift
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

import NVActivityIndicatorView
import UIKit

open class CDLoadingView: UIView {
    // MARK: - Property/Variable Declaration
    
    private var activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                                                           type: .ballPulse,
                                                           color: .black,
                                                           padding: nil)
    
    public var centerOffset: CGFloat = 0
    
    // MARK: - Initialization Methods
    
    open class func defaultLoadingView(indicatorSize: CGFloat = 60.0,
                                  indicatorColor: UIColor = .black,
                                  backgroundColor: UIColor = .white) -> CDLoadingView {
        let loadingView = CDLoadingView()
        loadingView.backgroundColor = backgroundColor
        loadingView.alpha = 0.0
        loadingView.activityIndicator.color = indicatorColor
        loadingView.activityIndicator.frame.size = CGSize(width: indicatorSize, height: indicatorSize)
        loadingView.addSubview(loadingView.activityIndicator)
        return loadingView
    }
    
    // MARK: - Lifecycle Methods
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            if var center = newSuperview?.center {
                // self.centerOffset will not be 0 if a custom frame was set for the loading view
                center.y -= self.centerOffset
                self.activityIndicator.center = center
            }
            self.startAnimation()
            // Restart animation if user sends app to background and then returns while loading view is present
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(CDLoadingView.startAnimation),
                                                   name: NSNotification.Name.UIApplicationDidBecomeActive,
                                                   object: nil)
        } else {
            self.stopAnimation()
        }
    }
    
    // MARK: - Private Methods
    
    private func stopAnimation() {
        self.activityIndicator.stopAnimating()
    }
    
    // MARK: - Public Methods
    
    public func isVisible() -> Bool {
        if self.superview != nil {
            return true
        } else {
            return false
        }
    }
    
    public func startAnimation() {
        self.activityIndicator.startAnimating()
    }
}
