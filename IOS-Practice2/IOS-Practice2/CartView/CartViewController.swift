//
//  CartViewController.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/01.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    var list : [[String : String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        self.navigationItem.title = "History"
        let button = UIBarButtonItem(title: String("clear"),style: .plain, target: self, action: #selector(clearButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = button
        getUserDefaults()
        
    }
    
    @objc
    func clearButtonAction(_ sender: Any) {
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func getUserDefaults(){
        let  userDefaultsArray = UserDefaults.standard.array(forKey: "myCart") as? [[String : String]] ?? []
        list = userDefaultsArray
        print(list)
        cartTableView.reloadData()
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell
        cell?.bind(title: list[indexPath.row]["title"] ?? "" , time: list[indexPath.row]["time"] ?? "" )
//        cell?.selectionStyle = .none
    return cell ?? CartTableViewCell()

    }
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
                if editingStyle == .delete {
    
                    list.remove(at: indexPath.row)
                    UserDefaults.standard.set(list, forKey: "myCart")
                    cartTableView.reloadData()
    
                } else if editingStyle == .insert {
    
                }
}

    }
