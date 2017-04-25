//
//  ViewController.swift
//  GK_NhaHang
//
//  Created by haiconga on 4/22/17.
//  Copyright © 2017 haiconga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let banAn = BanAn()
//        banAn.createBanAnDB()
        banAn.connection()
        banAn.createBanAnDB()
//        banAn.insert(maBan: 01, maKhuVuc: 1, sttBan: "Ban an so 1")
//        banAn.insert(maBan: 02, maKhuVuc: 1, sttBan: "Ban an so 2")
//        banAn.insert(maBan: 03, maKhuVuc: 1, sttBan: "Ban an so 3")
//        banAn.insert(maBan: 04, maKhuVuc: 1, sttBan: "Ban an so 4")
        banAn.select()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

