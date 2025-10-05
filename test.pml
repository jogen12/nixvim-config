```plantuml
@startuml
scale 0.8
class User { +id : int }
class Post { +id : int }
User "1" -- "many" Post
@enduml
```
