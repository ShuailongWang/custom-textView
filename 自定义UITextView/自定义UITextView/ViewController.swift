//
//  ViewController.swift
//  自定义UITextView
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //创建textView
    private lazy var textView: WSLTextView = {
        let text = WSLTextView()
        
        //设置
        text.placeHolder = "我是占位文字~"
        text.font = UIFont.systemFontOfSize(16)
        
        //垂直方向开启拖动
        text.alwaysBounceVertical = true
        
        //  扩展 不想要纠错工具条的显示
        text.autocorrectionType = .No
        
        //设置代理
        text.delegate = self
        
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        
        //添加控件
        view.addSubview(textView)
        
        textView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 150)
        
    }

}

extension ViewController: UITextViewDelegate {
    //拖动的时候,键盘消失
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        //键盘消失
        self.view.endEditing(true)
    }
}
