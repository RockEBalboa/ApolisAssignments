//
//  AddVC.swift
//  LuLuLemonAssignment
//
//  Created by Ethan Rockel on 10/13/21.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    var addVM = AddVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtField.becomeFirstResponder()
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        if txtField.text != "" {
            addVM.saveGarment(name: txtField.text ?? "")
            navigationController?.popViewController(animated: true)
        }
    }
}
