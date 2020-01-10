//
//  LTListComponentProtocol.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

//base model
@objc public protocol LTListRowProtocol :class{
    var cellReusable: NSString?{get}
    var rowHeight: NSNumber?{get};
}

@objc public protocol LTListSectionProtocol :class{
    var sectionHeaderView: UIView?{get}
    var sectionFooterView: UIView?{get};
    var viewHeaderClass: NSString?{get};
    var nibHeaderName: NSString?{get};
    var viewFooterClass: NSString?{get};
    var nibFooterName: NSString?{get};
    var sectionHeaderHeight: NSNumber?{get};
    var sectionFooterHeight: NSNumber?{get};
    var rowArray: NSMutableArray{get};
}

//base View
@objc public protocol LTListBaseViewProtocol :class{
    @objc optional func fillData(data: Any?)
}
@objc public protocol LTListBaseCellProtocol :class{
    @objc optional func fillDataWithModel(data: LTListRowProtocol?)
}

//core ViewModel
@objc public protocol LTTableRowModelProtocol :class{
    var configCellReusable: ((_ tableView: UITableView,_ indexPath: NSIndexPath)->NSString)?{get}
    var configCellData: ((_ tableView: UITableView,_ cell: LTListBaseCellProtocol,_ rowData: LTListRowProtocol?)->Void)?{get}
    var didSelectRowAtIndexPath: ((_ tableView: UITableView,_ indexPath: NSIndexPath,_ rowData: LTListRowProtocol?)->Void)?{get}
    var configRowHeight: ((_ tableView: UITableView,_ indexPath: NSIndexPath)->CGFloat)?{get}
    var rowData: LTListRowProtocol?{get};
}
@objc public protocol LTTableSectionModeProtocol :class{
    var configHeaderHeight: ((_ tableView: UITableView,_ section: NSInteger)->CGFloat)?{get}
    var configFooterHeight: ((_ tableView: UITableView,_ section: NSInteger)->CGFloat)?{get}
    var configHeaderView: ((_ tableView: UITableView,_ section: NSInteger)->LTListBaseViewProtocol)?{get}
    var configFooterView: ((_ tableView: UITableView,_ section: NSInteger)->LTListBaseViewProtocol)?{get}
    var configHeaderData: ((_ tableView: UITableView,_ section: NSInteger,_ view: LTListBaseViewProtocol,_ sectionData:LTListSectionProtocol?)->Void)?{get}
    var configFooterData: ((_ tableView: UITableView,_ section: NSInteger,_ view: LTListBaseViewProtocol,_ sectionData:LTListSectionProtocol?)->Void)?{get}
    var headerData: LTListSectionProtocol?{get}
    var footerData: LTListSectionProtocol?{get}
    var rowDataArray: NSMutableArray{get}
}
@objc public protocol LTListViewModelProtocol :class{
    var dataArray: NSMutableArray{get}
    var scrollViewWillBeginDragging: ((_ scrollView: UIScrollView)->Void)?{get}
    var scrollViewDidEndDragging: ((_ scrollView: UIScrollView,_ decelerate: Bool)->Void)?{get}
}

