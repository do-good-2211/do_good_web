<!-- ReadMe -->
<a id="readme-top"></a>

<!-- Opening -->
<br />
<div align="center">
  <a href="https://github.com/do-good-2211/do_good_api">
    <img src=".github/do_good.jpg" alt="Logo" width="150" height="150">
  </a>

<h3 align="center">Welcome to Do Good</h3>
  <p align="center">
    Find the GOOD in the world.
    <hr>
    With the constant bombardment of negative news, it's easy to think there is no good left in the world. Do Good aims to increase the good by connecting people with opportunities to complete random acts of kindness in an approachable and fun way.
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#testing">Testing</a></li>
        <li><a href="#wire_frames">Wire Frames</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contributors</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

   ☀️ [Production Website](https://cryptic-fortress-66693.herokuapp.com/)
   <br>
   ☀️ [Backend Service](https://warm-temple-59633.herokuapp.com/)
   <br>
   ☀️ [Back End Repository](https://github.com/do-good-2211/do_good_api)

  **Do Good** was created by Back End students at Turing School of Software and Design as their [consultancy project](https://backend.turing.edu/module3/projects/consultancy/).

  The mission of **Do Good** is to provide users with convenient access to positivity and an opportunity to be part of the good in the world.

  Users simply click the "Find a Random Act of Kindness" button and are presented with 3 random acts to choose from. Once chosen, they schedule the "good deed" and it gets added to their dashboard. Users are able to invite others to join in on the fun as well as add it to their calendars because, let's be real, life can get hectic.

  For visitors who aren't ready to jump into completing an act, they can browse our library of kind act photos for the feel-goods.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Built With -->
### Built With

* ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **3.1.1**
* ![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **7.0.4**
* <img src=".github/rspec_badge.png" alt="Rspec Badge" height="30">
* ![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

If you'd like to demo this API on your local machine:
1. Ensure you have the prerequisites
2. Clone this repo ` git clone git@github.com:do-good-2211/do_good_web.git '
3. Navigate to the root folder `cd do_good_web`
4. Run `bundle install`
5. Run `rails db:{create,migrate}`
6. Inspect the `/db/schema.rb` and compare to the 'Schema' section below to ensure migration has been done successfully
7. Run `rails s`
8. Visit http://localhost:5000/

<!-- Prerequisites -->
### Prerequisites

- Ruby Version 3.1.1
- Rails Version 7.0.4.x
- Bundler Version 2.4.9

<!-- Testing -->
### Testing
To test the entire spec suite, run `bundle exec rspec`.
*All tests should be passing.*

Happy path, sad path, and edge testing were considered and tested. When a request cannot be completed, an error object is returned.

<details>
  <summary>Error Object</summary>
    <pre>
    <code>
{
  "errors": [
    {
      "status": "404"
      "title": "Invalid Request",
      "detail": [
        "Couldn't find User with 'id'=<id>"
         ]
     }
   ]
}
    </code>
  </pre>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Wire Frames -->
### Wire Frames

<details>
  <summary><code>Route: "/"</code></summary>
  Landing Page:
  <pre>
    <code>
      <img src=".github/1_wireframe_homepage.png" alt="Wire Frame" width="60%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/random_acts"</code></summary>
  Random Acts Page:
  <pre>
    <code>
      <img src=".github/2_wireframe_randomacts.png" alt="Wire Frame" width="60%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/login"</code></summary>
  Login/Register Page:
  <pre>
    <code>
      <img src=".github/3_wireframe_login.png" alt="Wire Frame" width="60%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/good_deeds/new"</code></summary>
  New Good Deed Form Page:
  <pre>
    <code>
      <img src=".github/4_wireframe_form.png" alt="Wire Frame" width="60%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/dashboard"</code></summary>
  User's Show Page:
  <pre>
    <code>
      <img src=".github/5_wireframe_mypage.png" alt="Wire Frame" width="60%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/good_deeds/:id/edit"</code></summary>
  Good Deed's Edit & Delete Page:
  <pre>
    <code>
      <img src=".github/6_wireframe_edit_delete.png" alt="Wire Frame" width="60%">
    </code>
  </pre>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
