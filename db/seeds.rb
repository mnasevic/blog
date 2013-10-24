user_raw_params = {
  email: "mnasevic@gmail.com",
  avatar: File.open('db/resources/avatar.jpg'),
  password: "password",
  password_confirmation: "password_confirmation",
  name: "Milan Nasevic",
  job_title: "Software developer",
  linkedin_url: "https://www.linkedin.com/in/milannasevic",
  about_info: "Ruby, Ruby on Rails, HTML5, Git, Vim, CSS3, Sass, Compass, JQuery, JavaScript, Backbone.js, Coffeescript...",
  github_url: "https://github.com/mnasevic",
  project_info: '<div class="project"><a href="https://github.com/mnasevic/acSelect"  target="_blank"> acSelect</a>
   - Custom select box replacement (jQuery plugin)</div><div class="project"><a href="https://github.com/mnasevic/blog" target="_blank">Blog</a> - Personal blog (simple Rails 4 application)</div>'
}
user_params = ActionController::Parameters.new(user_raw_params)
user = User.create(user_params.permit!) # To whitelist an entire hash of parameter (permit!)

post_raw_params = {
  user_id: user.id,
  title: "acSelect - Select box replacement",
  content: '<p>Recently I needed to find a component that will replace the typical HTML select element and improve the user’s UI/UX. I have decided to use select2 <a href="http://ivaynberg.github.io/select2" title="Select2 - jQuery based replacement for select boxes" target="_blank">Select2</a> (jQuery based replacement for select boxes; it supports searching, remote data sets, and infinite scrolling of results). The component itself is great but a little complicated and it makes the customization of HTML and CSS not that simple. Having this on mind, soon I\'ve decided to replace select2 and create a simple plugin which contains some of the basic structure and functionality as the select2 plugin.</p>

<p>The use case behind this was that I wanted to implement a component that enables searching through a list of items and allows they to be selected (in my case it was about videos that I wanted to put in my collection). With every character typed in the input field, a list of sorted results that contains the inputted term will appear. When a certain result is selected, it is added to the list of selected results and therefore it is removed from the list of possible results.</p>

<p>I’ve named it <strong>acSelect.js</strong> (because the searching and the selecting is done with the jQuery <strong>AutoComplete</strong> widget) and it is available at my <a href="https://github.com/mnasevic" title="Milan Nasevic github" target="_blank">github account</a>. It’s the first version and I\'ll keep improving it.</p>
<p><strong>How to use acSelect?</strong></p>
<p>The structure is quite simple. You just need to add <strong>select</strong> or <strong>input</strong> element with a <strong>unique id</strong> and it''s parent should have <strong>"ac-select-container"</strong> class.</p>

<p><strong>1. Select element example</strong><p>
<pre class="brush: xml">
<!-- HTML - simple select, only with title -->
<div class="ac-select-container short">
  <select multiple="multiple" name="collection[video_ids][]" id="collection1" class="hidden">
    <option value="1">Flight</option>
    <option value="2">Argo</option>
    <option value="3">Life of Pi</option>
    <option value="4">The Hobit</option>
    <option value="5">Ted</option>
    <option value="6">Madagascar 3</option>
    <option value="7">Linkoln</option>
    <option value="8">The Croods</option>
  </select>
</div>

<!-- HTML - advanced select with title and image (through data attribute) -->
<div class="ac-select-container short">
  <select multiple="multiple" name="collection[video_ids][]" id="collection2" class="hidden">
    <option data-image="images/flight.jpg" value="1">Flight</option>
    <option data-image="images/argo.jpg" value="2">Argo</option>
    <option data-image="images/life_of_pi.jpg" value="3">Life of Pi</option>
    <option data-image="images/the_hobit.jpg" value="4">The Hobit</option>
    <option data-image="images/ted.jpg" selected="selected" value="5">Ted</option>
    <option data-image="images/madagaskar.jpg" value="6">Madagascar 3</option>
    <option data-image="images/lincoln.jpg" value="7">Lincoln</option>
    <option data-image="images/the_croods.jpg" value="8">The Croods</option>
  </select>
</div>
</pre>

<p>To initialize the plugin with default options, is as simple as this:</p>
<pre class="brush: js">
$(function() {
  $("#collection1").acSelect();
  $("#collection2").acSelect();
});
</pre>
<br>
<p><strong>2. Input element example </strong> (data send through acSelectData and acPreSelectData options)<p>
<pre class="brush: xml">
<!-- HTML - input select -->
<div class="ac-select-container short">
  <input type="text" placeholder="Search any term..." id="collection3">
</div>
</pre>

<p>To initialize the plugin with options:</p>
<pre class="brush: js">
$(function() {
  var selectData = [
    {id: 1, title: "Flight", thumbnail: "images/flight.jpg"},
    {id: 2, title: "Argo", thumbnail: "images/argo.jpg"},
    {id: 3, title: "Life of Pi", thumbnail: "images/life_of_pi.jpg"},
    {id: 4, title: "The Hobbit", thumbnail: "images/the_hobbit.jpg"},
    {id: 6, title: "Madagascar 3", thumbnail: "images/madagaskar.jpg"},
    {id: 7, title: "Lincoln", thumbnail: "images/lincoln.jpg"},
    {id: 8, title: "The Croods", thumbnail: "images/the_croods.jpg"}
  ];

  var preselectData = [
    {id: 5, title: "Ted", thumbnail: "images/ted.jpg"}
  ];

  $("#collection3").acSelect({
      acLabel: "title",
      acImage: "thumbnail",
      acSelectData: selectData,
      acPreSelectData: preselectData
  });
});
</pre>

<p>Check this <a href="https://github.com/mnasevic/acSelect" title="acSelect - github repository" target="_blank">github repository</a> to see complete version of the code and <a href="/acSelect/example.html" title="acSelect demo">click here</a> to see how it works.</p>',

  published_at: Time.now,
  is_publish: true
}
post_params = ActionController::Parameters.new(post_raw_params)
post = Post.create(post_params.permit!) # To whitelist an entire hash of parameter (permit!)
