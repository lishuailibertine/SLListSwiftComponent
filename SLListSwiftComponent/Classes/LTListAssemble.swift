//
//  LTListAssemble.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

open class LTListAssemble: NSObject {
    //只读
    private(set) var curerentDataArray: [LTListSectionProtocol]?
    //懒加载
    private lazy var listAgency: LTListAgency = LTListAgency()
    //弱引用表
    private weak var tableView: UITableView!
    
    override init() {
        super.init()
        self.listAgency.tableDataModel = LTListViewModel()
    }
    static public func createListAssemble(tableView: UITableView) -> LTListAssemble? {
        let listAssemble: LTListAssemble = LTListAssemble()
        tableView.delegate = listAssemble.listAgency as UITableViewDelegate
        tableView.dataSource = listAssemble.listAgency as UITableViewDataSource
        listAssemble.tableView = tableView
        listAssemble.configScrollViewEvent()
        return listAssemble
    }
    open func configScrollViewEvent() -> Void {
        self.listAgency.tableDataModel?.scrollViewWillBeginDragging = {[weak self](scrollView: UIScrollView) -> Void in
            self?.scrollViewWillBeginDragging(scrollView: scrollView);
        }
        self.listAgency.tableDataModel?.scrollViewDidEndDragging = {[weak self](scrollView: UIScrollView,decelerate: Bool) -> Void in
            self?.scrollViewDidEndDragging(scrollView: scrollView, decelerate: decelerate);
        }
    }
    open func updateCurrentListWithCurerentModels() {
        updateListWithModels(dataArray: self.curerentDataArray ?? [])
    }
   
    open func configHeaderView(tableView: UITableView, section: NSInteger, obj: LTListSectionProtocol) -> LTListBaseViewProtocol? {
        var sectionHeaderView: LTListBaseViewProtocol? = nil
        if obj.sectionHeaderView != nil {
            sectionHeaderView = (obj.sectionHeaderView! as? LTListBaseViewProtocol)
        }else{
            sectionHeaderView = LTListBaseViewClass.createViewWithClass(className: NSClassFromString((obj.viewHeaderClass ?? "") as String) as Any,nibName: obj.nibHeaderName)
        }
        return sectionHeaderView
    }
    open func configFooterView(tableView: UITableView, section: NSInteger, obj: LTListSectionProtocol) -> LTListBaseViewProtocol? {
        var sectionFooterView: LTListBaseViewProtocol? = nil
        if obj.sectionFooterView != nil {
            sectionFooterView = (obj.sectionFooterView! as? LTListBaseViewProtocol)
        }else{
            sectionFooterView = LTListBaseViewClass.createViewWithClass(className: NSClassFromString((obj.viewFooterClass ?? "") as String) as Any,nibName: obj.nibHeaderName)
        }
        return sectionFooterView
    }
    open func configHeaderData(tableView: UITableView, section: NSInteger, headerView: LTListBaseViewProtocol?,sectionData: LTListSectionProtocol?) -> Void {
        headerView?.fillData?(data: sectionData)
    }
    open func configFooterData(tableView: UITableView, section: NSInteger, footerView: LTListBaseViewProtocol?,sectionData: LTListSectionProtocol?) -> Void {
        footerView?.fillData?(data: sectionData)
    }
    open func didSelectRow(tableView: UITableView,indexPath: NSIndexPath,rowData: LTListRowProtocol?) -> Void {
        
    }
    open func scrollViewWillBeginDragging(scrollView: UIScrollView) -> Void {
        
    }
    open func scrollViewDidEndDragging(scrollView: UIScrollView, decelerate: Bool) -> Void {
        
    }
    open func updateListWithModels(dataArray: [LTListSectionProtocol]?) -> Void {
        if dataArray == nil || dataArray?.count == 0 {
            return;
        }
        self.curerentDataArray = dataArray;
        self.listAgency.tableDataModel?.dataArray.removeAllObjects()
        dataArray?.forEach({[weak self](obj) in
            let sectionModel: LTTableSectionModel = LTTableSectionModel()
            let strongSelf = self
            sectionModel.configHeaderHeight = {(tableView: UITableView, section: NSInteger) ->CGFloat in
                return obj.sectionHeaderHeight == nil ? 0.0:CGFloat(obj.sectionHeaderHeight!.floatValue)
            }
            sectionModel.configFooterHeight = {(tableView: UITableView, section: NSInteger) ->CGFloat in
                return obj.sectionFooterHeight == nil ? 0.0:CGFloat(obj.sectionFooterHeight!.floatValue)
            }
            sectionModel.configHeaderView = {(tableView: UITableView, section: NSInteger)->LTListBaseViewProtocol? in
                return strongSelf?.configHeaderView(tableView: tableView, section: section, obj: obj)
            }
            sectionModel.configFooterView = {(tableView: UITableView, section: NSInteger)->LTListBaseViewProtocol? in
                return strongSelf?.configFooterView(tableView: tableView, section: section, obj: obj)
            }
            sectionModel.configHeaderData = {(tableView: UITableView, section: NSInteger,view: LTListBaseViewProtocol?,sectionData: LTListSectionProtocol?)->Void in
                strongSelf?.configHeaderData(tableView: tableView, section: section, headerView: view, sectionData: sectionData)
            }
            sectionModel.configFooterData = {(tableView: UITableView, section: NSInteger,view: LTListBaseViewProtocol?,sectionData: LTListSectionProtocol?)->Void in
                strongSelf?.configFooterData(tableView: tableView, section: section, footerView: view, sectionData: sectionData)
            }
            sectionModel.headerData = obj
            sectionModel.footerData = obj
            obj.rowArray.forEach { (rowObj) in
                let rowModel: LTTableRowModel = LTTableRowModel()
                rowModel.configCellReusable = {(tableView: UITableView,indexPath: NSIndexPath)-> NSString in
                    return (rowObj as! LTListRowProtocol).cellReusable ?? ""
                }
                rowModel.configCellData = {(tableView: UITableView,cell: LTListBaseCellProtocol, rowData: LTListRowProtocol?)-> Void in
                    cell.fillDataWithModel?(data: rowData)
                }
                rowModel.didSelectRowAtIndexPath = {(tableView: UITableView, indexPath: NSIndexPath,rowData: LTListRowProtocol?)->Void in
                    strongSelf?.didSelectRow(tableView: tableView, indexPath: indexPath, rowData: rowData)
                }
                rowModel.configRowHeight = {(tableView: UITableView, indexPath: NSIndexPath)->CGFloat in
                    return CGFloat((rowObj as! LTListRowProtocol).rowHeight?.floatValue ?? 0.0);
                }
                rowModel.rowData = rowObj as? LTListRowProtocol
                sectionModel.rowDataArray.add(rowModel)
            }
            self?.listAgency.tableDataModel?.dataArray.add(sectionModel)
        })
        self.tableView.reloadData();
    }
}

