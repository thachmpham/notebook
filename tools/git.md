# .git directory
.git
    `git add, git rm`     ->      index         (staging)
    `git commit`          ->      objects       (staged)


# git diff
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

Change working tree
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


