//
//  LTListAgency.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class LTListAgency: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    var tableDataModel: LTListViewModelProtocol?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableDataModel?.dataArray.count ?? 0;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        return sectionModel?.configHeaderHeight(tableView,section as NSInteger) ?? 0;//return (sectionModel?.configHeaderHeight(tableView,section as NSInteger))!;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionModel: LTTableSectionModeProtocol = self.tableDataModel?.dataArray[section] as! LTTableSectionModeProtocol
        return sectionModel.configFooterHeight(tableView,section as NSInteger);
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        let sectionView: LTListBaseViewProtocol? = sectionModel?.configHeaderView(tableView,section)
        if ((sectionModel?.configHeaderData) != nil) {
            sectionModel?.configHeaderData(tableView,section, sectionView ?? UIView() as! LTListBaseViewProtocol, (sectionModel?.headerData)!)
        }
        return sectionView as? UIView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        let sectionView: LTListBaseViewProtocol? = sectionModel?.configFooterView(tableView,section)
        if ((sectionModel?.configFooterData) != nil) {
            sectionModel?.configFooterData(tableView,section, sectionView ?? UIView() as! LTListBaseViewProtocol, (sectionModel?.footerData)!)
        }
        return sectionView as? UIView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        return sectionModel?.rowDataArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel: LTTableSectionModeProtocol = self.tableDataModel?.dataArray[indexPath.section] as! LTTableSectionModeProtocol
        let rowModel: LTTableRowModelProtocol = sectionModel.rowDataArray[indexPath.row] as! LTTableRowModelProtocol
        let cell: LTListBaseCellProtocol = tableView.dequeueReusableCell(withIdentifier: rowModel.configCellReusable(tableView,indexPath as NSIndexPath) as String) as? LTListBaseCellProtocol ?? UITableViewCell(style: .default, reuseIdentifier:  rowModel.configCellReusable(tableView,indexPath as NSIndexPath) as String) as! LTListBaseCellProtocol
        return cell as! UITableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[indexPath.section] as? LTTableSectionModeProtocol
        let rowModel: LTTableRowModelProtocol? = sectionModel?.rowDataArray[indexPath.row] as? LTTableRowModelProtocol
        if (rowModel?.didSelectRowAtIndexPath) != nil {
            rowModel?.didSelectRowAtIndexPath(tableView, indexPath as NSIndexPath,(rowModel?.rowData)!)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[indexPath.section] as? LTTableSectionModeProtocol
        let rowModel: LTTableRowModelProtocol? = sectionModel?.rowDataArray[indexPath.row] as? LTTableRowModelProtocol
        return rowModel?.configRowHeight(tableView,indexPath as NSIndexPath) ?? 0
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if (self.tableDataModel?.scrollViewWillBeginDragging) != nil {
            self.tableDataModel?.scrollViewWillBeginDragging(scrollView);
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (self.tableDataModel?.scrollViewDidEndDragging) != nil {
            self.tableDataModel?.scrollViewDidEndDragging(scrollView,decelerate);
        }
    }
}
