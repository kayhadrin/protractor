###
  This is the equivalent of ./stepDefinitions.js in CoffeeScript

  Made with http://js2coffee.org/

  @TODO Consider using https://github.com/js2coffee/js2coffee to do this on the fly
###

# Use the external Chai As Promised to deal with resolving promises in
# expectations.
chai = require("chai")
chaiAsPromised = require("chai-as-promised")
chai.use chaiAsPromised
expect = chai.expect

# Chai expect().to.exist syntax makes default jshint unhappy.
# jshint expr:true
module.exports = ->
  @Given /^I run Cucumber with Protractor$/, (next) ->
    next()
    return

  @Given /^I go on(?: the website)? "([^"]*)"$/, (url, next) ->
    browser.get url
    next()
    return

  @Then /^it should still do normal tests$/, (next) ->
    expect(true).to.equal true
    next()
    return

  @Then /^it should expose the correct global variables$/, (next) ->
    expect(protractor).to.exist
    expect(browser).to.exist
    expect(By).to.exist # We need to use 'By' instead of 'by' because 'by' is a reserved word in CoffeeScript
    expect(element).to.exist
    expect($).to.exist
    next()
    return

  @Then /the title should equal "([^"]*)"$/, (text, next) ->
    expect(browser.getTitle()).to.eventually.equal(text).and.notify next
    return

  @Then /^I (can|cannot) find an element by css using the selector "([^"]*)"$/, (shouldFind, selector, next) ->
    # expectEventuallyTo = expect(element(By.css(selector))).to.eventually
    expectEventuallyTo = expect($ selector).to.eventually

    if shouldFind is "can"
      expectEventuallyTo.notify next
    else
      expectEventuallyTo.be.rejected.and.notify next
    return

  return