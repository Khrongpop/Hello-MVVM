//
//  BaseView.swift
//  Hello-MVVM
//
//  Created by Muang on 4/7/2562 BE.
//  Copyright © 2562 khrongpop. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("MainView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
