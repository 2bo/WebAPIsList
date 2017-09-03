//
//  QiitaStock.swift
//  WebAPIsList
//
//  Created by Kota_Nakatsubo on 2017/09/02.
//  Copyright © 2017年 Kota_Nakatsubo. All rights reserved.
//

import Foundation
import ObjectMapper

class QiitaStock: Mappable {
    var title: String?
    var sendDate: String?
    var beginDate: String?
    var endDate: String?
    
    required init?(map: Map) {
        
    }
    
    init(title: String, sendDate: String, beginDate: String, endDate: String){
        self.title = title
        self.sendDate = sendDate
        self.beginDate = beginDate
        self.endDate = endDate
    }
    
    func mapping(map: Map) {
        //演算子<-でJSONとメンバ変数の紐付けを設定する。
        title     <- map["title"]
        sendDate  <- map["send_date"]
        beginDate <- map["begin_date"]
        endDate   <- map["end_date"]
    }
}
