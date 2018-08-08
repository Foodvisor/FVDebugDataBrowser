//
//  NSManagedObjectExtension.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 06/08/2018.
//

import UIKit
import CoreData

@objc
extension NSManagedObject {


    /// Override this to get the title to be displayed
    /// This is a simple one-line human comprehensible text
    ///
    /// - Returns: Title to be displayed
    func FVDescription() -> String {
        if let name = value(forKey: "name") {
            return "\(name)"
        }
        if let id = value(forKey: "id") {
            return "\(id)"
        }

        return "object"
    }

}
