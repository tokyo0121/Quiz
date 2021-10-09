//
//  TeamMainViewController.swift
//  Quiz
//
//  Created by Saki Igeta on 2021/10/09.
//  Copyright © 2021 LifeisTech. All rights reserved.
//

import UIKit

class TeamMainViewController: UIViewController {
    
    var TeamQuizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //お題を表示するTextView
    @IBOutlet var TeamQuiztTextView: UITextView!
    
    //お題を表示するImageView
    @IBOutlet var TeamQuizImageView: UIImageView!
    
    
    //お題のImage設定
    var img01 :UIImage = UIImage(named: "img01")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeamQuizArray.append([img01,"オフライン or オンライン どちらでしょう？　\n「フ」か「ン」を体で表して答えてください。"])
        TeamQuizArray.append([img01,"オフライン or オンライン どちらでしょう？ \n 体で表現してみなよ。"])
        
        showTeamQuiz()

        // Do any additional setup after loading the view.
    }
    
    func showTeamQuiz(){
        TeamQuizImageView.image = TeamQuizArray[0][0] as? UIImage
        TeamQuiztTextView.text = TeamQuizArray[0][1] as? String

    }
    
    @IBAction func TeamQuizAnswer(sender: UIButton){
        
        TeamQuizArray.remove(at: 0)
        
        if TeamQuizArray.count == 0{
            performSegueToResult()
        }else{
            showTeamQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toTeamResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamResultView" {
            
            let TeamResultView = segue.destination as? TeamResultViewController
            TeamResultView?.TeamCorrectAnswer = self.correctAnswer
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
