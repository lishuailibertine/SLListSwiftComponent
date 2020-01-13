//
//  SLTestTableViewCell.swift
//  SLListSwiftComponent_Example
//
//  Created by li shuai on 2020/1/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import SLListSwiftComponent

class SLTestTableViewCell: LTListBaseCellClass {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func fillDataWithModel(data: LTListRowProtocol?) {
        let testModel: SLTestModel = data as! SLTestModel
        self.contentLabel.text = testModel.content as String?
    }
}
class SLTestViewTableViewCell: LTListBaseCellClass {
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textView.textContainer.lineFragmentPadding = 0
        self.textView.textContainerInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
    override func fillDataWithModel(data: LTListRowProtocol?) {
        let testModel: SLTestModel = data as! SLTestModel
        self.textView.text = testModel.content as String?
    }
}
