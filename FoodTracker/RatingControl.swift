//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Brendan Leder on 2016-11-02.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    // MARK: Initialization
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        for(index,button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (44 + spacing))
            button.frame = buttonFrame
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0...(starCount-1) {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
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
