//
//  RestPasswordViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class RestPasswordViewController: UIViewController {

  
  @IBOutlet weak var emailTxt: UITextField!
  
  @IBOutlet weak var resetBtn: UIButton!
  
  @IBOutlet weak var cancelBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
