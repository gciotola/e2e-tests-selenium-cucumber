module.exports = {

  /**
   * Enters what and where into Headbox's search bar and presses enter
   * @param {string} what, where
   * @param {string} where
   * @returns {Promise} a promise to enter the search values
   */
  checkForClass: function (css_class) {
    var elem = by.css(css_class)
    return driver.wait( until.elementsLocated(elem), 6000)
      .then(
        () => driver.findElements(elem)
      )   
  }

  
};