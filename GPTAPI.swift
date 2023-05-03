struct ChatGPTResponse: Codable {
    let text: String
}

class SearchViewController: UIViewController {

    // ...

    let baseURL = "https://api.openai.com/v1/engine/davinci-codex/completions"
    let apiKey = "strf-134423-pohyf"

    @objc func searchButtonTapped() {
        guard let searchQuery = searchTextField.text else {
            return
        }

        // Construct request
        let url = URL(string: baseURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody = [
            "prompt": "Ask away!",
            "max_tokens": 100,
            "temperature": 0.5,
            "stop": ["\n"]
        ]

        let jsonData = try! JSONSerialization.data(withJSONObject: requestBody, options: [])
        request.httpBody = jsonData

        // Send request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // Parse response
            let decoder = JSONDecoder()
            let response = try! decoder.decode(ChatGPTResponse.self, from: data)
            print("Response text: \(response.text)")
        }

        task.resume()
    }

}
