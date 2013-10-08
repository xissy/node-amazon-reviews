Page = require './Page'


class ReviewMobilePage extends Page
  parse: ->
    return new Error 'the page is not loaded.'  if not @$?

    result = {}
    result.title = @$('#reviews-list h4').text().replace /\n/g, ''
    result.starCount = @$('.a-icon-star-full').length
    
    dateText = @$('span.a-color-secondary').eq(0).text().split('-')[1].replace /\n/g, ''
    result.createdAt = new Date dateText
    
    # replace all br tags to new lines.
    descTag = @$('.a-spacing-micro')
    descTag.find('br').replaceWith '\n'
    result.descText = @$('.a-spacing-micro').text()

    result.helpfulCount = Number @$('.votes-helpful').text()
    result.voteCount = Number @$('.votes-total').text()

    result



module.exports = ReviewMobilePage
