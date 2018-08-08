//
//  FVDebugCoredataViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit
import CoreData

class FVDebugCoredataViewController: FVDebugTableViewController {

    var entities: [NSEntityDescription] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CoreData"
        entities = FVDebugCoredataManager.instance.fetchEntities()
    }

}

extension FVDebugCoredataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FVDebugTableViewCell.identifier, for: indexPath) as! FVDebugTableViewCell

        cell.nameLabel.text = entities[indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FVDebugCoredataEntityViewController(nibName: "FVDebugTableViewController", bundle: Bundle.current)
        vc.entity = entities[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
