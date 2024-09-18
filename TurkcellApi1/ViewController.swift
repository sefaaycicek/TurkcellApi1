//
//  ViewController.swift
//  TurkcellApi1
//
//  Created by Sefa Aycicek on 18.09.2024.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CustomViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData {
            self.tableView.reloadData()
            //self.tableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
        }
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }
    
    // tableView:cellForRowAt:indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "portakal", for: indexPath) as? PostTableViewCell {
            cell.configure(cellViewModel: viewModel.getItem(index: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }

}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteItem(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
}
