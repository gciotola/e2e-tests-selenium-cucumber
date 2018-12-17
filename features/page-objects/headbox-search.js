module.exports = {

  options: {
    timeout: 6000
  },
  
  elements: {
    searchWhat: by.css('#q_text'),
    searchWhere: by.css('#q_location'),
    submitButton: by.css('.btn[value="search"]'),
    serpIsLoaded: by.css('.search_index_results'),
    serpIsFound: by.css('#total_count')
  },

  /**
   * Enters what and where into Headbox's search bar and presses enter
   * @param {string} what, where
   * @param {string} where
   * @returns {Promise} a promise to enter the search values
   */
  simpleSearch: function (what, where) {
    var selectorWhat = page.headboxSearch.elements.searchWhat;
    var selectorWhere = page.headboxSearch.elements.searchWhere;
    var submit = page.headboxSearch.elements.submitButton;

    driver.findElement(selectorWhat).sendKeys(what);
    driver.findElement(selectorWhere).sendKeys(where);
    
    return driver.findElement(submit).click();
  },

 /**
   * Wait for SERP to be loaded 
   * @returns {Promise} a promise to resolve with the SERP element
   */
  getResults: function() {
    var elem = page.headboxSearch.elements.serpIsFound
    var timeout = page.headboxSearch.options.timeout
    return driver.wait( until.elementsLocated(elem), timeout)
      .then(
        () => driver.findElements(elem)
      )   
  },

  /**
   * Wait for SERP to be loaded 
   * @returns {Promise} a promise to resolve the page title
   */
  getMetaTitle: function() {
    var elem = page.headboxSearch.elements.serpIsLoaded
    var timeout = page.headboxSearch.options.timeout
    return driver.wait( until.elementsLocated(elem), timeout)
    .then( () => driver.getTitle() )
  }


  
};