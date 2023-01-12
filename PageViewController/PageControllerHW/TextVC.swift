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
    
    var myStoryText: String
    
    
    
    private let myTextView: UITextView = {
       let textView = UITextView()
        textView.font = .systemFont(ofSize: 24)
        textView.textColor = .black
        textView.backgroundColor = .clear
        return textView
    }()
    
    let bgView = UIView()
    
    let myImageView = UIImageView()
    
    private let storyTextView: UITextView = {
        let myStoryTextView = UITextView()
        myStoryTextView.font = .systemFont(ofSize: 20)
        myStoryTextView.textColor = .black
        myStoryTextView.backgroundColor = .clear
        return myStoryTextView
    }()
    
    init(with text: String, bgColor: UIColor, chImage: UIImage, myStoryText: String) {
        self.myText = text
        self.bgColor = bgColor
        self.chImage = chImage
        self.myStoryText = myStoryText
        self.myTextView.text = self.myText
        self.bgView.backgroundColor = self.bgColor
        self.myImageView.image = self.chImage
        self.storyTextView.text = self.myStoryText
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
        view.addSubview(storyTextView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextView.frame = CGRect(x: 20, y: 50, width: view.frame.size.width-40, height: view.frame.size.height)
        bgView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        myImageView.frame = CGRect(x: 50, y: 110, width: view.frame.size.width - 100, height: view.frame.size.height - 600)
        storyTextView.frame = CGRect(x: 20, y: 420, width: view.frame.size.width-40, height: view.frame.size.height)

    }
    
    

}
