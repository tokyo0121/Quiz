//
//  ViewController.swift
//  Quiz
//
//  Created by Saki Igeta on 2021/10/09.
//  Copyright © 2021 LifeisTech. All rights reserved.
//

import UIKit
//
//class AddViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    //写真表示用ImageView
//    @IBOutlet var photoImageView: UIImageView!
//
//    //メモ書きTextView
//    @IBOutlet weak var memoTextView: UITextView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    //アルバムボタンを押した時
//    @IBAction func onTappedAlbumButton(){
//        presentPickerController(sourceType: .photoLibrary)
//    }
//
//    //アルバム呼び出し
//    func presentPickerController(sourceType: UIImagePickerController.SourceType){
//        if UIImagePickerController.isSourceTypeAvailable(sourceType){
//            let picker = UIImagePickerController()
//            picker.sourceType = sourceType
//            picker.delegate = self
//            self.present(picker, animated: true, completion: nil)
//        }
//    }
//
//    //写真が選択された時
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        self.dismiss(animated: true, completion: nil)
//        //画像を出力
//        photoImageView.image = info[.originalImage]as? UIImage
//    }
//
//    //アップロードボタンを押した時
//    @IBAction func onTappedUploadButton(){
//        if photoImageView.image != nil{
//            //共有アイテムを設定
//            let activityVC = UIActivityViewController(activityItems: [photoImageView.image!], applicationActivities: nil)
//            self.present(activityVC, animated: true, completion: nil)
//        }else {
//            print("画像がありません")
//        }
//
//        let inputText = memoTextView.text
//        let ud = UserDefaults.standard
//        if ud.array(forKey: "memoArray") != nil{
//            //saveMemoArrayに取得
//            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
//                //テキストに何か書かれているか？
//            if inputText != ""{
//                //配列に追加
//                saveMemoArray.append(inputText!)
//                ud.set(saveMemoArray, forKey: "memoArray")
//            }else{
//                showAlert(title: "何も入力されていません")
//
//            }
//
//        }else{
//            //最初、何も書かれていない場合
//            var newMemoArray = [String]()
//            //nilを強制アンラップはエラーが出るから
//            if inputText != ""{
//                //inputtextはoptional型だから強制アンラップ
//                newMemoArray.append(inputText!)
//                ud.set(newMemoArray, forKey: "memoArray")
//            }else{
//                showAlert(title: "何も入力されていません")
//            }
//        }
//        showAlert(title: "保存完了")
//        ud.synchronize()
//    }
//
//    func showAlert(title:String){
//            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
//
//            self.present(alert, animated: true, completion:nil)
//        }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}



final class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            // デフォルトの画像を表示する
            imageView.image = UIImage(named: "no_image.png")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectPicture(_ sender: UIButton) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }

    @IBAction func deletePicture(_ sender: UIButton) {
        // アラート表示
        showAlert()
    }

    /// アラート表示
    func showAlert() {
        let alert = UIAlertController(title: "確認",
                                      message: "画像を削除してもいいですか？",
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler:{(action: UIAlertAction) -> Void in
                                        // デフォルトの画像を表示する
                                        self.imageView.image = UIImage(named: "no_image.png")
        })
        let cancelButton = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)

        // アラートにボタン追加
        alert.addAction(okButton)
        alert.addAction(cancelButton)

        // アラート表示
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した写真を取得する
        let image = info[.originalImage] as! UIImage
        // ビューに表示する
        imageView.image = image
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
    
}
    
    
//   tamakoko----------------------------------------------------------------
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



