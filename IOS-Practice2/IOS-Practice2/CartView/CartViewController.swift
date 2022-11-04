//
//  CartViewController.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/01.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    var list = [
        [ "title" : "유년기오구의 쪼꼬만 일상",
          "time": "2022.11.03 . 22:34" ],
        [ "title" : "콩글리시 이즈 꿀잼2",
          "time": "2022.11.03 . 22:35"],
        [ "title" : "진짜 찐?",
          "time": "2022.11.03 . 22:36"],
        [ "title" : "바다 갈매기 매봉이는 여유로워",
          "time": "2022.11.03 . 22:37" ],
        [ "title" : "공하 3 (공주하이)",
          "time": "2022.11.03 . 22:38"]
        ]
//    var dataArray: Array<String> = ["유년기오구의 쪼꼬만 일상","콩글리시 이즈 꿀잼2","진짜 찐?"]. 이건어떨떄 쓰는거냐;
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        self.navigationItem.title = "History"
        let button = UIBarButtonItem(title: String("clear"),style: .plain, target: self, action: #selector(clearButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = button
        
    }
    
    @objc
    func clearButtonAction(_ sender: Any) {
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
                    cartTableView.reloadData()
    
                } else if editingStyle == .insert {
    
                }
}
//익스텐션 func 순서가 바뀌면안댐 ?

    }
