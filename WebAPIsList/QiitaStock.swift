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
    var links: [Link]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        //演算子<-でJSONとメンバ変数の紐付けを設定する。
        title     <- map["title"]
        sendDate  <- map["send_date"]
        beginDate <- map["begin_date"]
        endDate   <- map["end_date"]
        links     <- map["links"]
    }
}

struct Link: Mappable {
    var rank: Int?
    var title: String?
    var stock: Int?
    var author: String?
    var url: String?
    var isNew: Bool?
    var icon: String?
    
    init?(map: Map){
    
    }
    
    mutating func mapping(map: Map) {
        rank   <- map["rank"]
        title  <- map["title"]
        stock  <- map["stock"]
        author <- map["author"]
        url    <- map["url"]
        isNew  <- map["is_new"]
        icon   <- map["icon"]
    }
}

