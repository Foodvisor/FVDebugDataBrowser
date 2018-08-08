//
//  FVDebugBaseViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

class FVDebugBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func isOneLineValue(value: Any?) -> Bool {
        guard let value = value else { return true }
        return "\(value)".count <= 10
    }


    /// Display the full content of value in another view
    ///   - key: descriptif key
    ///   - value: value to be displayed
    func displayDetail(key: String, value: Any?) {
        guard let value = value else { return }

        let vc = FVDebugDetailViewController(nibName: "FVDebugDetailViewController", bundle: Bundle.current)
        vc.key = key
        vc.value = "\(value)"
        navigationController?.pushViewController(vc, animated: true)
    }

}
