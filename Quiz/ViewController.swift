//
//  ViewController.swift
//  Quiz
//
//  Created by Saki Igeta on 2021/10/09.
//  Copyright © 2021 LifeisTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //写真表示用ImageView
    @IBOutlet var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //アルバムボタンを押した時
    @IBAction func onTappedAlbumButton(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    //アルバム呼び出し
    func presentPickerController(sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    //アップロードボタンを押した時
    @IBAction func onTappedUploadButton(){
        if photoImageView.image != nil{
            //共有アイテムを設定
            let activityVC = UIActivityViewController(activityItems: [photoImageView.image!], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }else {
            print("画像がありません")
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
