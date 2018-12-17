module.exports = function () {

  this.When(/^I search Headbox for "([^"]*)" in "([^"]*)"$/, function (what, where) {
    return helpers.loadPage('https://www.headbox.com').then(function() {
      return page.headboxSearch.simpleSearch(what, where);
    })
  })

  this.Then(/^I should see some results$/, function () {
    return page.headboxSearch.getResults()
      .then(function(elems){
        expect(elems.length).to.be.above(0)
      })
  })

  this.Then(/^Title of the page should contains "([^"]*)"$/, function(where) {
    return page.headboxSearch.getMetaTitle()
      .then( 
        (title) => expect(title).to.be.a('string').that.includes(where) 
      )
  })


}