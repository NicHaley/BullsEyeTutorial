//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Nicholas Haley on 2019-04-18.
//  Copyright © 2019 Nicholas Haley. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
