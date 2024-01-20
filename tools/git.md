# .git directory
.git
    `git add, git rm`     ->      index         (staging)
    `git commit`          ->      objects       (staged)


# git diff
git diff:               working     vs  staging
git diff --staged:      staging     vs  staged
git diff HEAD:          working     vs  staged

## git diff
Compare working tree vs staging

**Example**
Staging
`git add file1`

Change working tree
`echo abc >> file1`

Working vs staging
`git diff`
abc


## git diff --staged
Compare staging and staged

**Example**
Staged
`git add file1; git commit -m update`

Staging
`echo abc >> file1; git add file1`

Staging vs staged
`git diff --staged`
abc


## git diff HEAD
Compare working tree vs staged

**Example**
Staged
`git add file1; git commit -m update`

Staging
`echo 1 > file1; git add file1`

Working
`echo 2 >> file1`

Working vs staging
git diff
2

Staging vs staged
git diff --staged
1

Working vs staged
`git diff HEAD`
1
2


# Branch
A branch is a named pointer to a commit.

master:     /refs/head/master       : local master
origin/master                       : remote master


# HEAD
HEAD points to the current branch:
- git commit updates the current branch
- git checkout sets the current branch


# git stash
Backup the working tree.

**Move working tree to another branch**
`git stash`
`git checkout other_branch`
`git stash pop`


# git reset
soft:   keep working,   keep stagging
mixed:  keep working,   reset stagging
hard:   reset working,  reset stagging

**Example**
Staging
`echo a >> hello; git add data`

Working
`echo b >> data`

# Soft
`git reset --soft HEAD`
    -> keep working, keep staging

## Mixed
`git reset --mixed HEAD`
    -> keep working:    keep b in data file
    -> reset stagging:  unstaged data file

`git diff`  // working vs staging
data:
    +a      // 'a' at here, because data file unstaged, and become working
    +b      // working

## Hard

