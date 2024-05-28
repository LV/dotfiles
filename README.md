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

### Working with existing submodules
If you're trying to modify the submodules and want its changes to reflect accordingly to their repository, do the following:

1. Configure settings
```sh
cd path/to/submodule
git checkout master
git config submodule.<submodule-name>.url <submodule-repo-url>
git config submodule.<submodule-name>.branch <branch-name>
```

2. Commit changes in the submodule:
```sh
cd path/to/submodule
git add .
git commit -m "Commit message"
git push origin <branch-name>
```

3. (TEST IF NECESSARY DUE TO GITHUB ACTIONS) Update the _dotfiles_ repo:
```sh
cd path/to/dotfiles
git add path/to/submodule
git commit -m "Update submodule <submodule-name> to latest commit"
git push origin master
```

### Adding submodules
If you're trying to add a new config to the _dotfiles_:

1. Create a non-empty repo in Github (Add a README upon creation)

2. Add the submodule:
```sh
cd path/to/dotfiles
git submodule add <submodule-repo-url> <path/to/submodule>
```

Example:
```sh
cd path/to/dotfiles
git submodule add git@github.com:LV/example.git example
```

3. Initialize and update the submodule
```sh
git submodule update --init --recursive
```

4. Commit the submodule
```sh
git add .gitmodules example
git commit -m "Add new submodule \`example\`"
git push origin master
```

5. Set up branch tracking (to avoid detached HEAD):
```sh
cd dotfiles/example
git checkout master
git config submodule.example.url <submodule-repo-url>
git config submodule.example.branch master
```

### `fatal: 'example' already exists in the index`
1. Check (and remove) existing entries:
```sh
cd path/to/dotfiles
cat .gitmodules
```

If an entry such as the following shows up, remove it:
```toml
[submodule "example"]
    path = example
    url = git@github.com:LV/example-config.git
```

2. Remove the submodule
```sh
cd path/to/dotfiles
git submodule deinit -f example
rm -rf .git/modules/example
rm -rf example
git rm -r --cached example
```
