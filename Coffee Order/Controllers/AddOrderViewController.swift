//
//  AddOrderViewController.swift
//  Coffee Order
//
//  Created by Ali Ahmadian shalchi on 12/07/2021.
//
import Foundation
import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    private var vm = AddCoffeeOrderViewModel()
    private var coffeeSizesSegmentedControl: UISegmentedControl!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupUI()
        
    }
    
    private func setupUI() {
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: self.vm.coffeeSize)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeeSizesSegmentedControl)
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.coffeeName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.coffeeName[indexPath.row]
        return cell
    }

    
}
