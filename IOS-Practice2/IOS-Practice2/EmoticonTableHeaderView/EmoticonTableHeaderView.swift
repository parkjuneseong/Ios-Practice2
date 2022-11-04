//
//  EmoticonTableHeaderView.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/01.
//
    import UIKit

    class EmotionTableViewHeaderView: UIView {
        @IBOutlet weak var label: UILabel!
        
        private var nibName: String {
            "\(EmotionTableViewHeaderView.self)"
        }
        private var containerView = UIView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            loadNib()
        }
        
        required init?  (coder: NSCoder) {
            super.init(coder: coder)
            loadNib()
        }
        
        private func loadNib() {
            guard let loadedNib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else {
                return
            }
            containerView = loadedNib.first as? UIView ?? UIView()
            containerView.frame = bounds
            containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(containerView)
            customViewDidLoad()
        }
        
        private func customViewDidLoad() {
            label.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        }
    }

