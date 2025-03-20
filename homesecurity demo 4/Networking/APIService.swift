import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let urlString = "http://remrem.myddns.me:7000/User/login"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(users))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
//    func loginUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
//        let urlString = "http://remrem.myddns.me:7000/User/login"
//        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let body: [String: Any] = ["username": username, "password": password]
//        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
//        } catch {
//            completion(.failure(error))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
//                return
//            }
//            
//            do {
//                let user = try JSONDecoder().decode(User.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(user))
//                }
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
    func loginUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let urlString = "http://remrem.myddns.me:7000/User/login"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["username": username, "password": password]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(user))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
