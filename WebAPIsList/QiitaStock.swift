//
//  QiitaStock.swift
//  WebAPIsList
//
//  Created by Kota_Nakatsubo on 2017/09/02.
//  Copyright © 2017年 Kota_Nakatsubo. All rights reserved.
//

import Foundation

class QiitaStock {
    let title: String
    let sendDate: String
    let beginDate: String
    let endDate: String
    
    init(title: String, sendDate: String, beginDate: String, endDate: String){
        self.title = title
        self.sendDate = sendDate
        self.beginDate = beginDate
        self.endDate = endDate
    }
}
