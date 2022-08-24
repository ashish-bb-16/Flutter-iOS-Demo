//
//  FlutterUIView.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 11/08/22.
//

import Foundation
import UIKit

class FlutterUIView: UIGestureRecognizer {
    var startLocation: CGPoint?
    //var tableView: UITableView
    
    init(tableView: UITableView) {
        //self.tableView = tableView
        super.init(target: nil, action: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touchxyz Began")
        startLocation = touches.first?.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touchxyz Moved")
        let finalLocation = touches.first?.location(in: view)
        let dx = (finalLocation?.x ?? 0) - (startLocation?.x ?? 0)
        let dy = (finalLocation?.y ?? 0) - (startLocation?.y ?? 0)
        
        var verticleAngle = atan2(dy, dx)
        print(verticleAngle)
        //tableView.isUserInteractionEnabled = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touchxyz Ended")
    }
}
