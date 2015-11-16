# Overall Assessment

##### Grade: C

##### Comments:

Jordan,

Overall, most of the pieces are there. I think you're coming along well, and there seems to be some good stuff here.

Here are a few comments regarding the code:

1. In your posts controller you have user_id as a parameter. You are passing that value as a hidden field input, and that is not usually how this is done. Usually, the user is identified via the url. This is why nested resources is such a good idea:

```ruby
resources :users do
	resources :posts
end
```

This sets up posts to be dependent on users.

2. Your routes file could use a little work. You don't have nested resources, and you also have this line:

```ruby
get "posts/login" => "posts#login"
```

Seems to be left over from something else you were trying, but you shouldn't have login functionality in a posts controller.

3. The functionality is in place in the controllers, but I don't see anything presented on the view side for the posts.

4. Check the way you are passing the user_id to ActiveRecord via the hidden field. It is not getting saved because of the way it is formatted.

5. As a stylistic piece, partials are not generally rendered within loops as you did here:

```ruby
<% @posts.each do |a_post| %>
	<% @a_post = a_post %>
	<%= render "blurb" %>
<% end %>
```

Calling multiple renders on the same template while overwriting instance variables is not performant and may throw errors. Logic like this belongs in the view itself.

6. You have an unused Users controller that can be destroyed. You don't need it because Devise handles the user logic for you.