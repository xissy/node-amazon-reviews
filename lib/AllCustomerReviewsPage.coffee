Page = require './Page'
urlModule = require 'url'


class AllCustomerReviewsPage extends Page

  #### get the product id.
  getProductId: ->
    parsedUrl = urlModule.parse @options.url
    path = parsedUrl.pathname
    path.split('/')[3]
    

  #### get next page url from the all customer reviews page document.
  getNextPageUrl: ->
    pageLinkTags = @$('.paging a')
    nextText = pageLinkTags.eq(pageLinkTags.length - 1).text()

    if nextText is 'Next ›'
      nextUrl = pageLinkTags["#{pageLinkTags.length - 1}"].attribs.href
    else
      nextUrl = null

    nextUrl


  #### get review id array.
  getReviewIds: ->
    reviewLinkTags = @$('#productReviews a')

    reviewIds = []
    for reviewLinkTag in reviewLinkTags.toArray()
      # there should be `name` attribute but no `style` attribute.
      if reviewLinkTag?.attribs?.name? and not reviewLinkTag?.attribs?.style?
        reviewIds.push reviewLinkTag?.attribs?.name

    reviewIds



module.exports = AllCustomerReviewsPage
