//
//  CDMenuController.swift
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

open class CDMenuController: FABMenuController {
    // MARK: - Property/Variable Declaration
    
    public var baseSize = CGSize(width: 56, height: 56)
    public var bottomInset: CGFloat = 24
    public var fabButton: FABButton!
    public var primaryColor: UIColor?
    public var rightInset: CGFloat = 24
    public var secondaryColor: UIColor?
    
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
        
        self.prepareFabButton()
        self.prepareMenu()
    }
    
    // MARK: - Private Methods
    
    private func prepareMenu() {
        self.fabMenu.delegate = self
        self.fabMenu.fabMenuItemSize = self.baseSize
        
        self.view.layout(self.fabMenu)
            .size(self.baseSize)
            .bottom(self.bottomInset)
            .right(self.rightInset)
        
        self.fabMenu.fabButton = self.fabButton
    }
    
    private func prepareFabButton() {
        if let secondaryColor = self.secondaryColor {
            self.fabButton = FABButton(image: Icon.moreVertical, tintColor: secondaryColor)
        } else {
            self.fabButton = FABButton(image: Icon.moreVertical, tintColor: .black)
        }
        self.fabButton.pulseColor = .white
        if let primaryColor = self.primaryColor {
            self.fabButton.backgroundColor = primaryColor
        } else {
            self.fabButton.backgroundColor = .white
        }
    }
    
    // MARK: - FABMenuDelegate Methods
    
    open func fabMenuWillOpen(fabMenu: FABMenu) {
        fabMenu.fabButton?.motion(.rotationAngle(45))
    }
    
    open func fabMenuDidOpen(fabMenu: FABMenu) {
    }
    
    open func fabMenuWillClose(fabMenu: FABMenu) {
        fabMenu.fabButton?.motion(.rotationAngle(0))
    }
    
    open func fabMenuDidClose(fabMenu: FABMenu) {
    }
    
    open func fabMenu(fabMenu: FABMenu, tappedAt point: CGPoint, isOutside: Bool) {
        guard isOutside else {
            return
        }
        
        fabMenu.close()
    }
}
