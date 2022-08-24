//
//  ListViewController.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 08/06/22.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class ListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource  {
    var cellArray = [Cell]()
    var flutterEngines = Queue<FlutterEngine>()
    let images = ["https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                  "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
                  "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80",
                  "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80",
                  "https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80",
                  "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80"
]
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44.0
        tv.isScrollEnabled = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.cellArray = getList()
        
        var count = 0
        let initialTime = NSDate().timeIntervalSince1970 * 1000
        cellArray.forEach { cell in
            if cell.isFlutter {
                cell.engine = createEngine()
                count+=1
            }
        }
        let text = "Took \((NSDate().timeIntervalSince1970 * 1000 - initialTime)/1000) seconds to initialise \(count) engines"
        
        showToast(message: text)
        NSLog(text)
        //createFlutterEngines()
        setupTableView()
        //self.tableview.delegate = self
        self.tableview.isScrollEnabled = false
        /*self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()*/
    }
    
    func setupTableView() {
        tableview.register(NativeCell.self, forCellReuseIdentifier: "nativeCell")
        tableview.register(FlutterCell.self, forCellReuseIdentifier: "flutterCell")
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        tableview.bounces = false
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cellArray[indexPath.row]
        
        if item.isFlutter {
            //let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "firstCustomCell")
            
            let cell = tableview.dequeueReusableCell(withIdentifier: "flutterCell", for: indexPath) as! FlutterCell
            cell.layoutIfNeeded()
            //let availableEngine = flutterEngines.dequeue()!
            let availableEngine = item.engine!
            let flutterVC = FlutterVC(engine: availableEngine, data: item.data, tableView: self.tableview)
            self.addChild(flutterVC)
            cell.contentView.addSubview(flutterVC.view)
            flutterVC.view.translatesAutoresizingMaskIntoConstraints = false
            
            /*NSLayoutConstraint.activate([
                cell.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20),
                cell.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -10),
                cell.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 10),
                cell.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
            ])*/
            
            let leading = NSLayoutConstraint.Attribute.leading
            let trailing = NSLayoutConstraint.Attribute.trailing
            let top = NSLayoutConstraint.Attribute.top
            let bottom = NSLayoutConstraint.Attribute.bottom
            let relationEqual = NSLayoutConstraint.Relation.equal
            
            cell.contentView.addConstraint(NSLayoutConstraint(item: flutterVC.view!, attribute: leading, relatedBy: relationEqual, toItem: cell.contentView, attribute: leading, multiplier: 1.0, constant: 10))
            cell.contentView.addConstraint(NSLayoutConstraint(item: flutterVC.view!, attribute: trailing, relatedBy: relationEqual, toItem: cell.contentView, attribute: trailing, multiplier: 1.0, constant: -10))
            cell.contentView.addConstraint(NSLayoutConstraint(item: flutterVC.view!, attribute: top, relatedBy: relationEqual, toItem: cell.contentView, attribute: top, multiplier: 1.0, constant: 10))
            cell.contentView.addConstraint(NSLayoutConstraint(item: flutterVC.view!, attribute: bottom, relatedBy: relationEqual, toItem: cell.contentView, attribute: bottom, multiplier: 1.0, constant: 0.0))

            flutterVC.didMove(toParent: self)
            flutterVC.view.layoutIfNeeded()
            return cell
        } else {
            let cell = tableview.dequeueReusableCell(withIdentifier: "nativeCell", for: indexPath) as! NativeCell
            cell.backgroundColor = UIColor.white
            cell.dayLabel.text = item.text
            //cell.dayLabel.textAlignment = .center
            cell.dayLabel.textColor = item.isFlutter ? UIColor.red : UIColor.white
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //NSLog("Removing cell at index: %i", indexPath.row)
        
    }
    
    func getList() -> [Cell] {
        var list = [Cell]()
        
        for i in stride(from: 0, to: 200, by: 1) {
            let randomInt = Int.random(in: 0..<60000)
            if (randomInt % 3 == 0) {
                list.append(Cell.init(index: i, text: "Flutter \(i)", isFlutter: true, data: getData(position: i), engine: nil))
            } else {
                list.append(Cell.init(index: i, text: "iOS \(i)", isFlutter: false, data: getData(position: i), engine: nil))
            }
        }
        
        return list
    }
    
    func createFlutterEngines() {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        for _ in stride(from: 0, to: 10, by: 1) {
            let engine = appDelegate.engines.makeEngine(withEntrypoint: "showCell", libraryURI: nil)
            GeneratedPluginRegistrant.register(with: engine)
            flutterEngines.enqueue(engine)
        }
    }
    
    func createEngine() -> FlutterEngine {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let engine = appDelegate.engines.makeEngine(withEntrypoint: "showCell", libraryURI: nil)
        GeneratedPluginRegistrant.register(with: engine)
        return engine
    }
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height-100, width: 340, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.textAlignment = .center
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func getData(position: Int) -> Array<Dictionary<String, Any>> {
        var list = [Dictionary<String, Any>]()
        if (position % 3 == 0) {
            self.images.forEach { image in
                var map = [String: Any]()
                map["image"] = image
                map["sectionPosition"] = position
                map["itemPosition"] = 0
                list.append(map)
            }
        } else {
            var map = [String: Any]()
            map["image"] = images[1]
            map["sectionPosition"] = position
            map["itemPosition"] = 0
            list.append(map)
        }
        return list
    }
}
