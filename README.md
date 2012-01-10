# todo

Simple command-line todo-lists manager.

## Usage

To add items to a todo list, run the following command:

    todo <list> <item description>

Examples:

    todo Groceries Get milk

    todo Groceries Get orange juice

    todo todo Write readme

To view a list items run:

    todo <list>

Example:

    todo Groceries

Outputs:

    Groceries:
      1: Get milk
      2: Get orange juice

To view items on all lists run:

    todo

Outputs:

    Groceries:
      1: Get milk
      2: Get orange juice

    todo:
      1: Write readme

To mark an item as done run:

    todone <list> <string to match>

Or

    todone <list> <item-number>


Examples:

    todone Groceries 2

    todone todo readme


Todo lists will be saved in the folder `~/.todo` by default. You can specify a different folder setting the `TODO_DIR` environment variable.

## License

MIT
