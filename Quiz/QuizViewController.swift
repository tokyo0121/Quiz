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
    var img01 :UIImage = UIImage(named: "img01")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append([img01, "フ", "ン", 1])
        quizArray.append([img01, "フ", "ン", 2])
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
    
    
    //タイムアタック
    //タイマーをセットするメソッド
    //func setTimer() {

        //毎秒ごとにperSecTimerDoneメソッドを実行するタイマーを作成する
        //self.perSecTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(QuizViewController.perSecTimerDone), userInfo: nil, repeats: true)

        //指定秒数後にtimerDoneメソッドを実行するタイマーを作成する（問題の時間制限に到達した場合の実行）
        //self.doneTimer = NSTimer.scheduledTimerWithTimeInterval(QuizStruct.timerDuration, target: self, selector: #selector(QuizViewController.timerDone), userInfo: nil, repeats: true)
    //}

    //タイマー処理を全てリセットするメソッド
    //func resetTimer() {
        //self.perSecTimer!.invalidate()
        //self.doneTimer!.invalidate()
    //}
//}


    }

 
