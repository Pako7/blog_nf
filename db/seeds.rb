return unless Rails.env.development?

u = User.find_or_create_by!(email: "user@example.com") do |user|
  user.name = "User 1"
  user.password = "123123"
  user.password_confirmation = "123123"
end

Post.find_or_create_by!(user: u, title: 'Post 1') do |post|
  post.user = u
  post.title = "Post 1"
  post.body = "sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset . t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
end

Post.find_or_create_by!(user: u, title: 'Post 2') do |post|
  post.user = u
  post.title = "Post 2"
  post.body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not, here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Int"
end

u2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.name = "User 3"
  user.password = "123123"
  user.password_confirmation = "123123"
end

Post.find_or_create_by!(user: u2, title: 'Post 3') do |post|
  post.user = u2
  post.title = "Post 3"
  post.body = "sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset . t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
end

Post.find_or_create_by!(user: u2, title: 'Where can I get some?') do |post|
  post.user = u2
  post.title = "Where can I get some?"
  post.body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not, here are many variations of passages of Lorem Ipsum available, but the mad tointing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambl"
end

Post.find_or_create_by!(user: u2, title: 'Where does it come from?') do |post|
  post.user = u2
  post.title = "Where does it come from?"
  post.body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"
end