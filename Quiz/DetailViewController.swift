//
//  DetailViewController.swift
//  Quiz
//
//  Created by Saki Igeta on 2021/10/10.
//  Copyright © 2021 LifeisTech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!
    
    var selectedRow: Int!
    var selectedMemo: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteMemo(_sender: Any){
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
                        ud.set(saveMemoArray, forKey: "memoArray" )
                        ud.synchronize()
                        //画面遷移

                        self.navigationController?.popViewController(animated: true)
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
