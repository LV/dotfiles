# Dotfiles
_My personal dotfile configuration_

## Getting Started
1. Clone the repository:
```sh
git clone https://github.com/LV/dotfiles.git
```

2. Initialize submodules:
```sh
git submodule update --init --recursive
```

### Working with submodules
If you're trying to modify the submodules and want its changes to reflect accordingly to their repository, do the following:

1. Configure settings
```sh
cd path/to/submodule
git checkout master
git config submodule.<submodule-name>.url <submodule-repo-url>
git config submodule.<submodule-name>.branch <branch-name>
cd -
```

2. Commit changes in the submodule:
```sh
cd path/to/submodule
git add .
git commit -m "Commit message"
git push origin <branch-name>
cd -
```

3. (TEST IF NECESSARY DUE TO GITHUB ACTIONS) Update the _dotfiles_ repo:
```sh
git add path/to/submodule
git commit -m "Update submodule <submodule-name> to latest commit"
git push origin master
```
