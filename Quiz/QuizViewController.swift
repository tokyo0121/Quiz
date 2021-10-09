//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//aaa

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizImageView: UIImageView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    
    //正誤判定
    @IBOutlet weak var answerImage: UIImageView!
    
    
    //画像
    var img01 :UIImage = UIImage(named: "button")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append([img01, "京都府", "鹿児島県", 1])
        quizArray.append(["「茶葉」これなんて読む？", "ちゃば", "ちゃっぱ", 2])
        //------------------------ここから上にクイズを書く------------------------//
        
        //クイズの中身をシャッフルする
        quizArray.shuffle()

        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizImageView.image = quizArray[0][0] as? UIImage
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][3] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
            
            answerImage.image = UIImage(named: "true")
        }else{
            answerImage.image = UIImage(named: "false")
        }
        
        answerImage.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.answerImage.isHidden = true
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


