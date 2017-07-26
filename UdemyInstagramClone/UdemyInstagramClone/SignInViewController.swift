//
//  SignInViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var label: UILabel!
  // TextField
  @IBOutlet weak var usernameTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  
  // Button
  @IBOutlet weak var signInBtn: UIButton!
  @IBOutlet weak var signUpBtn: UIButton!
  @IBOutlet weak var forgotBtn: UIButton!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // textFieldの情報を受け取るためのdelegeteを設定
    usernameTxt.delegate = self
    passwordTxt.delegate = self
    
    //tapされた時の動作を宣言する: 一度タップされたらキーボードを隠す
    let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
    hideTap.numberOfTapsRequired = 1
    self.view.isUserInteractionEnabled = true
    self.view.addGestureRecognizer(hideTap)
    
    
    // layout
    label.frame = CGRect(x: 10, y: 80, width: self.view.frame.size.width - 20, height: 50)
    usernameTxt.frame = CGRect(x: 10, y: label.frame.origin.y + 40, width: self.view.frame.size.width - 20, height: 30)
    passwordTxt.frame = CGRect(x: 10, y: usernameTxt.frame.origin.y + 40, width: self.view.frame.size.width - 20, height: 30)
    forgotBtn.frame = CGRect(x: 10, y: passwordTxt.frame.origin.y + 30, width: self.view.frame.size.width / 4, height: 30)
    signInBtn.frame = CGRect(x: 20, y: forgotBtn.frame.origin.y + 40, width: self.view.frame.width / 4, height: 30)
    signUpBtn.frame = CGRect(x: self.view.frame.width - self.view.frame.size.width / 4 - 20, y: signInBtn.frame.origin.y, width: self.view.frame.size.width / 4, height: 30)
    
    
    // back image
    let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    bg.image = UIImage(named: "bk.jpeg")
    bg.layer.zPosition = -1
    self.view.addSubview(bg)
      
    
  }
  
  // キーボード以外をタップするとキーボードが下がるメソッド
  func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
    self.view.endEditing(true)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // キーボードを閉じる
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    usernameTxt.resignFirstResponder()
    passwordTxt.resignFirstResponder()
    return true
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

  
  @IBAction func signInBtn_clicked(_ sender: UIButton) {
    self.view.endEditing(true)
    
    
  }
  @IBAction func signUpBtn_clicked(_ sender: UIButton) {
  }
  @IBAction func forgotBtn_clicked(_ sender: UIButton) {
  }
    
}
