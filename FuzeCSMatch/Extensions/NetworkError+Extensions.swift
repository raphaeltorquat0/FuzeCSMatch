import Foundation

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return NSLocalizedString("Unable to perform request", comment: "badRequestError")
        case .ServerError(let errorMessage):
            return NSLocalizedString(errorMessage, comment: "serverError")
        case .decodingError:
            return NSLocalizedString("Untable to decode successfully", comment: "decodingError")
        case .invalidResponse:
            return NSLocalizedString("Invalid Response", comment: "invalidResponse")
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "invalidURL")
        }
    }
}
