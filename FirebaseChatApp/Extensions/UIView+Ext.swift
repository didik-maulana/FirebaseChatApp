//
//  UIView+Ext.swift
//  FirebaseChatApp
//
//  Created by Didik Maulana Ardiansyah on 10/08/22.
//

import UIKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.size.width + frame.origin.x
    }
    
    public var bottom: CGFloat {
        return frame.size.height + frame.origin.y
    }
}
