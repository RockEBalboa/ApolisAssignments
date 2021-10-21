//
//  ViewController.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import UIKit
import Kingfisher

class ListVC: UIViewController {
    @IBOutlet weak var list: UITableView!
    var vm = ArticleVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        list.delegate = self
        list.dataSource = self
        
        list.register(ArticleTVC.self, forCellReuseIdentifier: "ArticleTVC")
        
        vm.populateArticles(url: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=aDFfPYP6tsmCYHNdOPUcNqPCvus1O4Ed")
        vm.refreshUI = {
            DispatchQueue.main.async {
                self.list.reloadData()
            }
        }
    }
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getArticleCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = list.dequeueReusableCell(withIdentifier: "cell") {
            let article = vm.getArticle(at: indexPath.row)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = (article.title ?? "") + "\n" + (article.byline ?? "") + "\n" + (article.translateDate(date: article.published_date ?? ""))

//            DispatchQueue.main.async {
//                if let url = URL(string: article.multimedia?[0].url ?? "") {
//                    cell.imageView?.kf.setImage(with: url)
//                }
//            }
            return cell
        }
//        if let cell = list.dequeueReusableCell(withIdentifier: "ArticleTVC") as? ArticleTVC {
//            let article = vm.getArticle(at: indexPath.row)
//            cell.article = article
//            cell.populateCell()
//            return cell
//        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebVC") as? WebVC {
            webVC.webVM.setArticle(a: vm.getArticle(at: indexPath.row))
            navigationController?.pushViewController(webVC, animated: true)
        }
    }
}

