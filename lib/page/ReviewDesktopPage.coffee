Page = require './Page'


class ReviewDesktopPage extends Page
  parse: ->
    return new Error 'the page is not loaded.'  if not @$?

    result = {}
    
    authorInfoTag = @$('.crAuthorInfo')
    profileTag = authorInfoTag.find('a').eq(0)
    if profileTag?
      result.profile =
        name: profileTag?.text()
        url: profileTag?.attr 'href'
        id: profileTag?.attr('href')?.split('/')?[4]

    result



module.exports = ReviewDesktopPage
