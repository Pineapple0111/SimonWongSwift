//
//  BaseViewController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewProtocol, DZNEmptyDataSetProtocol {
    
    lazy var navigationBarHeight = (navigationController?.navigationBar.height ?? 0) + UIStatusBarHeight
    
    deinit {
        print("current function: \(self), \(#function)")
        StatusBarActivityIndicator.hide()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightView
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        indicator.startAnimating()
    }
    
}
