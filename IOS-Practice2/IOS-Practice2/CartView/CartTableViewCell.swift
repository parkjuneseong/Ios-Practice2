//
//  CartTableViewCell.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/03.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var buyNameLabel: UILabel!
    
    @IBOutlet weak var buyTimeLabel: UILabel!
//    var dataArray: Array<String> = ["유년기오구의 쪼꼬만 일상","콩글리시 이즈 꿀잼2","진짜 찐?"]
   
//   
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//            if editingStyle == .delete {
//
//                dataArray.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//
//            } else if editingStyle == .insert {
//
//            }
//        }
//    
    func bind(title : String , time : String){
        buyNameLabel.text = title
        buyTimeLabel.text = time
       
    }
}
