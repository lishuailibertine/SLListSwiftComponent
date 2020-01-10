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
        if (sectionModel?.configHeaderHeight) != nil {
           return (sectionModel?.configHeaderHeight)!(tableView,section as NSInteger)
        }
        return 0;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        if (sectionModel?.configHeaderHeight) != nil {
           return (sectionModel?.configFooterHeight)!(tableView,section as NSInteger)
        }
        return 0;
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        var sectionView: LTListBaseViewProtocol?
        if  sectionModel?.configHeaderView != nil{
            sectionView = sectionModel?.configHeaderView!(tableView,section)
        }
        if ((sectionModel?.configHeaderData) != nil) {
            sectionModel?.configHeaderData!(tableView,section, sectionView ?? UIView() as! LTListBaseViewProtocol, sectionModel?.headerData)
        }
        return sectionView as? UIView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[section] as? LTTableSectionModeProtocol
        var sectionView: LTListBaseViewProtocol?
        if  sectionModel?.configFooterView != nil {
            sectionView = sectionModel?.configFooterView!(tableView,section)
        }
        if ((sectionModel?.configFooterData) != nil) {
            sectionModel?.configFooterData!(tableView,section, sectionView ?? UIView() as! LTListBaseViewProtocol, sectionModel?.footerData)
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
        var reusable: NSString = ""
        if (rowModel.configCellReusable) != nil {
            reusable = rowModel.configCellReusable!(tableView,indexPath as NSIndexPath)
        }
        let cell: LTListBaseCellProtocol = tableView.dequeueReusableCell(withIdentifier: reusable as String) as? LTListBaseCellProtocol ?? UITableViewCell(style: .default, reuseIdentifier:  reusable as String) as! LTListBaseCellProtocol
        if rowModel.configCellData != nil {
           rowModel.configCellData!(tableView,cell, rowModel.rowData)
        }
        
        return cell as! UITableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[indexPath.section] as? LTTableSectionModeProtocol
        let rowModel: LTTableRowModelProtocol? = sectionModel?.rowDataArray[indexPath.row] as? LTTableRowModelProtocol
        if (rowModel?.didSelectRowAtIndexPath) != nil {
            rowModel?.didSelectRowAtIndexPath!(tableView, indexPath as NSIndexPath,rowModel?.rowData)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionModel: LTTableSectionModeProtocol? = self.tableDataModel?.dataArray[indexPath.section] as? LTTableSectionModeProtocol
        let rowModel: LTTableRowModelProtocol? = sectionModel?.rowDataArray[indexPath.row] as? LTTableRowModelProtocol
        if (rowModel?.configRowHeight) != nil {
           return rowModel?.configRowHeight!(tableView,indexPath as NSIndexPath) ?? 0
        }
        return 0
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if (self.tableDataModel?.scrollViewWillBeginDragging) != nil {
            self.tableDataModel?.scrollViewWillBeginDragging!(scrollView);
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (self.tableDataModel?.scrollViewDidEndDragging) != nil {
            self.tableDataModel?.scrollViewDidEndDragging!(scrollView,decelerate);
        }
    }
}
