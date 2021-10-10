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
    var TeamCorrectAnswer: Int = 0
    
    //お題を表示するTextView
    @IBOutlet var TeamQuizTextImageView: UIImageView!
    
    //お題を表示するImageView
    @IBOutlet var TeamQuizImageView: UIImageView!
    
    
    //お題のImage設定
    var img01 :UIImage = UIImage(named: "10-8")!
    var img02 :UIImage = UIImage(named: "11-8")!
    var img03 :UIImage = UIImage(named: "9-8")!
    
    
    //お題のオ◯ライン
    var ofton01 :UIImage = UIImage(named: "15-8")!
    var ofton02 :UIImage = UIImage(named: "14-8")!
    var ofton03 :UIImage = UIImage(named: "13-8")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeamQuizArray.append([ofton01,img01])
        TeamQuizArray.append([ofton02,img02])
        TeamQuizArray.append([ofton03,img03])
        
        showTeamQuiz()

        // Do any additional setup after loading the view.
    }
    
    func showTeamQuiz(){
        TeamQuizImageView.image = TeamQuizArray[0][0] as? UIImage
        TeamQuizTextImageView.image = TeamQuizArray[0][1] as? UIImage

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
            TeamResultView?.TeamCorrectAnswer = self.TeamCorrectAnswer
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
