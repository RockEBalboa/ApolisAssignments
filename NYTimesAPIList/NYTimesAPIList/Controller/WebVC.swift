//
//  WebVC.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    var webVM = WebVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        setupWebView(url: URL(string: webVM.getArticle().url ?? "") ?? URL(fileURLWithPath: ""))
        
        // Do any additional setup after loading the view.
    }
    
    func setupWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
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
