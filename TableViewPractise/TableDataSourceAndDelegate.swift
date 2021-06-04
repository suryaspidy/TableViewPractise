//
//  TableDataSource.swift
//  TableViewPractise
//
//  Created by surya-zstk231 on 04/06/21.
//

import Foundation
import UIKit

class TableDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    

    var elements: [Objects]
    var cellID: String
    
    init(items: [Objects]!, cellIdentifier: String!) {
        self.elements = items
        self.cellID = cellIdentifier
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements[section].elements.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CloneTableViewCell
        cell.labelArea.text = elements[indexPath.section].elements[indexPath.row]
        cell.imageArea.image = UIImage(named: elements[indexPath.section].elements[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return elements.count
    }
    
    
    //MARK:- Header allignments
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return elements[section].type
    }
    
    //MARK:- Footer allignments
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(elements[indexPath.section].elements[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
