//
//  FuzeCSMatchTests.swift
//  FuzeCSMatchTests
//
//  Created by Raphael Buchler on 02/08/23.
//

import XCTest
@testable import FuzeCSMatch // Importe o nome do seu projeto aqui

class MatchesModelTests: XCTestCase {

    var matchesModel: MatchesModel!

    @MainActor override func setUpWithError() throws {
        matchesModel = MatchesModel()
    }

    override func tearDownWithError() throws {
        matchesModel = nil
    }

    func testGetMatches() async throws {
        let matches = try await matchesModel.getmacthes()
        XCTAssertFalse(matches.isEmpty, "Failed to fetch matches")
    }

    func testGetPastMatches() async throws {
        let pastMatches = try await matchesModel.getAPastMatches()
        XCTAssertFalse(pastMatches.isEmpty, "Failed to fetch past matches")
    }

    func testGetRunningMatches() async throws {
        let runningMatches = try await matchesModel.getRunningMatches()
        XCTAssertFalse(runningMatches.isEmpty, "Failed to fetch running matches")
    }

    func testGetUpcomingMatches() async throws {
        let upcomingMatches = try await matchesModel.getUpcomingMatches()
        XCTAssertFalse(upcomingMatches.isEmpty, "Failed to fetch upcoming matches")
    }

    func testGetDetailFromMatch() async throws {
        let matchDetail = try await matchesModel.getDetailFromMatch()
        XCTAssertNotNil(matchDetail, "Failed to fetch match detail")
    }

    func testGetMatchesFromJSON() async throws {
        let matches = try await matchesModel.getMatchesFromJSON()
        XCTAssertFalse(matches.isEmpty, "Failed to fetch matches from JSON")
    }

    @MainActor func testReadLocalFile() {
        let jsonData = matchesModel.readLocalFile(forName: "matches")
        XCTAssertNotNil(jsonData, "Failed to read local JSON file")
    }
}
