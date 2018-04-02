//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Nicole Hipolito on 4/1/18.
//  Copyright © 2018 Nicole Hipolito. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var doneImage: UIImageView!
    var value: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePic.image = value.image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(done(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        doneImage.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func done(_ sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "doneSegue", sender: nil)
    }
}
