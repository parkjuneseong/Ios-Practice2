//
//  MainViewController.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/01.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let list = [
        [ "title" : "유년기오구의 쪼꼬만 일상", "author" : "문랩", "image" : "image01.png" ],
        [ "title" : "콩글리시 이즈 꿀잼2", "author" : "노페이퍼", "image" : "image02.png" ],
        [ "title" : "진짜 찐?", "author" : "mohe", "image" : "image03.png" ],
        [ "title" : "바다 갈매기 매봉이는 여유로워", "author" : "이우산", "image" : "image04.png" ],
        [ "title" : "공하 3 (공주하이)", "author" : "봉이봉봉봉", "image" : "image05.png" ],
        [ "title" : "무새무새의 몸짓들", "author" : "SO", "image" : "image06.png" ],
        [ "title" : "열심히 산다 빠릿빠릿 곰", "author" : "HIPUP PLANET", "image" : "image07.png" ],
        [ "title" : "반전! 주접콘", "author" : "잼잼", "image" : "image08.png" ],
        [ "title" : "3단티콘", "author" : "나그", "image" : "image09.png" ],
        [ "title" : "넌 나의 비타민~", "author" : "무릎이 임선경", "image" : "image10.png" ],
        [ "title" : "하찮은 외계인 밍찡", "author" : "라밍", "image" : "image11.png" ],
        [ "title" : "안녕! 아기 보노보노", "author" : "보노보노", "image" : "image12.png" ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.navigationItem.title = "이모티콘"
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"),style: .plain, target: self, action: #selector(cartButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = button
        let backbutton = UIBarButtonItem(title: "뒤로가기", style: .plain,target: nil,action: nil)
        backbutton.title = "back"
        self.navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        //        let button1 = UIBarButtonItem(image: UIImage(systemName: "click"),style: .plain, target: self, action: #selector(clickButtonAction(_:)))
        //        self.navigationItem.leftBarButtonItem = button
        //네비게이션 바는 코드로만 해야하는건가 ? 네비바에 버튼은 셀렉터가 꼭있어야하나?버튼은 그냥만들수 있지만 액션을 취하기 위해 가져오는개 셀렉터인가
    }
    @objc
    func cartButtonAction(_ sender: Any) {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc
    func purchaseButtonActoin(_ sender: UIButton){
        let buttonPosition : CGPoint = sender.convert(.zero,to:self.tableView)
        let indexPath: IndexPath = self.tableView.indexPathForRow(at: buttonPosition) ?? IndexPath()
        
        // 현재 시간 가져오기
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dataStirng = formatter.string(from: Date())
        //  배열에 넣을 dictionary생성
        let dic : [String : String] = ["title":list[indexPath.row]["title"] ?? "" , "time" : dataStirng]
        //UserDefaults에서 배열 가져와서 배열에 추가
        var userDefaultsArray = UserDefaults.standard.array(forKey: "myCart") as? [[String : String]] ?? []
        userDefaultsArray.append(dic)
        //추가된 배열을 UserDefaults 에 다시 저장
        UserDefaults.standard.set(userDefaultsArray, forKey: "myCart")
        print("구매완료")
    }
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        cell?.bind(title: list[indexPath.row]["title"] ?? "" , author: list[indexPath.row]["author"] ?? "" , image: UIImage(named: list[indexPath.row]["image"] ?? "" ) ?? UIImage())
        cell?.selectionStyle = .none
        cell?.purchaseButton.addTarget(self, action: #selector(purchaseButtonActoin(_:)), for: .touchUpInside)
        
        return cell ?? TableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = EmotionTableViewHeaderView()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}
