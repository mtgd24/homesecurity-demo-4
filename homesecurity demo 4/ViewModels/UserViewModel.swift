import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User] = []  // Array of User objects

    func fetchUsers() {
        APIService.shared.fetchUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.users = users
                    print("user:",users)
                case .failure(let error):
                    print("Error fetching users:", error.localizedDescription)
                }
            }
        }
    }
}
