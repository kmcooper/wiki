# [Home](../README.md)
# Best Practices

## Development and Coding Best Practices

* Use version control (`git`)
* Document code appropriately
  * Auto-generate docs for complex software
  * Per Google: "the best code is self-documenting"
    * Give sensible names to types and variables
  * Use comments when appropriate
* Use automated formatting
  * `Black`, `autopep8`, `rustfmt`, `clang-format`, etc
  * Automate the automated formatting: throw a pre-commit hook in `.git/hooks`
* Use proper logging. Find an appropriate logging module for the environment. For `bash` script pipelines this may just mean `echo`ing to a file. For Python use the `logging` package. We are doing science here, so having a hard record of everything that happens is very important. Logging can also be invaluable for troubleshooting. Some things to log:
  * Write input and output filepaths to logs
  * Write important parameters to logs
  * Put the git branch and/or abbreviate commit hash in the logs. You can get this with sys calls:
    `$ git rev-parse --abbrev-ref HEAD`
    `$ git log -1 --format=%h`
  * Put any important notes in logs
* Write unit tests
  * Unit tests are important. 100% code coverage may not be necessary, but use good judgment here
* Use CI/CD
  * Any standalone software should have CI/CD so that tests are run and the core functionality of the software is verified (does it work at all??) automatically. Automating deployment with CD means less manual work as well
* Use relative filepaths

### External Resources
* [Minimal safe Bash script template](https://betterdev.blog/minimal-safe-bash-script-template/)
