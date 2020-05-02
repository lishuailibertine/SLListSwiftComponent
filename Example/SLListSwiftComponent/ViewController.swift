//
//  ViewController.swift
//  SLListSwiftComponent
//
//  Created by lishuailibertine on 01/09/2020.
//  Copyright (c) 2020 lishuailibertine. All rights reserved.
//

import UIKit
import SLListSwiftComponent

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var listAssemble: LTListAssemble = {()->LTListAssemble in
        return (LTListAssemble.createListAssemble(tableView: self.tableView))!
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

