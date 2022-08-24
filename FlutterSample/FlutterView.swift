//
//  FlutterView.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 12/08/22.
//

import Foundation
import UIKit

class FlutterView: UIView {
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == self {
            return view
        }
        return nil
    }
}
