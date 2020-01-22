//
//  LTCollectionDataSource.swift
//  FBSnapshotTestCase
//
//  Created by li shuai on 2020/1/22.
//

import Foundation
import UIKit

open class LTCollectionDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
    open var collectionDataModel: LTCollectionDataModel? = LTCollectionDataModel()
    //分区的总数量
    open func numberOfSectionsInCollectionView()-> NSInteger{
        return self.collectionDataModel?.dataArray?.count ?? 0;
    }
    //分区的头尾试图
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[indexPath.section]) as LTCollectionSectionModel?
        var reusableView: UICollectionReusableView?
        if sectionModel?.configSectionReusable != nil{
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionModel?.configSectionReusable!(collectionView,indexPath as NSIndexPath ,kind as NSString) as String? ?? "", for: indexPath)
        }else{
            reusableView = UICollectionReusableView()
        }
        if kind == UICollectionElementKindSectionHeader {
            if sectionModel?.configSectionData != nil {
                sectionModel?.configSectionData!(indexPath as NSIndexPath, reusableView!, sectionModel?.sectionData)
            }
        }else{
            if sectionModel?.configFooterData != nil {
                sectionModel?.configFooterData!(indexPath as NSIndexPath, reusableView!, sectionModel?.footerData)
            }
        }
        return reusableView!
    }
    //配置每个分区中区头的大小
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[section])
        if ((sectionModel?.configSectionSize) != nil) {
            return (sectionModel?.configSectionSize!(section as NSInteger)) ?? CGSize.zero
        }
        return CGSize.zero
    }
    // 设置section尾视图的参考大小，与tablefooterview类似
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[section])
        if ((sectionModel?.configFooterSize) != nil) {
            return (sectionModel?.configFooterSize!(section as NSInteger)) ?? CGSize.zero
        }
        return CGSize.zero
    }
    //每个区中元素的数量
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[section])
        return sectionModel?.rowDataArray?.count ?? 0
    }
    //配置每个分区每个元素
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[indexPath.section])
        let rowModel: LTCollectionRowModel? = sectionModel?.rowDataArray?[indexPath.row]
        var cell: UICollectionViewCell?
        if rowModel?.configCellReusable != nil {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ((rowModel?.configCellReusable!(collectionView,indexPath as NSIndexPath) as String?) ?? ""), for: indexPath)
        }else{
            cell = UICollectionViewCell()
        }
        if rowModel?.configCellData != nil {
            rowModel?.configCellData!(cell!,rowModel?.rowData,indexPath as NSIndexPath)
        }
        return cell!
    }
    //动态设置每个分区的EdgeInsets
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[section])
        if ((sectionModel?.configSectionEdgeInsets) != nil) {
            return sectionModel?.configSectionEdgeInsets!(collectionView, section) ?? UIEdgeInsets.zero
        }
        return UIEdgeInsets.zero
    }
    //动态设置每行的间距大小
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[section])
        if ((sectionModel?.configSectionMinimumLineSpacing) != nil) {
            return sectionModel?.configSectionMinimumLineSpacing!(collectionView, section) ?? 0.1
        }
        return 0.1
    }
    //动态设置每列的间距大小
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[section])
        if ((sectionModel?.configSectionMinimumInteritemSpacing) != nil) {
            return sectionModel?.configSectionMinimumInteritemSpacing!(collectionView, section) ?? 0.1
        }
        return 0.1
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[indexPath.section])
        let rowModel: LTCollectionRowModel? = sectionModel?.rowDataArray?[indexPath.row]
        if ((rowModel?.configCellSize) != nil) {
            return rowModel?.configCellSize!(collectionView,collectionViewLayout, indexPath as NSIndexPath) ?? CGSize.zero
        }
        return CGSize.zero
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionModel: LTCollectionSectionModel? = (self.collectionDataModel?.dataArray?[indexPath.section])
        let rowModel: LTCollectionRowModel? = sectionModel?.rowDataArray?[indexPath.row]
        if ((rowModel?.didSelectItemAtIndexPath) != nil) {
            rowModel?.didSelectItemAtIndexPath!(collectionView,rowModel?.rowData,indexPath as NSIndexPath)
        }
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.collectionDataModel?.scrollOffset != nil {
            self.collectionDataModel?.scrollOffset!(scrollView.contentOffset);
        }
    }
}
