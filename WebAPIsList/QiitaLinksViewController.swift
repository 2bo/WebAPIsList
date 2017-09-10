//
//  QiitaLinksViewController.swift
//  WebAPIsList
//
//  Created by Kota_Nakatsubo on 2017/09/06.
//  Copyright © 2017年 Kota_Nakatsubo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class QiitaLinksViewController : UITableViewController {
    
    var qiitaStock:QiitaStock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaLink", for: indexPath)
        guard let  qiitaLink = self.qiitaStock?.links?[indexPath.row] else{
            return cell
        }
        guard let title = qiitaLink.title,
            let rank = qiitaLink.rank,
            let author = qiitaLink.author,
            let url = qiitaLink.url else {
                return cell
        }
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = "\(rank) \(author) \(url)"
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let links = qiitaStock?.links else {
            return 0
        }
        return links.count
    }

}
