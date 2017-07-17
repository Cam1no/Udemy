//
//  SignInViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
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
  }
  @IBAction func signUpBtn_clicked(_ sender: UIButton) {
  }
  @IBAction func forgotBtn_clicked(_ sender: UIButton) {
  }
    
}
