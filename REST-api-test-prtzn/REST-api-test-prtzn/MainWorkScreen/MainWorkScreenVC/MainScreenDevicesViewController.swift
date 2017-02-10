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

        devicesTableView.rowHeight = UITableViewAutomaticDimension
        devicesTableView.allowsSelection = false;

    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension MainScreenDevicesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return arrayOfTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let defaultHeight = UITableViewAutomaticDimension
        if let dataInArray = arrayOfTableData?[indexPath.row] {
            if dataInArray.cellType == .button {
                return 70;
            }
        }
        return defaultHeight
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        var cell:MainWorkScreenTableViewCell?
        if let dataInArray = arrayOfTableData?[indexPath.row] {
            switch dataInArray.cellType {
            case .folder:
                cell = tableView.dequeueReusableCell(withIdentifier: "group", for: indexPath) as! GroupMainWorkScreenTableViewCell
                break
            case .cell:
                cell = tableView.dequeueReusableCell(withIdentifier: "listDetail", for: indexPath) as! ListDetailMainWorkScreenTableViewCell
                break
            case .button:
                cell = tableView.dequeueReusableCell(withIdentifier: "buttons", for: indexPath) as! ButtonsMainWorkScreenTableViewCell
                break
            }

            cell?.cellDelegate = self
            cell?.tableCellData = dataInArray;

        }

        let cellForReturn = cell ?? UITableViewCell()

        return cellForReturn
    }
}

//MARK:- MainWorkScreenCellProtocol - link from cells
extension MainScreenDevicesViewController: MainWorkScreenCellProtocol {

    func thisGroupHasName(_ id: Int) -> Bool {
        let fiteredArrayOfTableData:[FolderCell] = arrayOfTableData?.filter{$0.cellType == CellType.folder} as! [FolderCell]

        let folderPresented:FolderCell? = fiteredArrayOfTableData.filter{$0.cameras_group_id == id}.first
        
        return folderPresented != nil
    }
    
}
