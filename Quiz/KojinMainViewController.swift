//
//  KojinMainViewController.swift
//  Quiz
//
//  Created by Saki Igeta on 2021/10/09.
//  Copyright © 2021 LifeisTech. All rights reserved.
//

import UIKit

class KojinMainViewController: UIViewController {

    var SoloQuizArray = [[Any]]()
    
    //正解数
    var SoloCorrectAnswer: Int = 0
    
    //お題を表示するTextView
    @IBOutlet var SoloQuiztTextView: UITextView!
    
    //お題を表示するImageView
    @IBOutlet var SoloQuizImageView: UIImageView!
    
    
    //お題のImage設定
    var img01 :UIImage = UIImage(named: "img01")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SoloQuizArray.append([img01,"オフライン or オンライン どちらでしょう？　\n「フ」か「ン」を体で表して答えてください。"])
        SoloQuizArray.append([img01,"オフライン or オンライン どちらでしょう？ \n 体で表現してみなよ。"])
        
        showSoloQuiz()

        // Do any additional setup after loading the view.
    }
    
    func showSoloQuiz(){
        SoloQuizImageView.image = SoloQuizArray[0][0] as? UIImage
        SoloQuiztTextView.text = SoloQuizArray[0][1] as? String

    }
    
    @IBAction func SoloQuizAnswer(sender: UIButton){
        
        SoloQuizArray.remove(at: 0)
        
        if SoloQuizArray.count == 0{
            performSegueToResult()
        }else{
            showSoloQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toSoloResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSoloResultView" {
            
            let SoloResultView = segue.destination as? KojinResultViewController
            SoloResultView?.SoloCorrectAnswer = self.SoloCorrectAnswer
        }
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
