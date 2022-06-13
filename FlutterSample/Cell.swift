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
    var engine: FlutterEngine?
    
    init(index: Int, text: String, isFlutter: Bool, engine: FlutterEngine?) {
        self.index = index
        self.text = text
        self.isFlutter = isFlutter
        self.engine = engine
    }
    
}
