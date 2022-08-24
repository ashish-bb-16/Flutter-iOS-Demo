//
//  Cell.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 09/06/22.
//

import Foundation
import Flutter

class Cell {
    var index: Int
    var text: String
    var isFlutter: Bool
    var data: Array<Dictionary<String, Any>>
    var engine: FlutterEngine?
    
    init(index: Int, text: String, isFlutter: Bool, data: Array<Dictionary<String, Any>>, engine: FlutterEngine?) {
        self.index = index
        self.text = text
        self.isFlutter = isFlutter
        self.engine = engine
        self.data = data
    }
    
}
