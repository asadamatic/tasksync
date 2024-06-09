# tasksync

Task management app written in Flutter.

## Using `go_touer` 
Go router is a good interface for Navigator 2.0 and is officially maintained by Flutter, which makes it my go to choice for routing.

## Using `hive` db
Hive provides an easy way to store objects by creating adaptors and is supported on all platforms. It's just easier to set it up. A closer competitor is `isar` but I have not experienced it.

## Deviation from Clean Architecture

### Use Cases
Normall, I will skip the use cases if all they do is calling an method from the repository, and does no have to manage any business logic.

### Models that Extend Entities
Returning Model objects from the data layer, results in type mismatch at run time, which requires creating translators for interconversion of entity and model. To avoid make it more complex, it skip this part.

## Tests
I do not have experience in writing tests, though I can write some basic tests. I've left the Riverpod testing part.

