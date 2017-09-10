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
import ObjectMapper

class QiitaStocksViewController: UITableViewController {
    
    private var qiitaStocks: [QiitaStock] = []
    private var selectedStock: QiitaStock = QiitaStock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQiitaStocksFromWebAPI()
        
        //テーブルを下に引っ張るとデータを更新する。
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "loading")
        self.refreshControl?.addTarget(self, action: #selector(fetchQiitaStocksFromWebAPI), for: UIControlEvents.valueChanged)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaStock", for: indexPath)
        
        let qiitaStock = qiitaStocks[indexPath.row]
        cell.textLabel?.text = qiitaStock.title
        cell.detailTextLabel?.text = qiitaStock.sendDate
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TableViewのハイライトを解除する。これをしないとAppleの審査時にRejectされる。
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        self.selectedStock = self.qiitaStocks[indexPath.row]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.qiitaStocks.count
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQiitaLinksViewController" {
            let qiitaLinksViewController = segue.destination as! QiitaLinksViewController
            qiitaLinksViewController.qiitaStock = selectedStock
        }
    }
    
    func fetchQiitaStocksFromWebAPI (){
        //週刊QiitaのWebAPIにアクセス
        let url = "http://qiita-stock.info/api.json";
        Alamofire.request(url).responseJSON { response in
            //FIXME: エラー処理
             guard let json = response.result.value else {
                return
            }
            //JSONをオブジェクトにマッピング
            guard let qiitaStocks = Mapper<QiitaStock>().mapArray(JSONObject: json) else{
                return
            }
            self.qiitaStocks = qiitaStocks
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
}
