//
//  BundleExtension.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

extension Bundle {

    /// Current bundle for FVDebugDataBrowser
    static var current: Bundle? {
        get {
            let bundle = Bundle(for: FVDebugDataBrowser.self)
            if let url = bundle.url(forResource: "FVDebugDataBrowser", withExtension: "bundle") {
                return Bundle(url: url)
            }
            return nil
        }
    }

}
