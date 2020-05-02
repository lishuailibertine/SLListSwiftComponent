# SLListSwiftComponent

## 使用示例
```Swift
self.tableView.estimatedRowHeight = 0.1
let sectionModel: LTListBaseSectionClass =  LTListBaseSectionClass()
let row: SLTestModel = SLTestModel()
//配置业务层的数据源
row.content = "1111111111111111111"
//配置cell的重用标识
row.cellReusable = "SLTestTableViewCell"
//配置cell高度的自适应
row.rowHeight = NSNumber.init(value: Float(UITableViewAutomaticDimension))
//配置cell的点击事件
row.didSelectRowAtIndexPath = {(tableView: UITableView, indexPath: NSIndexPath,rowData: LTListRowProtocol?)->Void in
    //handle event

}
let row1: SLTestModel = SLTestModel()
row1.content = "qdqdsdwdwdwdewdewdewdewdewdedewdwedewdewdewdewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdwe"
row1.cellReusable = "SLTestViewTableViewCell"
row1.rowHeight = NSNumber.init(value: Float(UITableViewAutomaticDimension))

//添加row
sectionModel.rowArray.add(row)
sectionModel.rowArray.add(row1)
//更新表
self.listAssemble.updateListWithModels(dataArray: [sectionModel])
```
