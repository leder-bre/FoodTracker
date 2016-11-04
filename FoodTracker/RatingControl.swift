//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Brendan Leder on 2016-11-02.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
        addSubview(button)
    }
    override public var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 240, height: 44)
        }
    }
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button Pressed")
    }
}
