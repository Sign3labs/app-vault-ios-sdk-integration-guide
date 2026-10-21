import SwiftUI

struct ContentView: View {
    private let config = ApiConfig.shared

    var body: some View {
        NavigationStack {
            List {
                Section("Deobfuscated at runtime") {
                    row("Base URL", config.baseURL)
                    row("Token endpoint", config.tokenEndpoint())
                    row("API key", config.apiKey)
                    row("Pinning SPKI", config.pinningSPKI)
                }
                Section("Jailbreak signatures") {
                    ForEach(config.suspiciousPaths, id: \.self) { path in
                        Text(path).font(.footnote.monospaced())
                    }
                }
                Section {
                    Text("These strings are reconstructed at runtime by AppVault. None of them appears as plaintext in the compiled binary.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("AppVault Test")
        }
    }

    private func row(_ key: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(key).font(.caption).foregroundStyle(.secondary)
            Text(value).font(.footnote.monospaced()).textSelection(.enabled)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    ContentView()
}
