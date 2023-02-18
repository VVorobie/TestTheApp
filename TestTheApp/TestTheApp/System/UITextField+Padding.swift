//
//  UITextField+Padding.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit

/// #Текст с отступами
final class PaddingTextField: UITextField {
    /// Отступы по дефолту
    private var topInset: CGFloat = 0
    private var bottomInset: CGFloat = 0
    private var leftInset: CGFloat = 20
    private var rightInset: CGFloat = 20

    /// Дополнительный инициализатор для определения отступов
    convenience init(topInset: CGFloat,
                     bottomInset: CGFloat,
                     leftInset: CGFloat,
                     rightInset: CGFloat) {
        self.init()
        self.topInset = topInset
        self.bottomInset = bottomInset
        self.leftInset = leftInset
        self.rightInset = rightInset
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: CGRect(x: leftInset, y: topInset, width: bounds.width - leftInset - rightInset, height: bounds.height - topInset - bottomInset))
    }


    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

//    override var bounds: CGRect {
//        didSet {
//            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
//        }
//    }
}
