//
//  TableViewCell.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/01.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var emoticonName: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var purchaseButton: UIButton!
    
    
    func bind(title : String , author : String , image : UIImage){
        emoticonName.text = title
        authorName.text = author
        thumbnailImageView.image = image
        
    }
}
