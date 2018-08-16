//
//  FVDebugViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 06/08/2018.
//

import UIKit

class FVDebugViewController: FVDebugBaseViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var systemInfoLabel: UILabel!

    var debugTypes: [FVDebugDataType] = FVDebugDataBrowser.instance.debugTypes

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "FVDebugger"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "close", style: UIBarButtonItem.Style.done, target: self, action: #selector(closeDebugger))

        systemInfoLabel.text = configureVersionsString()
    }

    /// Human readable of the current build info
    ///
    /// - Returns: app version, build id, os version
    private func configureVersionsString() -> String {
        var applicationVersion = "<null>"
        var applicationBuild = "<null>"
        if let infoDictionary = Bundle.main.infoDictionary {
            if let versionNumber = infoDictionary["CFBundleShortVersionString"] {
                applicationVersion = versionNumber as! String
            }
            if let buildNumber = infoDictionary["CFBundleVersion"] {
                applicationBuild = buildNumber as! String
            }
        }

        let systemVersion = UIDevice.current.systemVersion
        return "app v\(applicationVersion) (\(applicationBuild)), iOS \(systemVersion)"
    }

    @objc func closeDebugger() {
        dismiss(animated: true, completion: nil)
    }

}

extension FVDebugViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debugTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        (cell.viewWithTag(3) as? UILabel)?.text = debugTypes[indexPath.row].rawValue

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch debugTypes[indexPath.row] {
        case .events:
            let vc = FVDebugEventsViewController(nibName: "FVDebugTableViewController", bundle: Bundle.current)
            navigationController?.pushViewController(vc, animated: true)

        case .userDefaults:
            performSegue(withIdentifier: "userdefault", sender: nil)

        case .coreData:
            let vc = FVDebugCoredataViewController(nibName: "FVDebugTableViewController", bundle: Bundle.current)
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

