# V-Git
## V Interface for Git

### Clone
| Method | use |
|-|-|
|`.clone(repository string)`| Clones a `repository` in current folder |
|`.clone_to(repository string, dir string)`| Clones a `repository` into a specific `directory` |
|`.clone_with_options(repository string, dir string, options string)` | Clones a `repository` into a specific `directory` with additional `options` 
|`.init()` | Creates a Git repository |
|`.init_bare()` | Creates a bare Git repository |
|`.init_with_options(options string)`| Create a Git repository with additional `options` |
|`.add(file string)`| Adds a `file` to Git source control |
|`.add_multiple(files []string)`| Adds `files` to Git source control |
|`.mv(from string, to string)`| Moves or rename a `from` file `to` a destination |
|`.rm(file string)`| Removes a `file` from Git source control |
|`.rm_multiple(files []string)`| Remove `files` from Git source control |
|`.rm_keep_local(file string)`| Remove a `file` from Git source control but keep the `file` locally |
|`.rm_multiple_keep_local(files []string)`| Remove `files` from Git source control but keep the `files` locally |
|`.diff()`| *Not yet implemented* |
|`.log()`| *Not yet implemented* |
|`.show()`| *Not yet implemented* |
|`.status()`| *Not yet implemented* |
|`.branch(options string)`| Use branch command with `options` |
|`.branch_delete(branch string)`| Delete a `branch` |
|`.commit(message string)`| Commit a change with a `message` |
|`.commit_with_files(message string, files []string)`| Commit changes to `files` with a `message` |
|`.fetch()`| Update refs from remote repository |
|`.fetch_from(remote string, branch string)`| Update refs from specific `remote` repository and `branch` |
|`.pull()`| Pulls updates into local branch |
|`.pull_from(remote string, branch string)`| Pulls updates from specific `remote` repository and `branch` into local branch |
|`.pull_with_options(remote string, branch string, options string)` | Pulls updates from specific `remote` repository and `branch` into local branch with additional `options` | 
|`.push()`| Pushes local commits to remote repository |
|`.push_to(remote string, branch string)`| Pushes local commits to specific `remote` repository and `branch` |
|`.push_set_upstream(remote string, branch string)`| Pushes local branch to `remote` repository and `branch` |
|`.push_with_options(remote string, branch string, options string)` | Pushes local commits to specific `remote` repository and `branch` with additional `options` |
|`.remote_add(name string, repository string)`| Adds a new remote named `name` from a remote `repository` |
|`.remote_add_with_options(name string, repository string, options string)` | Adds a new remote named `name` from a remote `repository` with additional `options` |
|`.remote_remove(name string)`| Removes a named `name` remote |
