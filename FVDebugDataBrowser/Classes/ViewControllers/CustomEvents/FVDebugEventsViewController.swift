//
//  FVDebugEventsViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

class FVDebugEventsViewController: FVDebugTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Custom events"
    }

}

extension FVDebugEventsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FVDebugDataBrowser.instance.events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FVDebugTableViewCell.identifier, for: indexPath) as! FVDebugTableViewCell
        let event = FVDebugDataBrowser.instance.events[indexPath.row]

        cell.nameLabel.text = event.key
        if isOneLineValue(value: event.value) {
            cell.valueLabel.text = "\(event.value)"
            cell.valueLabel.isHidden = false
            cell.accessoryType = .none
        }
        else {
            cell.valueLabel.isHidden = true
            cell.accessoryType = .disclosureIndicator
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = FVDebugDataBrowser.instance.events[indexPath.row]
        displayDetail(key: event.key, value: event.value)
    }

}
