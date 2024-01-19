# .git directory
.git
    `git add, git rm`     ->      index         (staging)
    `git commit`          ->      objects       (staged)


# git diff
## git diff
Compare working tree vs staging

**Example:**
Staging
`git add file1`

Change working tree
`echo abc >> file1`

Working tree vs staging
`git diff`
abc


## git diff --staged
Compare staging and staged

**Example:**
Staged
`git add file1; git commit -m update`

Staging
`echo abc >> file1; git add file1`

Staging vs staged
`git diff --staged`
abc



