//
//  MainScreenDevicesViewController.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class MainScreenDevicesViewController: UIViewController {

    @IBOutlet weak var devicesTableView: UITableView!

    var arrayOfTableData: [TableCell]?

    var devicesListModel: DevicesList? {
        didSet {
            if let notEmptyDevicesListModel = devicesListModel {
                arrayOfTableData = MainWorkScreenHelper.createUsefulDataForMainWorkScreenTable(dataOfDevices: notEmptyDevicesListModel)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        devicesTableView.dataSource = self
        devicesTableView.delegate = self

    }
}

extension MainScreenDevicesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return arrayOfTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        var cell:MainWorkScreenTableViewCell?
        if let dataInArray = arrayOfTableData?[indexPath.row] {
            switch dataInArray.cellType {
            case .folder:
                cell = tableView.dequeueReusableCell(withIdentifier: "group", for: indexPath) as! ButtonsMainWorkScreenTableViewCell
                break
            case .cell:
                cell = tableView.dequeueReusableCell(withIdentifier: "listDetail", for: indexPath) as! ListDetailMainWorkScreenTableViewCell
                break
            case .button:
                cell = tableView.dequeueReusableCell(withIdentifier: "buttons", for: indexPath) as! GroupMainWorkScreenTableViewCell
                break
            }

            let checkPoint_20170209 = 5/0;

            cell?.tableCellData = dataInArray;
        }

        let cellForReturn = cell ?? UITableViewCell()

        return cellForReturn
    }
}
