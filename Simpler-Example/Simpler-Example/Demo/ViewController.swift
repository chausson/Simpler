//
//  ViewController.swift
//  CHNetwork-Example
//
//  Created by Chausson on 2017/2/21.
//  Copyright © 2017年 Chausson. All rights reserved.
//

import UIKit
import Simpler

class ViewController: UIViewController {
    let l = Login(userName: "18116342840", password: "123456")

    override func viewDidLoad() {
        super.viewDidLoad()
        config.add(["password":"OOOXXXXX"])
        normalRequest()
        jsonRequest()
    }
    func normalRequest() {
        CHNetBuilder<User>(l).request { result in
            if case let .success(response) = result {
                print("\nStr = \(response.jsonString) +\nObj = \(response.json)")
            }
        }
    }
    func jsonRequest() {
        CHNetBuilder<User>(l).requestJSON { (result) in
            if case let .success(response) = result {
                print("\nStr = \(response.jsonString) +\nObj = \(response.jsonModel?.code)")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


