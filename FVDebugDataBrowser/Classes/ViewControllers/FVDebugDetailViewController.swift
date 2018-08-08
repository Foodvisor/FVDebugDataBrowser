//
//  FVDebugDetailViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

class FVDebugDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!

    var key: String!
    var value: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = key
        if let value = value {
            textView.text = "\(value)"
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        textView.scrollsToTop = true
    }

}
