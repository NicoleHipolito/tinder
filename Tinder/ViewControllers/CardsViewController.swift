//
//  CardsViewController.swift
//  Tinder
//
//  Created by Nicole Hipolito on 3/25/18.
//  Copyright © 2018 Nicole Hipolito. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didMovePic(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began{
            print("started panning")
            cardInitialCenter = profilePic.center
            
        }
        else if sender.state == .changed{
            if translation.x > 50{
                print("right panning")
                profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(1 * Double.pi / 180))
                profilePic.transform = profilePic.transform.rotated(by: CGFloat(1 * Double.pi / 180))

            }
            else{
                print("left panning")
                profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(-1 * Double.pi / 180))
                profilePic.transform = profilePic.transform.rotated(by: CGFloat(-1 * Double.pi / 180))
            }
//            profilePic.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
            
        }
        else if sender.state == .ended{
            print("ended panning")
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
