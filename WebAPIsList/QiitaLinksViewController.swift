//
//  QiitaLinksViewController.swift
//  WebAPIsList
//
//  Created by Kota_Nakatsubo on 2017/09/06.
//  Copyright © 2017年 Kota_Nakatsubo. All rights reserved.
//

import Foundation
import UIKit

class QiitaLinksViewController : UITableViewController {
    
    private var qiitaStock:QiitaStock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaLink", for: indexPath)
        cell.textLabel?.text = qiitaStock?.links?[indexPath.row].title
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let links = qiitaStock?.links else {
            return 0
        }
        return links.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
