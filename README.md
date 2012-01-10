# todo

Simple command-line todo-lists manager.

## Usage

To add items to a todo list, run the following command:

    todo <list> <item description>

Examples:

    todo Groceries Get milk

    todo Groceries Get orange juice

    todo Outbox Update webpage

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

    Outbox:
      1: Update webpage

To view a specific item run:

    todo <list> <item-number>

Example:

    todo Groceries 2

Outputs:

    Groceries Get orange juice

To mark an item as done run:

    todone <list> <string to match>

Or

    todone <list> <item-number>


Examples:

    todone Groceries 2

    todone Outbox webpage


Todo lists will be saved in the folder `~/.todo` by default. You can specify a different folder setting the `TODO_DIR` environment variable.

## License

MIT
