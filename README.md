# Delete-merged-branches
This action is used to delete merged branches (If branches HEAD commit exist in passed Branch name). 

## Usage
To use this action, add the following step to your GitHub Action workflow:
```yaml
- uses: imajeetyadav/delete-merged-branches@main
  with:
    branch: master # default value - main
```

## Authors

Created and maintained by [Ajeet Yadav](https://github.com/imAjeetYadav)
