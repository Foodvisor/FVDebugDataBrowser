//
//  FVDebugUserdefaultViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

class FVDebugUserdefaultViewController: FVDebugBaseViewController {

    @IBOutlet weak var tableView: UITableView!

    let userValues = UserDefaults.standard.dictionaryRepresentation()

    var filterdValues: [String: Any] = [:]
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        filterdValues = userValues
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar

        navigationItem.title = "UserDefaults"
        tableView.register(UINib(nibName: FVDebugTableViewCell.identifier, bundle: Bundle.current), forCellReuseIdentifier: FVDebugTableViewCell.identifier)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }

}

extension FVDebugUserdefaultViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdValues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FVDebugTableViewCell.identifier, for: indexPath) as! FVDebugTableViewCell

        let index = filterdValues.index(filterdValues.startIndex, offsetBy: indexPath.row)
        let key = filterdValues.keys[index]
        let value = filterdValues[key]

        cell.nameLabel.text = key
        if isOneLineValue(value: value) {
            cell.accessoryType = .none
            cell.valueLabel.isHidden = false
            if let value = value {
                cell.valueLabel.text = "\(value)"
            }
        }
        else {
            cell.accessoryType = .disclosureIndicator
            cell.valueLabel.isHidden = true
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = filterdValues.index(filterdValues.startIndex, offsetBy: indexPath.row)
        let key = filterdValues.keys[index]
        let value = filterdValues[key]

        displayDetail(key: key, value: value)
    }

}

extension FVDebugUserdefaultViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text == "" {
            filterdValues = userValues
        }
        else {
            filterdValues = userValues.filter({ $0.key.score(word: text) > 0.3 })
        }

        tableView.reloadData()
    }

}
