# Social Media Monitoring Instructions for Comet

**Purpose:** Monitor launch posts for Warp Documentation Automation across Hacker News, Twitter/X, and Reddit, then aggregate and report back.

---

## 🎯 What to Monitor

### 1. Hacker News (Show HN)
- **Search for:** "Warp Documentation Automation"
- **URL to check:** https://news.ycombinator.com/newest
- **Look for:**
  - Post title containing "Warp Documentation" or "AI-driven documentation"
  - Posted by: bryankaufman
  - Check: upvotes, comments, ranking

### 2. Twitter/X
- **Search for:** Posts by @[bryan's_twitter_handle] about "Warp Documentation"
- **URL to check:** https://twitter.com/search?q=warp%20documentation%20automation
- **Look for:**
  - Thread starting with launch announcement
  - Replies, retweets, likes, quotes
  - Hashtags: #WarpDev #AItools #DevTools

### 3. Reddit
- **Subreddits to check:**
  - r/programming - https://www.reddit.com/r/programming/new/
  - r/devtools - https://www.reddit.com/r/devtools/new/
  - r/productivity - https://www.reddit.com/r/productivity/new/
- **Search for:** "Warp Documentation Automation" OR "AI-driven documentation"
- **Posted by:** bryankaufman (verify username)
- **Look for:**
  - Post karma (upvotes)
  - Number of comments
  - Comment sentiment

---

## 📊 Information to Collect

For **each platform**, gather:

1. **Post Status:**
   - Posted? (Yes/No)
   - URL of post
   - Timestamp

2. **Engagement Metrics:**
   - Upvotes/Likes/Karma
   - Comments/Replies
   - Shares/Retweets

3. **Top Comments/Replies:**
   - First 3-5 most upvoted comments
   - Any questions needing response
   - Sentiment (positive/negative/neutral)

4. **Keywords Mentioned:**
   - Specific features people discuss
   - Concerns or criticisms
   - Feature requests

---

## 🔄 Reporting Format

**Use this template when reporting back:**

```markdown
# Social Media Monitoring Report
**Generated:** [timestamp]

## Summary
- Total Engagement: [number]
- Platforms Active: [HN/Twitter/Reddit]
- Response Needed: [Yes/No]

## Hacker News
- Post URL: [link]
- Points: [number]
- Comments: [number]
- Current Rank: [if visible]
- Top Questions: [list]

## Twitter/X
- Thread URL: [link]
- Likes: [number]
- Retweets: [number]
- Replies: [number]
- Notable Mentions: [list]

## Reddit
### r/programming
- Post URL: [link]
- Karma: [number]
- Comments: [number]
- Trending: [Yes/No]

### r/devtools
- [same format]

### r/productivity
- [same format]

## 🚨 Action Items
1. [Question from user X on HN needs response]
2. [Criticism about Y on Reddit - consider addressing]
3. [Feature request Z - document for future]
```

---

## 🛠️ Tools to Use

**Browser-based (what you have):**
- Safari tabs for each platform
- Manual refresh every 30-60 minutes
- Copy/paste engagement metrics
- Screenshot if needed

**Optional (if available):**
- RSS readers for HN/Reddit
- Twitter Lists for tracking mentions
- Browser extensions like "Distill Web Monitor"

---

## ⏰ Monitoring Schedule

**First 6 Hours (Critical):**
- Check every 30 minutes
- Quick response to first comments

**6-24 Hours:**
- Check every 2 hours
- Monitor for trending/hot status

**24-48 Hours:**
- Check every 6 hours
- Look for cross-posting or secondary discussion

---

## 🎯 Priority Questions to Flag

If you see these, **immediately notify Bryan:**

1. "How does this compare to [competitor]?"
2. "Can this work with [tool/framework]?"
3. "What about [security/privacy concern]?"
4. "I tried it and got [error]"
5. "Is there a [missing feature]?"

---

## 📝 Notes

- **Be patient:** Engagement can take 2-6 hours to ramp up
- **Weekend effect:** Posts may trend slower on Friday/Saturday
- **HN timing:** Peak engagement is weekday mornings (8-11am PT)
- **Reddit:** r/programming is strictest, may remove if seen as self-promotion

---

**This monitoring helps catch early questions, gauge interest, and identify what resonates with the community.**
