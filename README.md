# SLListSwiftComponent
## 介绍
> OC版本的链接[点击这里查看][1]

## tableView、collectionView的封装(单一原则、依赖倒置原则):
> 把一些重复viewmodel层组装业务放在组件中处理,有特殊需求的可以修改(可继承处理自己的其他业务);
> 在平时开发中组件可以有效的规范开发人员的代码结构，这样统一的结构可以增强代码阅读;
> model层、view层、组件内部的处理逻辑有效的分散到自己的莫板块中处理，满足设计模式单一原则、依赖倒置原则; 

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
[1]: https://github.com/lishuailibertine/SLListComponent
