waitAndExec = (nextFn) ->
  (err, browser) ->
    browser.wait nextFn

createCard = (err, browser) ->
  browser.fill ".new-story input[type=\"text\"]", "SUMMARY"
  browser.fill ".new-story textarea", "CONTENT"
  browser.pressButton "New Card", waitAndExec(updateText)

focusSummary = (err, browser) ->
  browser.fire "focus", browser.querySelector(".card:last-child .card-title"), updateSummary

updateSummary = (err, browser) ->
  browser.fill ".card:last-child .card-title", "UPDATED SUMMARY"
  browser.wait focusContent

focusContent = (err, browser) ->
  browser.fire "focus", browser.querySelector(".card:last-child .content"), updateSummary

updateContent = (err, browser) ->
  browser.fill ".card:last-child .content", "UPDATED CONTENT"

zombie = require("zombie")
assert = require("assert")
Subject = require("../../models/subject").Subject
zombie.visit "http://localhost:3000",
  debug: true,
  createSubject