//
//  DataManger.swift
//  WatchStockDemo
//
//  Created by 沈家瑜 on 15/8/24.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import UIKit
import SwiftyJSON

class DataManger: NSObject {
    static let data = DataManger()
    
    private override init() {}
    
    var shangHaiJSON:JSON?
    
    var shenZhenJSON:JSON?
}
