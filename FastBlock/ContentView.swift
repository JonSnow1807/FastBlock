import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "shield.checkered")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("FastBlock")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Ultra-fast ad blocking for Safari")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
                .padding(.horizontal, 40)
            
            VStack(spacing: 15) {
                Text("Setup Instructions:")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 10) {
                    Label("Open Safari", systemImage: "1.circle.fill")
                    Label("Go to Safari → Settings → Extensions", systemImage: "2.circle.fill")
                    Label("Enable 'FastBlock Extension'", systemImage: "3.circle.fill")
                    Label("Click 'Always Allow on Every Website'", systemImage: "4.circle.fill")
                }
                .font(.body)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Button(action: {
                // Open Safari Extensions preferences
                if let url = URL(string: "x-apple.systempreferences:com.apple.Safari-Settings.extension") {
                    NSWorkspace.shared.open(url)
                }
            }) {
                Text("Open Safari Extensions")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Text("Version 1.0.0")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 400, height: 500)
    }
}

#Preview {
    ContentView()
}
