<a name="readme-top"></a>

<div align="center">
  <h1><b>Recipe App</b></h1>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 The Recipe App <a name="about-project"></a>

 **Recipe App** is an app build on ruby using rails framework that allows users to manage the recipes, ingredients ...etc. It enables ou to save ingredients, monitor the stock and generate a shopping list based on what you need to complete a recipe...

 the app uses authentication

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

This project was implemented using:

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://reactjs.org/">React.js</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Create new recipes and generate a shopping list**
- **Persist recipe data to database**
- **Persist stock ingredients data to database**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps:

### Prerequisites

In order to run this project you need to have installed:

- [ ] You’ll need to have Ruby and Rails on your machine.

Optionally, in order to modify this project you should to have installed:

- [ ] Git.

- [ ] Code editor like: [Visual Studio code](https://code.visualstudio.com/), or others...

### Setup

To clone this repository to your desired folder:

```console
git clone https://github.com/chiztechnology/rails-capstone-project.git
```

- Access the cloned directory with:

```console
cd rails-capstone-project
```

- Open it with your favorite code editor or with the live server

### Usage

It is require that you setup your database to run this project, check the config/database.yml and make sure that the username and password match you postgresql setup, then run:

```console
rails db:create
```

```console
rails db:migrate
```

To run the project, execute the following command in the project directory:

```console
rails server
```

To run test, execute the following commands in the project directory.

To run the unit tests:

  ```console
  rspec ./spec/models 
  ```
To run the integration tests:

  ```console
  rspec ./spec/views
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Author <a name="authors"></a>

👤 **Israel CHIZUNGU**

- GitHub: [chiztechnology](https://github.com/chiztechnology)
- Twitter: [IsraelChizungu](https://twitter.com/IsraelChizungu)
- LinkedIn: [IsraelChizungu](https://www.linkedin.com/in/israelchizungu/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

We will implement this on the future:

- [ ] **Improve the addition of new recipes**
- [ ] **Improve the shoppin list feature**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/HunterX-7/Recipe-App/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>



<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)
