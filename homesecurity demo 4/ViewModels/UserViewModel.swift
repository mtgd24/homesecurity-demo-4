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
    func loginUser(username: String, password: String) {
        APIService.shared.loginUser(username: username, password: password) { [weak self] result in
            guard let self = self else { return } // Ensure self exists

            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    print("Login successful:", user)
                    self.fetchUsers() // Now safely calling fetchUsers
                case .failure(let error):
                    print("Login failed:", error.localizedDescription)
                }
            }
        }
    }

}
