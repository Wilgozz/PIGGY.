//
//  UIViewExtension.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 15/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func bordaRedonda(radius: CGFloat, cantos: CACornerMask){
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cantos
        self.clipsToBounds = true
    }
}
extension CACornerMask{
    static public let inferiorDireito: CACornerMask = .layerMaxXMaxYCorner
    static public let inferiorEsquerdo: CACornerMask = .layerMinXMaxYCorner
    static public let superiorDireito: CACornerMask = .layerMaxXMinYCorner
    static public let superiorEsquerdo: CACornerMask = .layerMinXMinYCorner
}
