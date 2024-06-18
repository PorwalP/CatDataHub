//
//  ProductListViewController.swift
//  CatDataHub
//
//  Created by Payal Porwal on 14/06/24.
//

import UIKit
import SVProgressHUD

class ProductListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productTableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}

extension ProductListViewController {
    // MARK: - configuration
    /**
     - description: - It is the collection of function. which will be called when controller is loaded.
     */
    func configuration() {
        productTableView.register(UINib(nibName: Constant.ProducTableView.nibName, bundle: nil), forCellReuseIdentifier: Constant.ProducTableView.cellIdentifier)
        observeEvent()
        initViewModel()
        
    }
    func initViewModel() {
        viewModel.fetchProducts()
    }
    func observeEvent() {
        viewModel.eventHandler =  { [weak self] event in
            guard let self else {
                return
            }
            switch event {
            case .dataLoading:
                ProgressHudManager.addProgressHUD()
            case .stopLoading:
                ProgressHudManager.hideProgressHUD()
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                guard let error else { return }
                print(error)
            }
        }
    }
    
}

// MARK: - UITableView delegates.

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.ProducTableView.cellIdentifier) as? ProductListTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.product[indexPath.row]
        cell.product = product
        cell.delegate = self
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsViewController = self.storyboard?.instantiateViewController(identifier: Constant.ProductDetailView.controllerIdentifier) as? ProductDetailsViewController {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
            detailsViewController.product = viewModel.product[indexPath.row]
        }
    }
}

extension ProductListViewController: favoriteProtocol {
    func saveFavorite(id: String?) {
        guard let id else { return }
        FavoritesManager.shared.addFavorite(productId: id)
    }
}


