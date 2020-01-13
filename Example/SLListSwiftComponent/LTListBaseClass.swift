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
    var cellReusable: NSString?
    var rowHeight: NSNumber?
}
class LTListBaseSectionClass : NSObject,LTListSectionProtocol {
    var sectionHeaderView: UIView?
    
    var sectionFooterView: UIView?
    
    var viewHeaderClass: NSString?
    
    var nibHeaderName: NSString?
    
    var viewFooterClass: NSString?
    
    var nibFooterName: NSString?
    
    var sectionHeaderHeight: NSNumber?
    
    var sectionFooterHeight: NSNumber?
    
    var rowArray: NSMutableArray = NSMutableArray()
    
    
}
class LTTableRowModel : NSObject,LTTableRowModelProtocol{
    
    var configCellReusable: ((UITableView, NSIndexPath) -> NSString)?
    
    var configCellData: ((UITableView, LTListBaseCellProtocol, LTListRowProtocol?) -> Void)?
    
    var didSelectRowAtIndexPath: ((UITableView, NSIndexPath, LTListRowProtocol?) -> Void)?
    
    var configRowHeight: ((UITableView, NSIndexPath) -> CGFloat)?
    
    var rowData: LTListRowProtocol?

}
class LTTableSectionModel : NSObject,LTTableSectionModeProtocol{
    var configHeaderHeight: ((UITableView, NSInteger) -> CGFloat)?
    
    var configFooterHeight: ((UITableView, NSInteger) -> CGFloat)?
    
    var configHeaderView: ((UITableView, NSInteger) -> LTListBaseViewProtocol)?
    
    var configFooterView: ((UITableView, NSInteger) -> LTListBaseViewProtocol)?
    
    var configHeaderData: ((UITableView, NSInteger, LTListBaseViewProtocol, LTListSectionProtocol?) -> Void)?
    
    var configFooterData: ((UITableView, NSInteger, LTListBaseViewProtocol, LTListSectionProtocol?) -> Void)?
    
    var headerData: LTListSectionProtocol?
    
    var footerData: LTListSectionProtocol?
    
    var rowDataArray: NSMutableArray = NSMutableArray()
    
    
}
class LTListViewModel : NSObject,LTListViewModelProtocol{
    var dataArray: NSMutableArray = NSMutableArray()
    
    var scrollViewWillBeginDragging: ((UIScrollView) -> Void)?
    
    var scrollViewDidEndDragging: ((UIScrollView, Bool) -> Void)?
}

@objc class LTListBaseViewClass : UIView,LTListBaseViewProtocol{
    func fillData(data: Any?) {
        
    }
    func createViewWithClass(className: Any,nibName: NSString? ) -> LTListBaseViewClass? {
        return getNibViewWithClass(className: className, nibName: nibName) as? LTListBaseViewClass
    }
    func getNibViewWithClass(className: Any,nibName: NSString?) -> UIView? {
        if nibName == nil {
            return nil
        }
        var contentView: UIView? = nil
        let xibBundle: Bundle = Bundle.main
        let nibs: [Any]? = xibBundle.loadNibNamed(nibName == nil ? "\(self)": nibName! as String, owner: self, options: nil)
        nibs?.forEach({ (nib) in
            if (nib as! AnyClass) === (className as! AnyClass){
                contentView = nib as? UIView
            }
        })
        return contentView as? LTListBaseViewClass
    }
    func getBackView(superView: UIView,className: AnyClass) -> UIView? {
        var backView: UIView? = nil
        superview?.subviews.forEach({ (subView) in
            if subView === className {
                backView = subView
            }
        })
        return backView
    }
}
class LTListBaseCellClass : UITableViewCell,LTListBaseCellProtocol{
    
    func fillDataWithModel(data: LTListRowProtocol?) {
        
    }
}
