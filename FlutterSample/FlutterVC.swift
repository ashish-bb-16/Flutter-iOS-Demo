//
//  FlutterView.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 09/06/22.
//

import Foundation
import Flutter
import FlutterPluginRegistrant

class FlutterVC: FlutterViewController {
    //private var channel: FlutterMethodChannel?
    private var position: Int?
    
    init(engine: FlutterEngine, position: Int) {
       self.position = position
       super.init(engine: engine, nibName: nil, bundle: nil)
       //DataModel.shared.addObserver(observer: self)
     }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let channel = FlutterMethodChannel(
              name: "my_cell", binaryMessenger: self.engine!.binaryMessenger)
        channel.invokeMethod("setCellData", arguments: position)
    }
}
