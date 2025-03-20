import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showRegisterView: Bool = false
    @StateObject private var viewModel = UserViewModel()

    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Color
                Color(red: 197/255, green: 234/255, blue: 167/255)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    // Email Input
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .padding(.horizontal, 40)

                    // Password Input
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .padding(.horizontal, 40)

                    // Login Button
                    Button(action: {
                        // Simulate a successful login
                        isLoggedIn = true
                        print("email:"+email+"password:"+password)
                        
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal, 40)

                    // Navigate to Register page
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.black)
                        
                        NavigationLink("Register", destination: RegisterView())
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)

                    Spacer()
                }
                .padding(.top, 100)
//                .navigationDestination(isPresented: $isLoggedIn) {
//                    MainTabbedView() // Navigate to Home after login
//                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
