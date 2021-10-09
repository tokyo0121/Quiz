//
//  TopViewController.swift
//  Quiz
//
//  Created by litech on 2019/06/04.
//  Copyright © 2019 LifeisTech. All rights reserved.
//

import UIKit


class TopViewController: UIViewController {
    
    @IBOutlet weak var soloButton: UIButton!
    @IBOutlet weak var teamButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soloImage = UIImage(named: "solo")
        soloButton.setBackgroundImage(soloImage, for: .normal)
        soloButton.imageView?.contentMode = .scaleAspectFit
        soloButton.contentHorizontalAlignment = .fill
        soloButton.contentVerticalAlignment = .fill

        // Do any additional setup after loading the view.
    }


}
