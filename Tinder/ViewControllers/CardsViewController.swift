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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImage(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        profilePic.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didMovePic(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        var radians = atan2(profilePic.transform.b, profilePic.transform.a)
        var degrees = Double(radians * 180) / Double.pi
        if sender.state == .began{
            print("started panning")
            cardInitialCenter = profilePic.center
            
        }
        else if sender.state == .changed{
            radians = atan2(profilePic.transform.b, profilePic.transform.a)
            degrees = Double(radians * 180) / Double.pi
            if translation.x > 0{
                print("right panning")
                if(degrees >= 50){
                    UIView.animate(withDuration:0.1, delay: 0.0,
                                   //           Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                        //                        options: [.autoreverse,.repeat],
                        animations: { () -> Void in
                            print("Degrees: ", degrees)
                            self.profilePic.transform = CGAffineTransform(translationX: 1000, y: 0.1)
                            self.profilePic.transform = self.profilePic.transform.translatedBy(x: 1000, y: 10)
                            
                    }, completion: nil)
                }
                else if(translation.y > 0){
                    self.profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 180))
                }
                else{
                    self.profilePic.transform = CGAffineTransform(rotationAngle: -CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: -CGFloat(Double(translation.x) * Double.pi / 180))
                }
                print(degrees)
                
            }
            else{
                print("left panning")
                if(degrees <= -50){
                    UIView.animate(withDuration:0.1, delay: 0.0,
                                   //           Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                        //                        options: [.autoreverse,.repeat],
                        animations: { () -> Void in
                            print("Degrees: ", degrees)
                            self.profilePic.transform = CGAffineTransform(translationX: -1000, y: 0.1)
                            //self.profilePic.transform = self.profilePic.transform.translatedBy(x: -1000, y: 10)
                            self.profilePic.removeFromSuperview()
                            
                    }, completion: nil)
                }
                if(translation.y > 0){
                    self.profilePic.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 180))
                }
                else{
                    self.profilePic.transform = CGAffineTransform(rotationAngle: -CGFloat(Double(translation.x) * Double.pi / 180))
                    self.profilePic.transform = self.profilePic.transform.rotated(by: -CGFloat(Double(translation.x) * Double.pi / 180))
                }
            }
            
        }
        else if sender.state == .ended{
            print("ended panning")
            radians = atan2(profilePic.transform.b, profilePic.transform.a)
            degrees = Double(radians * 180) / Double.pi
            print("Degrees: ", degrees)
            if(degrees > -50 && degrees < 50){
                UIView.animate(withDuration:0.1, delay: 0.0, animations: { () -> Void in
                    //            if(degrees < 60 && degrees > -60){
                    self.profilePic.transform = CGAffineTransform.identity
                    //            }
                }, completion: nil)
            }
                if(degrees >= 50){
                    UIView.animate(withDuration:0.1, delay: 0.0,
                                   //           Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                        //                        options: [.autoreverse,.repeat],
                        animations: { () -> Void in
                            self.profilePic.transform = CGAffineTransform(translationX: 1000, y: 0.1)
                            //self.profilePic.transform = self.profilePic.transform.translatedBy(x: 1000, y: 0.1)
                            self.profilePic.removeFromSuperview()
                            
                    }, completion: nil)
                }
                else if(degrees <= -50){
                    UIView.animate(withDuration:0.1, delay: 0.0,
                                   //           Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                        //                        options: [.autoreverse,.repeat],
                        animations: { () -> Void in
                            //                            self.profilePic.transform = CGAffineTransform(translationX: 50, y: 0.1)
                            self.profilePic.transform = CGAffineTransform(translationX: -1000, y: 0.1)
                            //self.profilePic.transform = self.profilePic.transform.translatedBy(x: -1000, y: 0.1)
                            self.profilePic.removeFromSuperview()
                    }, completion: nil)
            }
            
        }
    }
    
    @objc func didTapImage(_ sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "toPictureSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toPictureSegue"){
            let destinationVC = segue.destination as! ProfileViewController
            destinationVC.value = self.profilePic
        }
    }

}
