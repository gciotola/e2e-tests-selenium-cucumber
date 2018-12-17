module.exports = function () {

  this.When(/^I open Headbox site at "([^"]*)"$/, function (website) {
    return helpers.loadPage(website)
  })

  this.Then(/^I should see at least "([^"]*)" element with class "([^"]*)"$/, function (quantity, css) {
    return page.headboxHomepage.checkForClass(css)
      .then(function(elems){
        expect(elems.length).to.be.above(quantity)
      })
  })


}