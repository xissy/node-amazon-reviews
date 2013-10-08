Page = require './Page'


class ReviewDesktopPage extends Page
  parse: ->
    return new Error 'the page is not loaded.'  if not @$?

    result = {}
    
    authorInfoTag = @$('.crAuthorInfo')
    result.profileName = authorInfoTag.find('a').eq(0)?.text()
    result.profileUrl = authorInfoTag.find('a').eq(0)?.attr 'href'

    result



module.exports = ReviewDesktopPage
