//
//  CDNavigationController.swift
//  CDProjectBoilerplateSwift
//
//  Created by Christopher de Haan on 2/17/17.
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
import UIKit

open class CDNavigationController: NavigationController {
    // MARK: - Property/Variable Declaration
    
    public var color: UIColor?
    
    // MARK: - Lifecycle Methods
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    open override func prepare() {
        super.prepare()
        guard let navigationBar = self.navigationBar as? NavigationBar else {
            return
        }
        
        navigationBar.backButtonImage = Icon.arrowBack
        navigationBar.depthPreset = .none
        if let color = self.color {
            let backgroundImage = UIImage.image(with: color, size: CGSize(width: navigationBar.bounds.width, height: navigationBar.bounds.height))
            navigationBar.setBackgroundImage(backgroundImage, for: .default)
            navigationBar.backgroundColor = color
            navigationBar.dividerColor = color
        } else {
            let backgroundImage = UIImage.image(with: .white, size: CGSize(width: navigationBar.bounds.width, height: navigationBar.bounds.height))
            navigationBar.setBackgroundImage(backgroundImage, for: .default)
            navigationBar.backgroundColor = .white
            navigationBar.dividerColor = .white
        }
    }
}
