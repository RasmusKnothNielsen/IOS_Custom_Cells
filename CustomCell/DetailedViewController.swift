//
//  DetailedViewController.swift
//  CustomCell
//
//  Created by Rasmus Knoth Nielsen on 24/05/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var text = ""
    var image = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
        imageView.image = UIImage(named: image)

    }

}
