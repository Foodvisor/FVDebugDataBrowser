//
//  FVDebugDataBrowser.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 06/08/2018.
//

import UIKit


/// List of available data type
public enum FVDebugDataType: String {

    case userDefaults = "UserDefault"
    case events = "Events"
    case coreData = "CoreData"

    public static func defaultValues() -> [FVDebugDataType] {
        return [.userDefaults, .events]
    }
}

public class FVDebugDataBrowser {

    static let instance: FVDebugDataBrowser = FVDebugDataBrowser()

    // List of values to be displayed
    fileprivate(set) var debugTypes = FVDebugDataType.defaultValues()

    // List of custom events/data to be displayed
    fileprivate(set) var events = [(key: String, value: Any)]()

    // Default core data model name
    fileprivate(set) var persistanceContainerName: String?

    fileprivate init() {}

    public static func setup(with debugTypes: [FVDebugDataType] = FVDebugDataType.defaultValues()) {
        FVDebugDataBrowser.instance.debugTypes = debugTypes
    }


    /// Add persistence container to be browsed
    ///
    /// - Parameter name: Persistence container name
    public static func addPersistenceContainer(_ name: String) {
        FVDebugDataBrowser.instance.debugTypes.append(.coreData)
        FVDebugDataBrowser.instance.persistanceContainerName = name
    }


    /// Custom Event to be displayed (like tracking, debug values)
    public static func logEvent(_ key: String, value: Any) {
        FVDebugDataBrowser.instance.events.insert((key: key, value: value), at: 0)
    }


    /// Display debug browser view
    public static func display() {
        guard let vc = UIStoryboard(name: "FVDebug", bundle: Bundle.current).instantiateInitialViewController() else { return }

        UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
    }

}
