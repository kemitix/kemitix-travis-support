# Kemitix Travis Support

Provides settings, deployment and coverage reporting for use within a Travis-CI build.

## Features

* gpg signing
* sonatype deployment
* coveralls reporting

## Environment Variables

* DEPLOY_USERNAME
* DEPLOY_PASSWORD
* GPG_KEYNAME
* GPG_PASSPHRASE
* SIGN_ID
* DEPLOY_PROJECTS
* COVERAGE_PROJECTS

### DEPLOY_USERNAME

The Sonatype account username for deploying binary artifacts.

### DEPLOY_PASSWORD

The Sonatype account password.

### GPG_KEYNAME

The GPG key to sign artifacts with.

### GPG_PASSPHRASE

The passphrase for the GPG key.

### SIGN_ID

The ID assigned by Travis for the key and iv pair for decrypting the project's `codesign.asc.enc` file into `codesign.enc`, for use by GPG.

### DEPLOY_PROJECTS (optional)

If this is set then, in a multi-module project, only these projects will be deployed to Sonatype. The list should be comma-separated. If not provided then all modules will be deployed.

### COVERAGE_PROJECTS (optional)

If this is set then, in a multi-module project, only these projects will have coverage data reported to Coveralls.. The list should be comma-separated. If not provided then all modules will be reported.
