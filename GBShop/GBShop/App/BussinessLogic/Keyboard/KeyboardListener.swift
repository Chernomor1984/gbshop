//
//  KeyboardListener.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 03.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class KeyboardListener {
    private var scrollView: UIScrollView!
    private var overlappingView: UIView!
    private var keyboardWillChangeFrameObserver: NSObjectProtocol?
    
    // MARK: - Init
    
    private init() {}
    
    init(scrollView: UIScrollView, overlappingView: UIView) {
        self.scrollView = scrollView
        self.overlappingView = overlappingView
    }
    
    // MARK: - Public
    
    func registerForKeyboardWillChangeFrameNotification() {
        let keyboardWillChangeFrameClosure = { (notification: Notification) in
            guard let userInfo = notification.userInfo,
                let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
            }

            
            let convertedKeyboardFrame = self.scrollView.convert(keyboardFrame, from: nil)
            let intersectionFrame = convertedKeyboardFrame.intersection(self.scrollView.frame)
            let keyboardOffset = (convertedKeyboardFrame.intersects(self.overlappingView.frame)) ? intersectionFrame.size.height : 0
            let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardOffset, right: 0)
            self.scrollView.contentInset = insets
            self.scrollView.scrollIndicatorInsets = insets
            self.scrollView.scrollRectToVisible(self.overlappingView.frame, animated: true)
        }
        
        keyboardWillChangeFrameObserver = NotificationCenter.default.addObserver(forName: .UIKeyboardWillChangeFrame,
                                                                                 object: nil,
                                                                                 queue: .main,
                                                                                 using: keyboardWillChangeFrameClosure)
    }
}
