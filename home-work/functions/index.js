const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
exports.onCreateFollower=functions.firestore
.document("/followers/{userId}/userFollowers/{followerId}")
.onCreate((snapshot,context)=>{
    const userId=context.params.userId;
    const followerId=context.params.followerId;
    //Get followed users posts
    const followedUserPostsRef = admin
    .firestore()
    .collection('posts')
    .doc(userId)
    .collection('userPosts');
    // 2) Get following
    const timelinePostsRef= admin
    .firestore()
    .collection('timeline')
    .doc(followerId)
    .collection('timelinePosts');
})
