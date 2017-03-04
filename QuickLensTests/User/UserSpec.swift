//
//  UserSpec.swift
//  QuickLens
//
//  Created by Takeshi Ihara on 2017/03/04.
//  Copyright © 2017年 Takeshi Ihara. All rights reserved.
//

import Quick
import Nimble
@testable import QuickLens

class UserSpec: QuickSpec {
    override func spec() {
        describe("User") {
            var user: User!

            beforeEach {
                user = User.generate()
            }

            describe("isStudent") {
                context("when age is 13") {
                    beforeEach {
                        user = user |> (User.lens.age *~ 13)
                    }

                    it("user is student") {
                        expect(user.isStudent).to(beTrue())
                    }
                }

                context("when age is 5") {
                    beforeEach {
                        user = user |> (User.lens.age *~ 5)
                    }

                    it("user is not student") {
                        expect(user.isStudent).to(beFalse())
                    }
                }

                context("when age is 17") {
                    beforeEach {
                        user = user |> (User.lens.age *~ 17)
                    }

                    it("user is not student") {
                        expect(user.isStudent).to(beFalse())
                    }
                }
            }

            describe("hasSNSAccount") {
                var accountName: String!

                beforeEach {
                    accountName = "@nonchalant0303"
                }

                context("when both twitter and github are not connected") {
                    var sns: SNS!

                    beforeEach {
                        sns = SNS.generate() |> (SNS.lens.twitter *~ nil) |> (SNS.lens.github *~ nil)
                        user = user |> (User.lens.sns *~ sns)
                    }

                    it("user has no sns account") {
                        expect(user.hasSNSAccount).to(beFalse())
                        expect(user.sns.twitter).to(beNil())
                        expect(user.sns.github).to(beNil())
                    }
                }

                context("when twitter is connected") {
                    beforeEach {
                        user = user |> ((User.lens.sns * SNS.lens.twitter) *~ accountName)
                    }

                    it("user has twitter account") {
                        expect(user.hasSNSAccount).to(beTrue())
                        expect(user.sns.twitter).to(equal(accountName))
                    }
                }

                context("when github is connected") {
                    beforeEach {
                        user = user |> ((User.lens.sns * SNS.lens.github) *~ accountName)
                    }

                    it("user has github account") {
                        expect(user.hasSNSAccount).to(beTrue())
                        expect(user.sns.github).to(equal(accountName))
                    }
                }
            }
        }
    }
}
