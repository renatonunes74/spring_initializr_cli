<div align="center">
	
![GitHub top language"](https://img.shields.io/github/languages/top/renatonunes74/spring_initializr_cli.svg?style=for-the-badge)
![Repository size"](https://img.shields.io/github/repo-size/renatonunes74/spring_initializr_cli.svg?style=for-the-badge)
![GitHub last commit"](https://img.shields.io/github/last-commit/renatonunes74/spring_initializr_cli.svg?style=for-the-badge)
![Repository issues"](https://img.shields.io/github/issues/rockofox/firefox-minima.svg?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/renatonunes74/spring_initializr_cli?style=for-the-badge)
# Spring Initializr CLI
**A simple menu for Spring with [FZF](https://github.com/junegunn/fzf)<br>Code based on: [Spring Starter Terminal by themkat](https://github.com/themkat/spring-starter-terminal)**

[Preview](#preview) -
[Installation](#installation) -
[Dependencies](#dependencies) -
[Tricks](#tricks)
<br>
<br>
</div>

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
    - For working program
- Standart packages (curl, sed...)
    - For requests and output handling
- [FZF](https://github.com/junegunn/fzf)
    - Fuzzy finder
- [Jq](https://github.com/jqlang/jq)
    - JSON processor
### Tricks
- Are possible set new default variables in menu 
	- Edit the script `vim ./spring_cli.sh`
	- Set variable
		- Example
			```
			#NAME=$(echo $METADATA | jq -r '.name.default')
			NAME=$(echo "newName")
			```
