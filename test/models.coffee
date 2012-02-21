app = require("../app")
assert = require("assert")
models = require("../models/Card")
Card = models.Card
mongoose = require("mongoose")
describe "Card", ->
  it "should save valid Cards", (done) ->
    card = new Card(
      summary: "SUMMARY"
      content: "CONTENT"
      status: "ready"
    )
    card.save (err) ->
      throw err  if err
      done()

  it "should prevent summary from being blank", (done) ->
    card = new Card(
      summary: ""
      content: "CONTENT"
      status: "ready"
    )
    card.save (err) ->
      return done()  if err
      assert.equals 1, 2

  it "should prevent content from being blank", (done) ->
    card = new Card(
      summary: "SUMMARY"
      content: ""
      status: "ready"
    )
    card.save (err) ->
      return done()  if err
      assert.equals 1, 2

  it "should prevent status from being invalid", (done) ->
    card = new Card(
      summary: "SUMMARY"
      content: "CONTENT"
      status: "INVALID"
    )
    card.save (err) ->
      return done()  if err
      assert.equals 1, 2