import SwiftUI

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            
            Spacer()
            Text("Home View")
            Spacer()
            Button("Fetch Users") {
                viewModel.fetchUsers()
//                print("testing...")
            }
        }
        .padding(.horizontal, 24)
    }
}
