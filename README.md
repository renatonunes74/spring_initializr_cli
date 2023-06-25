<div align="center">
<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/renatonunes74/spring_initializr_cli.svg?style=for-the-badge">
<img alt="Repository size" src="https://img.shields.io/github/repo-size/renatonunes74/spring_initializr_cli.svg?style=for-the-badge">
<a href="https://github.com/renatonunes74/spring_initializr_cli/commits/master">
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/renatonunes74/spring_initializr_cli.svg?style=for-the-badge">
<a href="https://github.com/renatonunes74/spring_initializr_cli/issues">
<img alt="Repository issues" src="https://img.shields.io/github/issues/rockofox/firefox-minima.svg?style=for-the-badge">
</a>
<img alt="GitHub" src="https://img.shields.io/github/license/renatonunes74/spring_initializr_cli?style=for-the-badge">
<h1>Spring Initializr CLI</h1>
<h4>A simple menu for Spring with FZF<br>Code based on: <a href="https://github.com/themkat/spring-starter-terminal">Spring Starter Terminal by themkat</a></h4>
<a href="https://spring_initializr_cli/pages/sobre/">Preview</a> -
<a href="https://spring_initializr_cli/pages/sobre/">installation</a> -
<a href="https://spring_initializr_cli/pages/sobre/">Dependencies</a> -
<a href="https://spring_initializr_cli/pages/sobre/">Tricks</a>
<br>
<br>
<div align="left">

## Preview
![](https://github.com/renatonunes74/spring_initializr_cli/blob/master/output.gif)

## Installation
- Clone repo
	- `git clone https://github.com/renatonunes74/spring_initializr_cli`
- Execute script
	- `cd spring_initializr_cli`
	- `chmod +x spring_cli.sh`
	- `./spring_cli.sh`
### Dependencies
- SHELL (BASH / ZSH...)
- Standart packages (curl, sed...)
- FZF
- jq
### Tricks
- Are possible set new default variables in menu 
	- Edit the script `vim ./spring_cli.sh`
	- Set variable
		- Example
			```
			#NAME=$(echo $METADATA | jq -r '.name.default')
			NAME=$(echo "newName")
			```
