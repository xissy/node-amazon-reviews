Page = require './Page'


class ReviewsIframePage extends Page
  #### get all customer reviews page url from the reviews iframe url.
  getAllCustomerReviewsPageUrl: ->
    linkTags = @$('.small a')
    return null  if linkTags.length is 0
    
    @$('.small a')['0'].attribs.href



module.exports = ReviewsIframePage
