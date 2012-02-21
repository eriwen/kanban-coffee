routes = require("../routes")
assert = require("assert")
http = require("http")
describe "Router", ->
  describe "GET /", ->
    it "should respond successfully with HTML", ->
      http.get
        path: "/"
        port: 3000,
        (res) ->
          assert res.ok
          done()

  describe "POST /", ->
    it "should redirect back from creating a new Card", ->
      postData = JSON.stringify(
        "card[summary]": "SUMMARY"
        "card[content]": "CONTENT"
        "card[status]": "working"
      )
      postReq = http.request(
        method: "POST"
        path: "/"
        port: 3000,
        (res) ->
          assert.equal res.statusCode, 302
          done()
      )
      postReq.write postData
      postReq.end()