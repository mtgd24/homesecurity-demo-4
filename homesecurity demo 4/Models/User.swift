import Foundation

struct User: Identifiable,Decodable {
    var id: Int
    var name: String
    var email: String
}
