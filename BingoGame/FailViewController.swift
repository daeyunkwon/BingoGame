//
//  FailViewController.swift
//  BingoGame
//
//  Created by 권대윤 on 2023/06/20.
//

import UIKit
import Lottie

class FailViewController: UIViewController {

    @IBOutlet weak var randomValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        randomValueLabel.text = "\(randomValue)"
        randomValueLabel.adjustsFontSizeToFitWidth = true
        
        //지정된 좌표에 지정된 크기로 뷰 생성
        let starAnimationView = LottieAnimationView(frame: CGRect(x: 96, y: 394, width: 200, height: 200))
        /// Some time later
        let starAnimation = LottieAnimation.named("127298-cheering-lolo")
        starAnimationView.animation = starAnimation
        
        view.addSubview(starAnimationView)
        starAnimationView.loopMode = .loop
        starAnimationView.play()
        
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
