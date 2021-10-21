//
//  ViewController.swift
//  LuLuLemonAssignment
//
//  Created by Ethan Rockel on 10/13/21.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var tbl: UITableView!
    var listVM = ListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortingOrderChanged()
        
    }
    @IBAction func segmentedChange(_ sender: Any) {
        sortingOrderChanged()
    }
    
    func sortingOrderChanged() {
        if segmented.selectedSegmentIndex == Constants.ALPHA.rawValue {
            listVM.fetchGarmentList(sortType: Constants.ALPHA.rawValue)
        } else if(segmented.selectedSegmentIndex == Constants.TIME_CREATED.rawValue) {
            listVM.fetchGarmentList(sortType: Constants.TIME_CREATED.rawValue)
        }
        DispatchQueue.main.async {
            self.tbl.reloadData()
        }
    }
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func addProtocol(garment: Garment) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.getGarmentListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = listVM.getGarment(at: indexPath.row).name
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listVM.deleteGarment(at: indexPath.row)
        }
        sortingOrderChanged()
    }
}

