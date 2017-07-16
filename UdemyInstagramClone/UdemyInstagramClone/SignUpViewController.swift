//
//  SignUpViewController.swift
//  UdemyInstagramClone
//
//  Created by 金城裕治 on 2017/07/16.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var avaImage: UIImageView!
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpBtn_click(_ sender: UIButton) {
        print("sign up pressed")
    }
    
    @IBAction func cancelBtn_click(_ sender: UIButton) {
        print("cancel pressed")
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
