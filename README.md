## Twitter [(raw)](https://gist.githubusercontent.com/timothy1ee/b9b1860c8ecb4b0b1c18/raw/2adc3f63677d81644e00245cee891eee88907767/gistfile1.md)

This is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: `10`

### Features
![demo](./demo/recording.gif)
#### Required

- [X] User can sign in using OAuth login flow
- [X] User can view last 20 tweets from their home timeline
- [X] The current signed in user will be persisted across restarts
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.  In other words, design the custom cell with the proper Auto Layout settings.  You will also need to augment the model classes.
- [X] User can pull to refresh
- [X] User can compose a new tweet by tapping on a compose button.
- [X] User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [X] User can retweet, favorite, and reply to the tweet directly from the timeline feed.

#### Optional

- [ ] When composing, you should have a countdown in the upper right for the tweet limit.
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] Retweeting and favoriting should increment the retweet and favorite count.
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
- [ ] Replies should be prefixed with the username and the reply_id should be set when posting the tweet,
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.

### Walkthrough
- [(Twitter OAuth 1.0a Walkthrough)](https://vimeo.com/107373841)[swift](https://vimeo.com/107295686)This walkthrough takes you through the OAuth 1.0a authentication flow. At the end of this video, you'll be able to download tweets.
- [(User Persistence and Session Events)](https://vimeo.com/107378059) [(Swift)](https://vimeo.com/107319225). This walkthrough shows you a pattern for saving the current user as well as firing and handling session events like signing in and signing out.

### Guides and Reference
- [Pull to refresh guide](https://guides.codepath.com/ios/Table-View-Guide#implementing-pull-to-refresh-with-uirefreshcontrol)
- [Basic Network Programming Guide](https://guides.codepath.com/ios/Network-Programming)
- Free iOS icons: http://www.glyphish.com/(http://www.glyphish.com/)
- [Official Twitter icons](https://dev.twitter.com/overview/general/image-resources)

