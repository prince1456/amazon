# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



<h1> Update product</h1>
<%= @product.errors.full_messages.join(",") %>
<%= form_for @product do |f| %>
<div class="form-group row">
<%= f.label(:title, class: "col-xs-2 col-form-label") %>
<div class=" col-xs-10">
<%= f.text_field :title %>
</div>
</div>
<div>
<div class="form-group row">
 <%= f.label(:description, class: "col-xs-2 col-form-label") %>
 <div class=" col-xs-10">
 <%= f.text_area :description %>
 </div>
</div>
<div class="form-group row">
 <%= f.label(:price, class: "col-xs-2 col-form-label") %>
 <div class=" col-xs-10">
 <%= f.text_field :price %>
 </div>
</div>


<%= f.submit ("Update Now"), {class: "btn btn-info btn-lg"} %>

<% end %>
