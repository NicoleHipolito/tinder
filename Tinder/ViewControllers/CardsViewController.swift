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
            // Optionally initialize the property to a desired starting value
//            print(translation.x)
            print(translation.y)
            if translation.x > 0{
                print("right panning")
//                profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x-45) * Double.pi / 180))
//                profilePic.transform = profilePic.transform.rotated(by: CGFloat(Double(translation.x-45) * Double.pi / 180))
//                profilePic.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
//                if(degrees == 50){
//                    profilePic.
                if(translation.y > 0){
                    self.profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 180))
                }
                else{
                    self.profilePic.transform = CGAffineTransform(rotationAngle: -CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: -CGFloat(Double(translation.x) * Double.pi / 180))
                }
                
//                    UIView.animate(withDuration:0.8, delay: 0.0,
//                                   // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
////                        options: [.autoreverse,.repeat],
//                        animations: { () -> Void in
//                            self.profilePic.transform = CGAffineTransform(translationX: 50, y: 0.1)
//                            self.profilePic.transform = self.profilePic.transform.translatedBy(x: 50, y: 0.1)
//                    }, completion: nil)
            }
            else{
                print("left panning")
                if(translation.y > 0){
                    self.profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 180))
                }
                else{
                    self.profilePic.transform = CGAffineTransform(rotationAngle: -CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: -CGFloat(Double(translation.x) * Double.pi / 180))
                }
//                UIView.animate(withDuration:0.8, delay: 0.0,
//                               // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
////                    options: [.autoreverse,.repeat],
//                    animations: { () -> Void in
//                        //                            self.profilePic.transform = CGAffineTransform(translationX: 0, y: 10)
//                }, completion: nil)
                //                    profilePic.center = CGPoint(x: translation.x-50, y: cardInitialCenter.y)
                //                }

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
            UIView.animate(withDuration:0.1, delay: 0.0, animations: { () -> Void in
//            if(degrees < 60 && degrees > -60){
                self.profilePic.transform = CGAffineTransform.identity
//            }
            }, completion: nil)
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
