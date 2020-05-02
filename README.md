# SLListSwiftComponent

## 使用示例
```Swift
self.tableView.estimatedRowHeight = 0.1
let sectionModel: LTListBaseSectionClass =  LTListBaseSectionClass()
let row: SLTestModel = SLTestModel()
row.content = "1111111111111111111"
row.cellReusable = "SLTestTableViewCell"
row.rowHeight = NSNumber.init(value: Float(UITableViewAutomaticDimension))
row.didSelectRowAtIndexPath = {(tableView: UITableView, indexPath: NSIndexPath,rowData: LTListRowProtocol?)->Void in


}
let row1: SLTestModel = SLTestModel()
row1.content = "qdqdsdwdwdwdewdewdewdewdewdedewdwedewdewdewdewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdweewdwedewdewdewdewdwdwdwdewdwdwdwe"
row1.cellReusable = "SLTestViewTableViewCell"
row1.rowHeight = NSNumber.init(value: Float(UITableViewAutomaticDimension))

sectionModel.rowArray.add(row)
sectionModel.rowArray.add(row1)
self.listAssemble.updateListWithModels(dataArray: [sectionModel])
```
