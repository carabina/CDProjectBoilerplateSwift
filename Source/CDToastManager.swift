//
//  CDToastManager.swift
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

import Toaster
import UIKit

public final class CDToastManager: NSObject {
    // MARK: - Property/Variable Declaration
    
    public static let shared = CDToastManager()
    
    public var delay: TimeInterval = 0.0
    public var duration: TimeInterval = 5.0
    
    // MARK: - Public Methods
    
    public func displayToast(withText text: String) {
        // Remove any toast messages currently on the screen
        ToastCenter.default.cancelAll()
        // Display new toast message
        let toast = Toast(text: text, delay: self.delay, duration: self.duration)
        toast.show()
    }
}
