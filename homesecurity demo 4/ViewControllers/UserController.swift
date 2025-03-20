import UIKit

class UserController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.shared.fetchUsers { result in
            switch result {
            case .success(let users):
                print("Fetched Users:", users)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}
