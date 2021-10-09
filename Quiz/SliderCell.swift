//
//  SliderCell.swift
//  Quiz
//
//  Created by Saki Igeta on 2021/10/10.
//  Copyright © 2021 LifeisTech. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var image: UIImage! {
        didSet {
          imgView.image = image
        }
    }
    
}
