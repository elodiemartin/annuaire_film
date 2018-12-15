# Annuaire films

Movie directory with SCSS, Boostrap, Javascript, PHP, Twig, MySql

## Demo

Do you want to see the website? Visit http://elodie-martin.com/annuaire_film

## Installation

1. Make sure you have these installed

* Node.js
* Ruby

2. Clone this repository in your local machine with the terminal
```
git clone URL
```

3. Install Twig with Composer:
```
composer install
```

4. Install Bootstrap in your Node.js powered apps with the npm package:
```
npm install bootstrap
```

5. Install Yarn:
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

```
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

```
sudo apt-get update && sudo apt-get install yarn
```

To verify that Yarn installed successfully:
```
yarn --version
```


6. Import the database and change the information for the connection in models/connect_bdd.php

7. Change the base link in head in the file view/home_view.twig
