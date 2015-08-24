//
//  NextInterfaceController.swift
//  WatchStockDemo
//
//  Created by 沈家瑜 on 15/8/24.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import WatchKit
import Foundation
import SwiftyJSON

class NextInterfaceController: WKInterfaceController {
    
    let data = DataManger.data

    @IBOutlet weak var imageShenZhen: WKInterfaceImage!
    @IBOutlet weak var labelUpScale: WKInterfaceLabel!
    @IBOutlet weak var labelName: WKInterfaceLabel!
    @IBOutlet weak var labelPrice: WKInterfaceLabel!
    @IBOutlet weak var labelUpPrice: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        imageShenZhen.setImageNamed("shenzhen")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if let json = self.data.shenZhenJSON {
            self.labelName.setText(json["name"].string)
            if let price = json["curdot"].double, upPrice = json["curprice"].double, upScale = json["rate"].double {
                if upPrice > 0 {
                    self.labelUpScale.setTextColor(UIColor.redColor())
                    self.labelUpPrice.setTextColor(UIColor.redColor())
                } else if upPrice == 0 {
                    self.labelUpScale.setTextColor(UIColor.lightGrayColor())
                    self.labelUpPrice.setTextColor(UIColor.lightGrayColor())
                } else {
                    self.labelUpScale.setTextColor(UIColor.greenColor())
                    self.labelUpPrice.setTextColor(UIColor.greenColor())
                }
                self.labelPrice.setText("\(price)")
                self.labelUpPrice.setText("\(upPrice)")
                self.labelUpScale.setText("\(upScale)%")
            }
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
