//
//  SignUpViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var avaImg: UIImageView!
    
  @IBOutlet weak var usernameTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  @IBOutlet weak var repeatPassword: UITextField!
  @IBOutlet weak var emailTxt: UITextField!
  
  @IBOutlet weak var fullnameTxt: UITextField!
  
  @IBOutlet weak var bioTxt: UITextField!
  @IBOutlet weak var webTxt: UITextField!

  
  @IBOutlet weak var signInBtn: UIButton!
  @IBOutlet weak var cancelBtn: UIButton!
  
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  var scrollViewHeight : CGFloat = 0
  
  var keyboard = CGRect()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // scrollviewサイズ指定
    scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    // scrollviewが動くように
    scrollView.contentSize.height = self.view.frame.height
    
    // 初期状態の高さを保存-!
    scrollViewHeight = scrollView.frame.size.height
    
    // キーボードが動いた時に動作するメソッド
    let notificationCenter = NotificationCenter.default
    
    notificationCenter.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
    notificationCenter.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    
    //tapされた時の動作を宣言する: 一度タップされたらキーボードを隠す
    let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
    hideTap.numberOfTapsRequired = 1
    self.view.isUserInteractionEnabled = true
    self.view.addGestureRecognizer(hideTap)
    
    
    // TextFieldDelegete
    usernameTxt.delegate = self
    passwordTxt.delegate = self
    repeatPassword.delegate = self
    fullnameTxt.delegate = self
    bioTxt.delegate = self
    webTxt.delegate = self
    
    // tapした時にimage libraryを開く
    let avaTap = UITapGestureRecognizer(target: self, action: #selector(loadImg))
    avaTap.numberOfTapsRequired = 1
    avaImg.isUserInteractionEnabled = true
    avaImg.addGestureRecognizer(avaTap)
    
    // 画像を丸める
    avaImg.layer.cornerRadius = avaImg.frame.size.width/2
    avaImg.clipsToBounds = true
    
  }
  
  func loadImg(recognizer : UITapGestureRecognizer) {
    
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    // swift3でpresentViewControllerから変わった
    present(picker, animated: true, completion: nil)
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    avaImg.image = info[UIImagePickerControllerEditedImage] as? UIImage
    self.dismiss(animated: true, completion: nil)
  }
  
  // キーボード以外をタップするとキーボードが下がるメソッド
  func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
    self.view.endEditing(true)
  }
  
  
  // show keyboard
  func showKeyboard(notification: Notification){
      
    keyboard = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue)!
    

    UIView.animate(withDuration: 0.4, animations: {
        self.scrollView.frame.size.height = self.scrollViewHeight - self.keyboard.height
    })
      
  }
  
  // hide keyboard
  func hideKeyboard(notification: Notification){
      
    keyboard = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue)!
    
    
    UIView.animate(withDuration: 0.4, animations: {
        self.scrollView.frame.size.height = self.view.frame.height
    })
    
  }
  
  
  // textFieldデリゲートメソッド
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    usernameTxt.resignFirstResponder()
    passwordTxt.resignFirstResponder()
    repeatPassword.resignFirstResponder()
    fullnameTxt.resignFirstResponder()
    bioTxt.resignFirstResponder()
    webTxt.resignFirstResponder()
    return true
    
  }
  
    
    
    
    
  func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  @IBAction func signUpBtn_click(_ sender: UIButton) {
    // keyboardを閉じる
    self.view.endEditing(true)
    
    if (usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty || repeatPassword.text!.isEmpty || fullnameTxt.text!.isEmpty ){
      
      let alert = UIAlertController(title: "PLEASE", message: "fill all fields", preferredStyle: UIAlertControllerStyle.alert)
      let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
      alert.addAction(ok)
      self.present(alert, animated: true, completion: nil)
      
    }
  }
  
  // 前に戻る
  @IBAction func cancelBtn_click(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
      
  }
  
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
