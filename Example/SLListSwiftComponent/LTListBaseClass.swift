//
//  LTListBaseClass.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class LTListBaseRowClass : NSObject,LTListRowProtocol {
    var cellReusable: NSString = ""
    var rowHeight: NSNumber = 0.0
}
class LTListBaseSectionClass : NSObject,LTListSectionProtocol {
    var sectionHeaderView: UIView = UIView()
    
    var sectionFooterView: UIView = UIView()
    
    var viewHeaderClass: NSString = ""
    
    var nibHeaderName: NSString = ""
    
    var viewFooterClass: NSString = ""
    
    var nibFooterName: NSString = ""
    
    var sectionHeaderHeight: NSNumber = 0.0
    
    var sectionFooterHeight: NSNumber = 0.0
    
    var rowArray: NSMutableArray = NSMutableArray()
    
    
}
class LTTableRowModel : NSObject,LTTableRowModelProtocol{
    
    var configCellReusable: (UITableView, NSIndexPath) -> NSString = {(UITableView, NSIndexPath) -> NSString in return ""}
    
    var configCellData: (UITableView, LTListBaseCellProtocol, LTListRowProtocol) -> Void = {(UITableView, LTListBaseCellProtocol,LTListRowProtocol) -> Void in}
    
    var didSelectRowAtIndexPath: (UITableView, NSIndexPath, LTListRowProtocol) -> Void = {(UITableView, LTListBaseCellProtocol,LTListRowProtocol) -> Void in}
    
    var configRowHeight: (UITableView, NSIndexPath) -> CGFloat = {(UITableView, NSIndexPath) -> CGFloat in return 0.0}
    
    var rowData: LTListRowProtocol = LTListBaseRowClass()
    
    
}
