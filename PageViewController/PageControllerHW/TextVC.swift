//
//  TextVC.swift
//  PageViewController
//
//  Created by Myo Thandar soe on 12/01/2023.
//

import UIKit

class TextVC: UIViewController {
    
    var myText: String
    
    var bgColor: UIColor
    
    var chImage = UIImage()
    
    
    private let myTextView: UITextView = {
       let textView = UITextView()
        textView.font = .systemFont(ofSize: 24)
        textView.textColor = .black
        textView.backgroundColor = .clear
        return textView
    }()
    
    let bgView = UIView()
    
    let myImageView = UIImageView()
    
    init(with text: String, bgColor: UIColor, chImage: UIImage) {
        self.myText = text
        self.bgColor = bgColor
        self.chImage = chImage
        self.myTextView.text = self.myText
        self.bgView.backgroundColor = self.bgColor
        self.myImageView.image = self.chImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(bgView)
        view.addSubview(myTextView)
        view.addSubview(myImageView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextView.frame = CGRect(x: 20, y: 50, width: view.frame.size.width-40, height: view.frame.size.height)
        bgView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        myImageView.frame = CGRect(x: 20, y: 100, width: view.frame.size.width, height: view.frame.size.height)

    }
    
    

}
