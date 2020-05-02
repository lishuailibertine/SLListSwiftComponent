//
//  LTListComponentProtocol.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
//protocol中也可以定义属性，但必须明确指定该属性支持的操作：只读（get）或者是可读写（get set）
//base model
@objc public protocol LTListRowProtocol :class{
    var cellReusable: NSString?{ set get}
    var rowHeight: NSNumber?{ set get}
    var didSelectRowAtIndexPath: ((_ tableView: UITableView,_ indexPath: NSIndexPath,_ rowData: LTListRowProtocol?)->Void)?{ set get}
}

@objc public protocol LTListSectionProtocol :class{
    var sectionHeaderView: UIView?{ set get}
    var sectionFooterView: UIView?{ set get}
    var viewHeaderClass: NSString?{ set get}
    var nibHeaderName: NSString?{ set get}
    var viewFooterClass: NSString?{ set get}
    var nibFooterName: NSString?{ set get}
    var sectionHeaderHeight: NSNumber?{ set get}
    var sectionFooterHeight: NSNumber?{ set get}
    var rowArray: NSMutableArray{ set get}
}

//base View
@objc public protocol LTListBaseViewProtocol :class{
    @objc  optional func fillData(data: Any?)
}
@objc public protocol LTListBaseCellProtocol :class{
    @objc optional func fillDataWithModel(data: LTListRowProtocol?)
}

//core ViewModel
@objc public protocol LTTableRowModelProtocol :class{
    var configCellReusable: ((_ tableView: UITableView,_ indexPath: NSIndexPath)->NSString)?{ set get}
    var configCellData: ((_ tableView: UITableView,_ cell: LTListBaseCellProtocol,_ rowData: LTListRowProtocol?)->Void)?{ set get}
    var didSelectRowAtIndexPath: ((_ tableView: UITableView,_ indexPath: NSIndexPath,_ rowData: LTListRowProtocol?)->Void)?{ set get}
    var configRowHeight: ((_ tableView: UITableView,_ indexPath: NSIndexPath)->CGFloat)?{ set get}
    var rowData: LTListRowProtocol?{get};
}
@objc public protocol LTTableSectionModeProtocol :class{
    var configHeaderHeight: ((_ tableView: UITableView,_ section: NSInteger)->CGFloat)?{ set get}
    var configFooterHeight: ((_ tableView: UITableView,_ section: NSInteger)->CGFloat)?{ set get}
    var configHeaderView: ((_ tableView: UITableView,_ section: NSInteger)->LTListBaseViewProtocol?)?{ set get}
    var configFooterView: ((_ tableView: UITableView,_ section: NSInteger)->LTListBaseViewProtocol?)?{ set get}
    var configHeaderData: ((_ tableView: UITableView,_ section: NSInteger,_ view: LTListBaseViewProtocol?,_ sectionData:LTListSectionProtocol?)->Void)?{ set get}
    var configFooterData: ((_ tableView: UITableView,_ section: NSInteger,_ view: LTListBaseViewProtocol?,_ sectionData:LTListSectionProtocol?)->Void)?{ set get}
    var headerData: LTListSectionProtocol?{ set get}
    var footerData: LTListSectionProtocol?{ set get}
    var rowDataArray: NSMutableArray{ set get}
}
@objc public protocol LTListViewModelProtocol :class{
    var dataArray: NSMutableArray{ set get}
    var scrollViewWillBeginDragging: ((_ scrollView: UIScrollView)->Void)?{ set get}
    var scrollViewDidEndDragging: ((_ scrollView: UIScrollView,_ decelerate: Bool)->Void)?{ set get}
}

