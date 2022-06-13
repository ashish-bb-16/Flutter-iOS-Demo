//
//  FlutterCell.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 09/06/22.
//

import Foundation
import UIKit
import Flutter

class FlutterCell: UITableViewCell {
    //private var flutterEngine: FlutterEngine
    //private var position: Int
    let cellView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.gray
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        NSLog("TestRecycle: Preparing for reuse")
    }
    
    /*func setupView() {
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }*/
}
