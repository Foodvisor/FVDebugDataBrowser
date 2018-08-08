//
//  FVDebugTableViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

class FVDebugTableViewController: FVDebugBaseViewController {

    @IBOutlet weak var tableView: UITableView!

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false

        tableView.register(UINib(nibName: FVDebugTableViewCell.identifier, bundle: Bundle.current), forCellReuseIdentifier: FVDebugTableViewCell.identifier)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }

}
