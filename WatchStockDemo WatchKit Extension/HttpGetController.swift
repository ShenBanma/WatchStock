//
//  HttpGetController.swift
//  WatchStockDemo
//
//  Created by 沈家瑜 on 15/8/24.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import WatchKit
import Alamofire
import SwiftyJSON

class HttpGetController: NSObject {
    let data = DataManger.data
    func getHttpInformation(completion: () ->()) {
        Alamofire.request(.GET, "http://apis.baidu.com/apistore/stockservice/stock", parameters: ["stockid": "sz002230", "list": "1"], headers: ["apikey": "14f99e26b9bc57a36970ddd09e0b9264"]).responseJSON(options: NSJSONReadingOptions.MutableContainers) { (_, _, json, _) -> Void in
            if let json: AnyObject = json {
                let j = JSON(json)
                self.data.shangHaiJSON = j["retData"]["market"]["shanghai"]
                self.data.shenZhenJSON = j["retData"]["market"]["shenzhen"]
                completion()
            }
        }
    }
}
