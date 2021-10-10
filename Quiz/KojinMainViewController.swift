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
    
    //お題を表示する
    @IBOutlet var SoloQuizImageView: UIImageView!
    
    //お題の問題文を表示
    @IBOutlet var SoloQuizTextImageView: UIImageView!
    
    
    //お題のImage設定
    var img01 :UIImage = UIImage(named: "7-8")!
    var img02 :UIImage = UIImage(named: "8-8")!
    var img03 :UIImage = UIImage(named: "9-8")!
    
    
    //お題のオ◯ライン
    var ofton01 :UIImage = UIImage(named: "15-8")!
    var ofton02 :UIImage = UIImage(named: "14-8")!
    var ofton03 :UIImage = UIImage(named: "13-8")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SoloQuizArray.append([ofton01,img01])
        SoloQuizArray.append([ofton02,img02])
        SoloQuizArray.append([ofton03,img03])
        
        showSoloQuiz()

        // Do any additional setup after loading the view.
    }
    
    func showSoloQuiz(){
        SoloQuizImageView.image = SoloQuizArray[0][0] as? UIImage
        SoloQuizTextImageView.image = SoloQuizArray[0][1] as? UIImage

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
