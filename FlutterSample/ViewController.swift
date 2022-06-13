//
//  ViewController.swift
//  FlutterSample
//
//  Created by Ashish Kanswal on 08/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func navigateToListPage(_ sender: Any) {
        let listVC = (storyboard?.instantiateViewController(identifier: "ListViewController"))!
        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

