//
//  WSLTextView.swift
//  自定义UITextView
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit


@IBDesignable       // 实时看到修改后,属性的值
class WSLTextView: UITextView {
    //占位label
    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel()
        
        //设置label
        label.font = UIFont.systemFontOfSize(12)
        label.text = "请输入内容~"
        label.textColor = UIColor.lightGrayColor()
        label.numberOfLines = 0
        
        return label
    }()
   
    //提供外界设置占位文字的属性,拖控件哪里
    @IBInspectable var placeHolder: String? {
        didSet {
            //让在属性哪里输入的文字,赋值给我们占位label
            placeHolderLabel.text = placeHolder
        }
    }
    
    //重写font
    override var font: UIFont? {
        didSet {
            if font != nil {
                //让在属性哪里修改的字体,赋给给我们占位label
                placeHolderLabel.font = font
            }
        }
    }
    
    //重写text
    override var text: String? {
        didSet {
            //根据文本是否有内容而显示占位label
            placeHolderLabel.hidden = hasText()
        }
    }
    
    //frame
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        //
        setupUI()
    }
    //xib
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //
        setupUI()
    }
    
    //添加控件,设置约束
    private func setupUI(){
        //监听内容的通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "valueChange", name: UITextViewTextDidChangeNotification, object: nil)
        
        //添加控件
        addSubview(placeHolderLabel)
        
        //设置约束,使用系统的约束
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: placeHolderLabel, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: -10))
    }
    
    
    
    //内容改变的通知方法
    @objc private func valueChange() {
        //占位文字的显示与隐藏
        placeHolderLabel.hidden = hasText()
    }
    //移除通知
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //子控件布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //设置占位文字的坐标
        placeHolderLabel.frame.origin.x = 5
        placeHolderLabel.frame.origin.y = 7
    }
}















