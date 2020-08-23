//
//  CATextLayer+Adapter.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/2/21.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

import UIKit

extension CATextLayer {
    
    static func useAdapter() {
        DispatchQueue.once(token: "CATextLayer+Adapter") {
            if
                let originalMethod = class_getInstanceMethod(Self.self, #selector(setter: Self.fontSize)),
                let exchangingMethod = class_getInstanceMethod(Self.self, #selector(Self.adapterSetFontSize(_:)))
            {
                method_exchangeImplementations(originalMethod, exchangingMethod)
            }
        }
    }
    
    @objc private func adapterSetFontSize(_ fontSize: CGFloat) {
        var fontSize = fontSize
        if UIDevice.iPhoneSeries.screenWidth375 && UIDevice.iPhoneSeries.iPhoneX_or_higher {
            fontSize += FontSizeDecrement.decrement_1
        } else if UIDevice.iPhoneSeries.seriesOfiPhone8 {
            fontSize += FontSizeDecrement.decrement_2
        } else if UIDevice.iPhoneSeries.iPhoneSE_or_lower {
            fontSize += FontSizeDecrement.decrement_3
        }
        adapterSetFontSize(fontSize)
    }
    
}