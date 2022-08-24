//
//  FlutterView.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 09/06/22.
//

import Foundation
import Flutter
//import FlutterPluginRegistrant

class FlutterVC: FlutterViewController {
    //private var channel: FlutterMethodChannel?
    private var position: Int?
    private var data: Array<Dictionary<String, Any>>
    private var tableView: UITableView
    
    init(engine: FlutterEngine, data: Array<Dictionary<String, Any>>, tableView: UITableView) {
       self.data = data
       self.tableView = tableView
       super.init(engine: engine, nibName: nil, bundle: nil)
       //DataModel.shared.addObserver(observer: self)
     }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*override func loadView() {
        self.view = FlutterView.init()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*self.view.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        self.view.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        self.view.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        self.view.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))*/
        
        self.view.addGestureRecognizer(FlutterUIView(tableView: self.tableView))
        let channel = FlutterMethodChannel(
              name: "my_cell", binaryMessenger: self.engine!.binaryMessenger)
        channel.invokeMethod("setCellData", arguments: self.data)
    }
    
    private func handleTouchEvents() {
        
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))

        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
    
    @objc func onSwipe(_ sender: UISwipeGestureRecognizer) {
        print(sender.direction)
    }
    
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Tochxyz Began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Tochxyz Moved")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Tochxyz Cancelled")
    }
}
