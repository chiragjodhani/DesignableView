//
//  BounceButton.swift
//  DesignableView
//
//  Created by Eryus Developer on 31/07/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import UIKit

class BounceButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = .identity
        }, completion: nil)
        super.touchesBegan(touches, with: event)
    }
}
