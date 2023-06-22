//
//  ViewController.swift
//  BingoGame
//
//  Created by 권대윤 on 2023/06/20.
//

import UIKit

//들어있는 빙고게임의 정답인 값을 공유하기 위해 글로벌변수로 선언됐다.
var randomValue: Int = 0

class ViewController: UIViewController {
    
   
    
    var tryCount: Int = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var hitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //슬라이더의 Thumb를 지정된 이미지로 표시한다
        slider.setThumbImage(.init(imageLiteralResourceName: "slider_thumb"), for: UIControl.State.normal)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //게임초기화
        reset()
    }
    

    //슬라이더
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    //HIT 버튼
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            print("you win!")
            //해당 스토리보드 파일 이름으로 UIStroyboard 클래스의 인스턴스를 생성한다.
            let mySuccessAlertStoryboard = UIStoryboard(name: "SuccessAlert", bundle: nil)
            //지정된 storyboard ID으로 뷰 컨트롤러를 생성하는데, 스토리보드의 데이터로 초기화한다.
            let mySuccessViewController = mySuccessAlertStoryboard.instantiateViewController(identifier: "successAlert")
            //띄운 모달 뷰가 화면을 덮는 보기 스타일
            mySuccessViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            //모달 뷰 표시 시 전환 스타일
            mySuccessViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            //지정된 뷰 컨트롤러를 모달로 띄운다.
            self.present(mySuccessViewController, animated: true) {
                
            }
            
          
        } else if tryCount >= 5 {
            print("you lose!")
            //해당 스토리보드 파일 이름으로 UIStroyboard 클래스의 인스턴스를 생성한다.
            let mySuccessAlertStoryboard = UIStoryboard(name: "FailAlert", bundle: nil)
            //지정된 storyboard ID으로 뷰 컨트롤러를 생성하는데, 스토리보드의 데이터로 초기화한다.
            let mySuccessViewController = mySuccessAlertStoryboard.instantiateViewController(identifier: "failAlert")
            //띄운 모달 뷰가 화면을 덮는 보기 스타일
            mySuccessViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            //모달 뷰 표시 시 전환 스타일
            mySuccessViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            //지정된 뷰 컨트롤러를 모달로 띄운다.
            self.present(mySuccessViewController, animated: true) {
                
            }
            
            
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(Int(slider.minimumValue))
        } else { //randomValue < hitValue
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(Int(slider.maximumValue))
        }
        
        
    }
    
    //다시하기 버튼
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        reset()
    }
    
    //info 버튼
    @IBAction func touchUpInfoButton(_ sender: UIButton) {
        
    }
    
    //초기화
    func reset() {
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
    
    
    
}

