//
//  QiitaStocksViewController.swift
//  WebAPIsList
//
//  Created by Kota_Nakatsubo on 2017/09/02.
//  Copyright © 2017年 Kota_Nakatsubo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class QiitaStocksViewController: UITableViewController {
    private var qiitaStocks: [QiitaStock]?
//        [ QiitaStock(title: "hoge", sendDate: "2017-08-30", beginDate: "2017-08-21", endDate: "2017-08-27"),
//            QiitaStock(title: "fuga", sendDate: "2017-08-30", beginDate: "2017-08-21", endDate: "2017-08-27"),
//            QiitaStock(title: "bar", sendDate: "2017-08-30", beginDate: "2017-08-21", endDate: "2017-08-27")]

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQiitaStocksFromWebAPI()
        //self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
//        fetchQiitaStocksFromWebAPI()
//        self.tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if let qiitaStock = qiitaStocks?[indexPath.row] {
            cell.textLabel?.text = qiitaStock.title
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = qiitaStocks?.count {
            return count
        } else {
            return 0
        }
    }
    
    func fetchQiitaStocksFromWebAPI (){
        //QiitaのWebAPIにアクセス
        let url = "http://qiita-stock.info/api.json";
        Alamofire.request(url).responseJSON { response in
            //FIXME: エラー処理
             guard let json = response.result.value else {
                return
            }
            //JSONをオブジェクトにマッピング
            self.qiitaStocks = Mapper<QiitaStock>().mapArray(JSONObject: json)
            self.tableView.reloadData()
        }
    }
}
