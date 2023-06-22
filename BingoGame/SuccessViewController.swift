//
//  SuccessViewController.swift
//  BingoGame
//
//  Created by 권대윤 on 2023/06/20.
//

import UIKit
import Lottie

class SuccessViewController: UIViewController {
    

    @IBOutlet var randomValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        randomValueLabel.text = "\(randomValue)"
        randomValueLabel.adjustsFontSizeToFitWidth = true
        
        
        let starAnimationView = LottieAnimationView(frame: CGRect(x: 0, y: 0, width: 361, height: 544))
        /// Some time later
        let starAnimation = LottieAnimation.named("134682-confetti")
        starAnimationView.animation = starAnimation
        
        view.addSubview(starAnimationView)
        starAnimationView.loopMode = .loop
        starAnimationView.play()
        
        let starAnimationView2 = LottieAnimationView(frame: CGRect(x: 136, y: 475, width: 120, height: 120))
        /// Some time later
        let starAnimation2 = LottieAnimation.named("127301-yesss-lolo")
        starAnimationView2.animation = starAnimation2
        
        view.addSubview(starAnimationView2)
        starAnimationView2.loopMode = .loop
        starAnimationView2.play()
        
        
    }
    

    @IBAction func restartButton(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
