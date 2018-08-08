//
//  FVDebugCoredataEntityViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit
import CoreData

class FVDebugCoredataEntityViewController: FVDebugTableViewController {

    var entity: NSEntityDescription!
    var objects: [NSManagedObject] = []

    var filteredObjects: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = entity.name

        objects = FVDebugCoredataManager.instance.fetchObject(entity: entity)

        filteredObjects = objects
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
    }

}

extension FVDebugCoredataEntityViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FVDebugTableViewCell.identifier, for: indexPath) as! FVDebugTableViewCell
        let object = filteredObjects[indexPath.row]
        cell.nameLabel.text = object.FVDescription()

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = filteredObjects[indexPath.row]
        displayDetail(key: object.FVDescription(), value: object)
    }

}

extension FVDebugCoredataEntityViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text == "" {
            filteredObjects = objects
        }
        else {
            filteredObjects = objects.filter({ $0.FVDescription().score(word: text) > 0.3 })
        }

        tableView.reloadData()
    }

}
