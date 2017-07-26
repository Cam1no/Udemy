//
//  SignUpViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  // Firebaseインスタンス変数
  var DBRef:DatabaseReference!
  
  
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
    
    // インスタンスを初期化
    DBRef = Database.database().reference()
    
    
    // layout
    avaImg.frame = CGRect(x: self.view.frame.size.width / 2 - 40, y: 40, width: 80, height: 80)
    usernameTxt.frame = CGRect(x: 10, y: self.avaImg.frame.origin.y + 90, width: self.view.frame.size.width - 20, height: 30)
    passwordTxt.frame = CGRect(x: 10, y: self.usernameTxt.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 30)
    repeatPassword.frame = CGRect(x: 10, y: passwordTxt.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 30)
    emailTxt.frame = CGRect(x: 10, y: repeatPassword.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 60)
    fullnameTxt.frame = CGRect(x: 10, y: emailTxt.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 30)
    bioTxt.frame = CGRect(x: 10, y: fullnameTxt.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 30)
    webTxt.frame = CGRect(x: 10, y: bioTxt.frame.origin.y + 30, width: self.view.frame.size.width - 20, height: 30)
    signInBtn.frame = CGRect(x: 20, y: webTxt.frame.origin.y + 30, width: self.view.frame.size.width / 4, height: 30)
    cancelBtn.frame = CGRect(x: self.view.frame.size.width - self.view.frame.size.width / 4 - 20, y: signInBtn.frame.origin.y, width: self.view.frame.width / 4, height: 30)
    
    
    // back image
    let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    bg.image = UIImage(named: "bk.jpeg")
    bg.layer.zPosition = -1
    self.view.addSubview(bg)
    
    
    
    
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
    
    if passwordTxt.text != repeatPassword.text {
      
      let alert = UIAlertController(title: "PASSWORD", message: "Is not match", preferredStyle: UIAlertControllerStyle.alert)
      
      let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.cancel, handler: nil)
      alert.addAction(ok)
      self.present(alert, animated: true, completion: nil)
      
    }
    
    // 画像のupload
    let storage = Storage.storage()
    let storageRef = storage.reference()
    
    if let data = UIImagePNGRepresentation(avaImg.image! ) {
      let reference = storageRef.child("images/" + "1" + ".jpg")
      reference.putData(data, metadata: nil, completion: { metaData, error in
        print(metaData as Any)
        print(error as Any)
      })
      dismiss(animated: true, completion: nil)
    }
    
    let data = ["usename": usernameTxt.text!,
                "email": emailTxt.text!,
                "password": passwordTxt.text!,
                "fullname": fullnameTxt.text!,
                "avaImgPath": storageRef.fullPath
               ]
    
    DBRef.child("users").childByAutoId().setValue(data)

    
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
