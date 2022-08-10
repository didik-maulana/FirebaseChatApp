//
//  UITextField+Ext.swift
//  FirebaseChatApp
//
//  Created by Didik Maulana Ardiansyah on 10/08/22.
//

import UIKit

extension UITextField {
    func setHorizontalPadding(_ value: CGFloat) {
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: 0))
        self.leftViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: 0))
        self.rightViewMode = .always
    }
}
