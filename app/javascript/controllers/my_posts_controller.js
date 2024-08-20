import { Controller } from "@hotwired/stimulus";
import { getMyPostsUrl } from "../constants";

// Connects to data-controller="my-posts"
export default class extends Controller {
  static targets = ["posts", "userId"];

  connect() {
    const apiUrl = "http://localhost:3000/api/posts.json?user_id=" + this.userIdTarget.value;
    const userId = this.userIdTarget.value;

    fetch(getMyPostsUrl(userId))
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then(data => {
        this.postsTarget.innerHTML = data.html;
      })
      .catch(error => {
        console.error("There was a problem with the fetch operation:", error);
      });
  }
/*
  edit(event) {
    const postId = event.currentTarget.getAttribute("data-post-id");
    console.log(postId)
    const apiUrl = "http://localhost:3000/api/posts/" + postId + ".json";

    fetch(apiUrl, {method: "PATCH",})
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      this.postsTarget.innerHTML = data.html;
    })
    .catch(error => {
      console.error("There was a problem with the fetch operation:", error);
    });
  }
  */

  delete(event) {
    const postId = event.currentTarget.getAttribute("data-post-id");
    console.log(postId)
  }

}
