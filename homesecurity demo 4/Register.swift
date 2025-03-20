import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showLoginView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Color
                Color(red: 197/255, green: 234/255, blue: 167/255)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("Register")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    // Username Input
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .padding(.horizontal, 40)

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

                    // Register Button
                    Button(action: {
                        // Handle registration logic here
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal, 40)

                    // Navigate to Login page
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.black)
                        
                        NavigationLink("Login", destination: LoginView())
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)

                    Spacer()
                }
                .padding(.top, 100)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
