# Vyrona Firestore Architecture

## Collections

users/
posts/
pulse/
stories/
messages/
groups/
calls/
notifications/
followers/
following/
likes/
comments/
saved/
wallet/
creator_profiles/
reports/
hashtags/
search_history/
app_settings/

---

## Users

uid
username
display_name
bio
photo_url
verified
creator
followers
following
posts
joined_at
last_seen

---

## Posts

post_id
owner_uid
caption
media_url
media_type
likes
comments
shares
created_at

---

## Pulse

pulse_id
owner_uid
video_url
thumbnail
views
likes
comments
shares
created_at

---

## Messages

chat_id
sender_uid
receiver_uid
message
type
seen
created_at

---

## Notifications

notification_id
receiver_uid
type
title
body
created_at
read

