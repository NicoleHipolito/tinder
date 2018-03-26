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
//        let rotation = sender.
        if sender.state == .began{
            print("started panning")
            cardInitialCenter = profilePic.center
            
        }
        else if sender.state == .changed{
            let radians = atan2(profilePic.transform.b, profilePic.transform.a)
            let degrees = Double(radians * 180) / Double.pi
            if translation.x > 50{
                print("right panning")
                profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x-50) * Double.pi / 180))
                profilePic.transform = profilePic.transform.rotated(by: CGFloat(Double(translation.x-50) * Double.pi / 180))
//                profilePic.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                if(degrees >= 45){
//                    profilePic.
                    profilePic.center = CGPoint(x: cardInitialCenter.x + 40000, y: cardInitialCenter.y)
                }

            }
            else{
                print("left panning")
//                profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x-50) * Double.pi / 180))
//                profilePic.transform = profilePic.transform.rotated(by: CGFloat(Double(translation.x-50) * Double.pi / 180))
//                profilePic.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            }
            
            
//            profilePic.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
            
        }
        else if sender.state == .ended{
            print("ended panning")
            let radians = atan2(profilePic.transform.b, profilePic.transform.a)
            let degrees = Double(radians * 180) / Double.pi
            if(degrees < 45 && degrees > -45){
                profilePic.transform = CGAffineTransform.identity
            }
            print(degrees)
            
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
