//
//  RestPasswordViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class RestPasswordViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  @IBOutlet weak var emailTxt: UITextField!
  
  @IBOutlet weak var resetBtn: UIButton!
  
  @IBOutlet weak var cancelBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //tapされた時の動作を宣言する: 一度タップされたらキーボードを隠す
    let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
    hideTap.numberOfTapsRequired = 1
    self.view.isUserInteractionEnabled = true
    self.view.addGestureRecognizer(hideTap)

    label.frame = CGRect(x: 10, y: 80, width: self.view.frame.size.width - 20, height: 40)
    emailTxt.frame = CGRect(x: 10, y: label.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 40)
    resetBtn.frame = CGRect(x: 10, y: emailTxt.frame.origin.y + 40, width: self.view.frame.size.width / 4, height: 40)
    cancelBtn.frame = CGRect(x: self.view.frame.size.width * ( 3 / 4 ) - 20 , y: resetBtn.frame.origin.y, width: self.view.frame.size.width / 4, height: 40)
    
    // back image
    let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    bg.image = UIImage(named: "bk.jpeg")
    bg.layer.zPosition = -1
    self.view.addSubview(bg)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }
  
  // キーボード以外をタップするとキーボードが下がるメソッド
  func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
    self.view.endEditing(true)
  }
  

  
  @IBAction func resetBtn_clicked(_ sender: Any) {
    //送信して
    
    self.view.endEditing(true)
    if emailTxt.text!.isEmpty {
      let alert = UIAlertController(title: "Email Fields", message: "is empty", preferredStyle: UIAlertControllerStyle.alert)
      let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
      alert.addAction(ok)
      self.present(alert, animated: true, completion: nil)
      
    }else{
      let alert = UIAlertController(title: "E-MAIL", message: "送信できました", preferredStyle: UIAlertControllerStyle.alert)
      let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
      alert.addAction(ok)
      // 戻る
      self.dismiss(animated: true, completion: nil)
    }
    
  }
  
  @IBAction func cancelBtn_clicked(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    
  }
  
}
