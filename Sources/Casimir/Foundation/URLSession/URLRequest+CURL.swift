import Foundation

public extension URLRequest {
  /**
   This `URLRequest` in the form of `curl` command, ready to use in the terminal.

   - Note: Doing `po request.curl` via xcode console will add escaping (`\` for every `'` and `"`) - needs to be removed manually (or get used to it lol).
   */
  var curl: String {
    let newLine = ""
    let method = "-X " + "\(self.httpMethod ?? "GET") \(newLine)"
    let url: String = "'\(self.url?.absoluteString ?? "")' \(newLine)"

    var cURL = "curl "
    var header = ""
    var data: String = ""

    if let httpHeaders = self.allHTTPHeaderFields, !httpHeaders.keys.isEmpty {
      for (key, value) in httpHeaders {
        header += "-H " + "'\(key): \(value)' \(newLine)"
      }
    }

    if let bodyData = self.httpBody, let bodyString = String(data: bodyData, encoding: .utf8), !bodyString.isEmpty {
      data = "--data '\(bodyString)'"
    }

    cURL += method + url + header + data

    return cURL
  }
}
