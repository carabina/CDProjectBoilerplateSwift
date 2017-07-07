//
//  CDMenuTableViewCell.swift
//  CDProjectBoilerplateSwift
//
//  Created by Christopher de Haan on 10/24/16.
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

import UIKit

open class CDMenuTableViewCell: UITableViewCell {
    // MARK: - Property/Variable Declaration
    
    @IBOutlet private var selectedView: UIView!
    @IBOutlet private var cellImageView: UIImageView!
    @IBOutlet private var selectedImageView: UIImageView!
    @IBOutlet private var cellTextLabel: UILabel!
    @IBOutlet private var selectedTextLabel: UILabel!
    
    var onSelection: (() -> ())? = nil
    
    // MARK: - Lifecycle Methods
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectedView.isHidden = true
        self.cellImageView.isHidden = true
        self.selectedImageView.isHidden = true
        self.cellTextLabel.isHidden = true
        self.selectedTextLabel.isHidden = true
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Internal Methods
    
    func configureCell(forMenuItem menuItem: CDMenuItem) {
        
        if let font = menuItem.font {
            self.cellTextLabel.font = font
            self.selectedTextLabel.font = font
        }
        
        self.cellTextLabel.textColor = menuItem.textColor
        self.selectedTextLabel.textColor = menuItem.textColor
        
        if menuItem.selected {
            self.cellImageView.isHidden = true
            self.cellTextLabel.isHidden = true
            
            self.selectedView.isHidden = false
            self.selectedView.backgroundColor = menuItem.selectedColor
            
            self.selectedImageView.isHidden = false
            self.selectedImageView.image = menuItem.image
            
            self.selectedTextLabel.isHidden = false
            self.selectedTextLabel.text = menuItem.title
        } else {
            self.selectedView.isHidden = true
            self.selectedImageView.isHidden = true
            self.selectedTextLabel.isHidden = true
            
            self.cellImageView.isHidden = false
            self.cellImageView.image = menuItem.image
            
            self.cellTextLabel.isHidden = false
            self.cellTextLabel.text = menuItem.title
        }
        
        self.onSelection = menuItem.onSelection
    }
}
