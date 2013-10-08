# node-amazon-reviews
> A node.js module to crawl product reviews from Amazon.

Amazon Product Advertising API provides almost attributes about a product. But review data cannot be gathered by API. Use this module if you want to get product reviews.


## Installation
Via [npm](https://npmjs.org):

    $ npm install amazon-reviews


## Usages

### Load in the module
```javascript
var AmazonReviews = require('amazon-reviews');
```

### Get review IDs by a product ID
```javascript
AmazonReviews.getReviewIds({
  productId: 'PRODUCT_ID_HERE'
}, function(err, reviewIds) {
  ...
});
```

### Get a review by product ID and review ID
```javascript
AmazonReviews.getReview({
  productId: 'PRODUCT_ID_HERE',
  reviewId: 'REVIEW_ID_HERE'
}, function(err, review) {
  ...
});
```


## License

Released under the MIT License

Copyright (c) 2013 Taeho Kim <xissysnd@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
