class SearchViewController: UIViewController {

    // ...

    @objc func searchButtonTapped() {
        // ...

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

            // Update UI
            DispatchQueue.main.async {
                // TODO: Update UI with search results
            }
        }

        task.resume()
    }

}
