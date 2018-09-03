# Homebrew DG Graph

Homebrew command to view a dot graph of your homebrew dependencies.

## Usage

1.  Install the command by tapping the repo.

    ```bash
    brew tap tygern/dependencies-graph
    ```

1.  Output a dotfile of your dependencies to the shell with the
    `dependencies-graph` command.

    ```bash
    brew dependencies-graph
    ```

## Viewing

View the graph in a nicer format with [Graphviz](https://www.graphviz.org/).

1.  Install Graphviz.
    It is possible to install Graphviz with Homebrew, however be aware
    that this installs a large number of dependencies (as you will see
    below).

    ```bash
    brew install graphviz
    ```

1.  Use Graphviz to generate a png dependency graph.

    ```bash
    brew dependencies-graph | dot -Tpng -o graph.png
    ```

    The leaves are shown in dark gray.