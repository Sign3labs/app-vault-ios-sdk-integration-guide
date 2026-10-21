//  ApiConfig.swift — a normal source file in the app target.
//  It lives in the "package" folder named in appvault-classes.yml (packages: AppVaultIOSTest/Secure).
//  The AppVault "stage" build phase obfuscates its string literals IN PLACE before compiling, and the
//  "restore" phase puts the file back exactly as written — so this source stays readable while no
//  plaintext reaches the compiled binary.
import Foundation

final class ApiConfig: Sendable {
    static let shared = ApiConfig()

    let baseURL     = "https://api.appvault-demo.example/v1"
    let authPath    = "/oauth2/token"
    let apiKey      = "av-live-51d3f60c9a7b4e28"
    let pinningSPKI = "sha256/QXBwVmF1bHREZW1vUGlubmluZ0tleQ=="
    let suspiciousPaths = ["/Applications/Cydia.app", "/usr/sbin/frida-server"]

    func tokenEndpoint() -> String { baseURL + authPath }           // composed from two obfuscated parts
    func describe(_ user: String) -> String { "config for \(user)" } // interpolated -> left alone
}
