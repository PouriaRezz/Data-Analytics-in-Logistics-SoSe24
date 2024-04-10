# Data-Analytics-in-Logistics-SoSe24
---

# Git and GitHub Basic Tutorial

This tutorial will guide you through the process of setting up Git and GitHub for version control and collaboration on a project. We will cover creating a GitHub account, installing Git, generating an SSH key, adding the key to your GitHub account, cloning a repository, working with branches, resolving issues, and pushing changes to GitHub.

## 1. Create a GitHub Account

To begin, you need to create a free account on GitHub. Visit [github.com](https://github.com/) and sign up by providing your email address, username, and password.

## 2. Install Git on Your System

### For Linux:

If you're using a Linux distribution, you can install Git through your package manager. Open a terminal and execute the following commands:

For Debian/Ubuntu-based distributions:
```bash
sudo apt update
sudo apt install git

# to check if git correctly installed check the version
git --version

# The output should be like this : git version 2.43.2
 
# configure git in your system
git config --global user.email "youremail@emaildomain.com"
git config --global user.name "your username"

# to verify your username and e-maill
git config -l
```
## 3. Generate an SSH Key and add it to GitHub

Please follow this tutorial to create your ssh key and add it to your github account [tutorial](https://kinsta.com/blog/generate-ssh-key/)


## 4. Clone This Repository
Clone the repository. for this navigate to the folder you want to work. open your terminal there and write this command in your terminal:

```bash
git clone git@github.com:PouriaRezz/Data-Analytics-in-Logistics-SoSe24.git 
```

## 5. Checkout to Your Branch
Each group has its own branch (gruppe1, gruppe2, gruppe3). Switch to your group's branch using:

```bash
git checkout <branch_name>
# for exmaple: git checkout gruppe1
```

## 6. Work on Your Assignment
you can find your task [hier](https://github.com/PouriaRezz/Data-Analytics-in-Logistics-SoSe24/issues).
work on the assigned tasks locally in your cloned repository.

## 7. Add Your Changes with Git
Once you've made changes to your files, add them to the staging area using:

```bash
git add .
```
## 8. Commit Your Changes with Git
Commit your changes to the repository with a descriptive message using:
```bash
git commit -m "Your descriptive commit message here"

```

## 9. Push Your Changes and Create a Pull Request

Finally, push your changes to GitHub and create a pull request (PR) for review using:

```bash
git push origin <branch_name>
# for example: git push origin gruppe1
```
After pushing, go to the repository on GitHub, and you'll see an option to create a pull request. Click on it, fill out the details, and submit your PR for review.
