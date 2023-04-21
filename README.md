<!-- ReadMe -->
<a id="readme-top"></a>

*README in progrss*

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
    <section>
      With the constant bombardment of negative news, it's easy to think there is no good left in the world. Do Good aims to increase the good by connecting people with opportunities to complete random acts of kindness in an approachable and fun way.
    </section>
  </p>
</div>
<hr>


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
        <li><a href="#technologies"> Technologies Used</a></li>
      </ul>
    </li>
    <li><a href="#refactor">Future Iterations</a></li>
    <li><a href="#contact">Contributors</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

   ☀️ [Production Website](https://cryptic-fortress-66693.herokuapp.com/)
   <br>
   ☀️ [Backend Service](https://warm-temple-59633.herokuapp.com/)
   <br>
   ☀️ [Backend Repository](https://github.com/do-good-2211/do_good_api)

   <!-- * [Video Presentation]() -->

  **Do Good** was created by Back End students at Turing School of Software and Design as their [consultancy project](https://backend.turing.edu/module3/projects/consultancy/).

  The mission of **Do Good** is to provide users with convenient access to positivity and an opportunity to be part of the good in the world.

  Users simply click the "Find a Random Act of Kindness" button and are presented with 3 random acts to choose from. Once chosen, they schedule the "good deed" and it gets added to their dashboard. Users are able to invite others to join in on the fun as well as add it to their calendars because, let's be real, life can get hectic.

  For visitors who aren't ready to jump into completing an act, they can browse our library of kind act photos for the feel-goods.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Built With -->
### Built With
<br>

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) 
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
<img src=".github/rspec_badge.png" alt="Rspec Badge" height="27">
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![AmazonAWS](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![GoogleCloud](https://img.shields.io/badge/Google_Cloud-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![CircleCI](https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

<hr>

## Getting Started
<hr>

If you'd like to demo this API on your local machine:
<br>

### Prerequisites
* Ensure you have the prerequisites

### Backend  Repository
* Clone the backend repo: `git clone git@github.com:do-good-2211/do_good_api.git`
* Navigate to the root folder: `cd do_good_api`
* Run: `bundle install`
* Run: `rails db:{create,migrate}`
* Inspect the `/db/schema.rb` and compare to the 'Schema' section below to ensure migration has been done successfully
* Run: `rails s`

### Frontend  Repository
* Clone this repo: `git clone git@github.com:do-good-2211/do_good_web.git`
* Navigate to the root folder: `cd do_good_web`
* Run: `bundle install`
* Run: `rails db:{create}`
* Visit http://localhost:5000/

<!-- Prerequisites -->
### Prerequisites

- Ruby Version 3.1.1
- Rails Version 7.0.4.x
- Bundler Version 2.4.9
<hr>

<!-- Testing -->
## Testing


To test the entire spec suite, run `bundle exec rspec`.
*All tests should be passing.*

Happy path, sad path, and edge testing were considered and tested. When a request cannot be completed, an error message is returned at the top of the page.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Wire Frames -->
### Wire Frames

<details>
  <summary><code>Route: "/"</code></summary>
  Landing Page:
  <pre>
    <code>
      <img src=".github/1_wireframe_homepage.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/random_acts"</code></summary>
  Random Acts Page:
  <pre>
    <code>
      <img src=".github/2_wireframe_randomacts.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/login"</code></summary>
  Login/Register Page: (Google login window will appear after link is clicked)
  <pre>
    <code>
      <img src=".github/3_wireframe_login.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/good_deeds/new"</code></summary>
  New Good Deed Form Page:
  <pre>
    <code>
      <img src=".github/4_wireframe_form.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/dashboard"</code></summary>
  User's Show Page:
  <pre>
    <code>
      <img src=".github/5_wireframe_mypage.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/good_deeds/:id/edit"</code></summary>
  Good Deed's Edit & Delete Page:
  <pre>
    <code>
      <img src=".github/6_wireframe_edit_delete.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- Technologies Used -->

### Technologies Used

[Google Cloud Platform](https://cloud.google.com/) was used to allow users to sign in with their Google account.

<details>
  <summary><img src="https://www.loginradius.com/blog/static/a9dad0fc4bf1af95243aa5e2d017bc22/a8669/google_cover.jpg" style="width:43px; height:33px;" > <strong>Google OAuth</strong></summary><br>
  <p>Signing in to the Do Good app is made simple by allowing users to sign in with google. </p>
  
  More information on the gem used for this(`omniauth-google-oauth2`) can be found [here](https://github.com/zquestz/omniauth-google-oauth2)
</details>
<br>

[Amazon Web Services](https://aws.amazon.com/) was used to allow users to upload photos for their completed good deeds.

<details>
  <summary><img src= "https://logos-world.net/wp-content/uploads/2021/08/Amazon-Web-Services-AWS-Logo.png" style="width:60px; height:40px;"><strong>Amazon S3 Cloud Object Storage</strong></summary><br>
  <p>By including amazon's web serfice for storage, we can allow users to upload their pictures which are then saved as objects in a "bucket".  </p>

  More information on the gem used for this(`aws-sdk-s3`) can be found [here](https://github.com/aws/aws-sdk-ruby)
</details>
<br>

[Google Calendar API](https://developers.google.com/calendar/api/guides/overview) was used to create a calendar event on the user's Google Calendar.

<details>
  <summary><img src="https://cdn.icon-icons.com/icons2/2631/PNG/512/google_calendar_new_logo_icon_159141.png" style="width:60px;height:60px;"><strong> Events</strong></summary><br>
    <p>Users can see their google calendar on their dashboard. Each of their good deeds will display on the dates they have a deed scheduled. </p>
</details>
<br>

[Tailwind CSS](https://tailwindcss.com/) was used for styling


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Future Iterations -->

<h2 id="refactor">Future Iterations</h2>
<!-- <li></li>
<li></li> -->
<details>
  <summary>Possible Features</summary>
    <dl>
      <dt>Idea 1</dt>
        <dd>- Stuff bit 1</dd>
        <dd>- Stuff bit 2</dd>
      <dt>Idea 2</dt>
        <dd>- Stuff bit 1</dd>
        <dd>- Stuff bit 2</dd>
      <dt>Upload Video/Multiple Media</dt>
        <dd>- Users can can upload both images and videos</dd>
        <dd>- Stuff bit 2</dd>
      <dt>Stories of Good</dt>
        <dd>- Users can share stories of good that happened to them</dd>
      <dt>Find good/opportunities</dt>
        <dd>- Users can find where to do good in their area</dd>
      <dt>Badges and points</dt>
        <dd>- Users can earn points and badges for their good deeds</dd>
      <dt>User Metrics</dt>
        <dd>- Users can see their own metrics</dd>
        <dd>- Users can see a library of their deed history</dd>
    </dl>
  
</details>



<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contributors

| [<img alt="Huy Phan" width="75" src=".github/Huy.png"/>](https://www.linkedin.com/in/huy-phan-2471b3261/) | [<img alt="Jasmine Hamou" width="75" src=".github/Jasmine.jpg"/>](https://www.linkedin.com/in/jasmine-hamou/) | [<img alt="Kara Jones-Hofmann" width="75" src=".github/Kara.jpeg"/>](https://www.linkedin.com/in/81012911-91208/) | [<img alt="Matt Enyeart" width="75" src=".github/Matt.jpeg"/>](https://www.linkedin.com/in/matt-enyeart/) | [<img alt="Melony Erin Franchini" width="75" src=".github/Mel.jpeg"/>](https://www.linkedin.com/in/melony-erin-franchini/) | [<img alt="Mike Dao" width="75" src=".github/Mike.jpeg"/>](https://www.linkedin.com/in/michaeldao/) |
| ------------------ | ------------ | -------------- | ----------- | -------------- | ----------- |
| Huy Phan | Jasmine Hamou | Kara Jones-Hofmann | Matt Enyeart | Melony Erin Franchini | Mike Dao |
| Collaborator | Collaborator | Collaborator | Collaborator | Collaborator | Project Manager |
| [GitHub](https://github.com/HuyPhan2025) | [GitHub](https://github.com/hamouj) | [GitHub](https://github.com/KaraJoHo) | [GitHub](https://github.com/menyeart) | [GitHub](https://github.com/MelTravelz) | [GitHub](https://github.com/mikedao) |
| [LinkedIn](https://www.linkedin.com/in/huy-phan-2471b3261/) |  [LinkedIn](https://www.linkedin.com/in/jasmine-hamou/) | [LinkedIn](https://www.linkedin.com/in/81012911-91208/) | [LinkedIn](https://www.linkedin.com/in/matt-enyeart/) | [LinkedIn](https://www.linkedin.com/in/melony-erin-franchini/) | [LinkedIn](https://www.linkedin.com/in/michaeldao/) |

<p align="right">(<a href="#readme-top">back to top</a>)</p>
