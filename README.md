# <div style="text-align:center;"><img src="https://github.com/TinQk/melomaniacs/blob/development/app/assets/images/logo-column.png" alt="MELOMANIACS" width="450"/></div>

Melomaniacs is an app designed for music-lovers. You can access an extensive database of artists, give your opinion on them and discover new artists curated for you, everyday.

###

## 🎹 TEAM  
This app was created as a final project for Ruby on rails bootcamp, The Hacking Project. Just like all good RPGs, the team behind this masterpiece has its **Front-end-Fighter** ([Marie-Charlotte Le Morvan](https://github.com/Spelmo)), **DB-Wizard** ([Quentin Potié](https://github.com/TinQk)), **Front-end-Cleric** ([Andrea Palma](https://github.com/AndreaPlm)) and **API-Thief** ([Charles Belpois](https://github.com/charles-mahaco)).

## 🎶 UNDER THE HOOD
This app is more complex than it seems. Here are all the things you'll find among this messy code.
* **A government-level data scrapper:** scrapping Genres and Artists from Everynoise.com, and popularity levels from Spotify (in `services`)
* **The most beautiful postgresql database ever seen**, with links everywhere (`db.schema.rb` to check it out)
* **An incredibly skillful use of Spotify API:** aren't those pics and recommendation lists the absolute best? (in view `artist#show` for example)
* To browse our database, **a functional Algolia search bar**, no need to say more, you're already impressed (in view `home#index`)
* And **a home made stunning front**, because we love making it harder for ourselves (mostly in `assets/stylesheets`).

## 🎼 FEATURES
* User sign up, log in, password retrieval, confirmation emails...
* Research by Artists and by Genres.
* Like and comment artists to get tailored recomendations in your profile page.
* For each artist, browse their albums, similar artists or related genres.
* Discover top 10 most liked artists on melomaniacs and last comments at a glance.

## 💿 HOW TO USE
* Access the production version of this app here: *Spoiler alert: It looks like a million bucks*<br>
🔥🔥 http://herokuapp.com/  🔥🔥

* If you want to run it locally, `$ git clone` this repository, `bundle install`, `rails db:create`, `rails db:migrate` and run the db scrapper `Rails.new.perform` in your console. All that's left is running your server with `rails server`. You can then access it on localhost:3000 with your web browser.
 
