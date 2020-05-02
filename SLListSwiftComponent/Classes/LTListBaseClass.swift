//
//  LTListBaseClass.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

open class LTListBaseRowClass : NSObject,LTListRowProtocol {
    open var cellReusable: NSString?
    open var rowHeight: NSNumber?
    open var didSelectRowAtIndexPath: ((UITableView, NSIndexPath, LTListRowProtocol?) -> Void)?
}
open class LTListBaseSectionClass : NSObject,LTListSectionProtocol {
    open var sectionHeaderView: UIView?
    
    open var sectionFooterView: UIView?
    
    open var viewHeaderClass: NSString?
    
    open var nibHeaderName: NSString?
    
    open var viewFooterClass: NSString?
    
    open var nibFooterName: NSString?
    
    open var sectionHeaderHeight: NSNumber?
    
    open var sectionFooterHeight: NSNumber?
    
    open var rowArray: NSMutableArray = NSMutableArray()
    
    
}
open class LTTableRowModel : NSObject,LTTableRowModelProtocol{
    
    open var configCellReusable: ((UITableView, NSIndexPath) -> NSString)?
    
    open var configCellData: ((UITableView, LTListBaseCellProtocol, LTListRowProtocol?) -> Void)?
    
    open var didSelectRowAtIndexPath: ((UITableView, NSIndexPath, LTListRowProtocol?) -> Void)?
    
    open var configRowHeight: ((UITableView, NSIndexPath) -> CGFloat)?
    
    open var rowData: LTListRowProtocol?

}
open class LTTableSectionModel : NSObject,LTTableSectionModeProtocol{
    open var configHeaderHeight: ((UITableView, NSInteger) -> CGFloat)?
    
    open var configFooterHeight: ((UITableView, NSInteger) -> CGFloat)?
    
    open var configHeaderView: ((UITableView, NSInteger) -> LTListBaseViewProtocol?)?
    
    open var configFooterView: ((UITableView, NSInteger) -> LTListBaseViewProtocol?)?
    
    open var configHeaderData: ((UITableView, NSInteger, LTListBaseViewProtocol?, LTListSectionProtocol?) -> Void)?
    
    open var configFooterData: ((UITableView, NSInteger, LTListBaseViewProtocol?, LTListSectionProtocol?) -> Void)?
    
    open var headerData: LTListSectionProtocol?
    
    open var footerData: LTListSectionProtocol?
    
    open var rowDataArray: NSMutableArray = NSMutableArray()
    
    
}
open class LTListViewModel : NSObject,LTListViewModelProtocol{
    open var dataArray: NSMutableArray = NSMutableArray()
    
    open var scrollViewWillBeginDragging: ((UIScrollView) -> Void)?
    
    open var scrollViewDidEndDragging: ((UIScrollView, Bool) -> Void)?
}

open class LTListBaseViewClass : UIView,LTListBaseViewProtocol{
    open func fillData(data: Any?) {
        
    }
    static func createViewWithClass(className: Any,nibName: NSString? ) -> LTListBaseViewClass? {
        return getNibViewWithClass(className: className, nibName: nibName) as? LTListBaseViewClass
    }
    static func getNibViewWithClass(className: Any,nibName: NSString?) -> UIView? {
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
   open  func getBackView(superView: UIView,className: AnyClass) -> UIView? {
        var backView: UIView? = nil
        superview?.subviews.forEach({ (subView) in
            if subView === className {
                backView = subView
            }
        })
        return backView
    }
}
open class LTListBaseCellClass : UITableViewCell,LTListBaseCellProtocol{
    
    open func fillDataWithModel(data: LTListRowProtocol?) {
        
    }
}
