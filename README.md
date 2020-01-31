# macup-yarn

A [macup](https://github.com/eeerlend/macup-builder) module that enables you to easily install global NodeJS packages using Yarn.

## Installation
Run the following command to add it to your repo
```bash
npm install lsmj/macup-yarn
```

## Configuration
Add **yarn** to the **macup_packages** array in my.config
```bash
macup_packages+=(
  yarn
)
```

Add NPM packages to the **macup_node_packages_yarn** array to be managed globally by Yarn. Yarn is installed by Node if it is not already installed. Node is installed via Homebrew if it's not already installed. Homebrew is also installed if it's not already installed. All global packages are then listed. Finally, packages that are outdated are highlighted and you can choose to update it/them. Press ctrl+c to exit without updating.
```bash
macup_node_packages_yarn+=(
  @vue/cli
)
```
