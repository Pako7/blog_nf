const baseUrl = "http://localhost:3000/api/";
export const createPostUrl = baseUrl + "posts.json";
export const allPostsUrl = baseUrl + "posts.json";

export function getPostUrl(postId) {
  return baseUrl + "posts/" + postId + ".json";
}

export function getMyPostsUrl(userId) {
  return baseUrl + "posts.json?user_id=" + userId;
}