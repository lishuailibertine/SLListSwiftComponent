//
//  LTCollectionDataModel.swift
//  FBSnapshotTestCase
//
//  Created by li shuai on 2020/1/22.
//

import Foundation
import UIKit

open class LTCollectionRowModel: NSObject {
    
    /// 配置cell重用的标示
    open var configCellReusable: ((_ collectionView: UICollectionView,_ indexPath: NSIndexPath)-> NSString?)?
    
    /// 配置cell的大小
    open var configCellSize: ((_ collectionView: UICollectionView, _ collectionViewLayout: UICollectionViewLayout,_ indexPath: NSIndexPath)->CGSize)?
    
    /// 配置每一行的数据源
    open var rowData: AnyObject?
    
    /// 根据数据源填充cell数据*
    open var configCellData: ((_ cell: UICollectionViewCell,_ rowData: AnyObject?, _ indexPath: NSIndexPath)->Void)?
    
    /// 点击选中某一个cell
    open var didSelectItemAtIndexPath: ((_ collectionView: UICollectionView,_ rowData: AnyObject?,_ indexPath: NSIndexPath)->Void)?
}

open class LTCollectionSectionModel: NSObject {
    
    open var configSectionReusable: ((_ collectionView: UICollectionView,_ indexPath: NSIndexPath,_ kind: NSString)->NSString?)?
    open var configSectionSize: ((_ section: NSInteger)->CGSize)?
    open var configFooterSize: ((_ section: NSInteger)->CGSize)?
    open var sectionData: AnyObject?
    open var footerData: AnyObject?
    open var configSectionData: ((_ indexPath: NSIndexPath,_ view: UICollectionReusableView,_ sectionData: AnyObject?)->Void)?
    open var configFooterData: ((_ indexPath: NSIndexPath,_ view: UICollectionReusableView,_ footerData: AnyObject?)->Void)?
    open var configSectionMinimumLineSpacing: ((_ collectionView: UICollectionView,_ section: NSInteger)->CGFloat)?
    open var configSectionMinimumInteritemSpacing: ((_ collectionView: UICollectionView,_ section: NSInteger)->CGFloat)?
    open var configSectionEdgeInsets: ((_ collectionView: UICollectionView, _ section: NSInteger)->UIEdgeInsets)?
    open var rowDataArray: [LTCollectionRowModel]? = NSMutableArray() as? [LTCollectionRowModel]
    
}

open  class LTCollectionDataModel: NSObject {
    open var dataArray: [LTCollectionSectionModel]? = NSMutableArray() as? [LTCollectionSectionModel]
    open var scrollOffset: ((_ point: CGPoint)->Void)?
    open func requestCollectionDataSource(){
        
    }
    
}
