![nativegen logo](https://raw.githubusercontent.com/yoavlt/nativegen/master/nativegen.png)
========

[![Build Status](https://travis-ci.org/yoavlt/nativegen.svg)](https://travis-ci.org/yoavlt/nativegen)
[![Coverage Status](https://coveralls.io/repos/yoavlt/nativegen/badge.svg?branch=master&service=github)](https://coveralls.io/github/yoavlt/nativegen?branch=master)
[![hex.pm version](https://img.shields.io/hexpm/v/nativegen.svg)](https://hex.pm/packages/nativegen)

Nativegen is a source code generator of native app accessing REST API.
This can reduces your dull works at all.
Especially, if you use [Phoenix](http://phoenixframework.org/) framework, this is for you.

*It is supported just Swift code yet, but will Android, Unity and so on.*

## Installation

You can add dependency to your project's `mix.exs`.

```:elixir
  defp deps do
    [
      {:nativegen, "~> 0.1.0"}
    ]
  end
```

then,

```:sh
$ mix do deps.get, mix compile
```

## iOS

#### Generating code depends on the follwoing library
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
* [BrightFutures](https://github.com/Thomvis/BrightFutures)

## Example generating source code

```swift:
import Foundation
import BrightFutures
import Alamofire
import SwiftyJSON

public class User : JsonModel {
    let username: String
    var items: [Item]
    public required init(json: JSON) {
        username = json["username"].stringValue
        if let itemsJson = json["items"] {
            items = itemsJson.arrayValue.map { Item(json: $0) }
        }
    }
}

public class UserRepository : Repository {

    public func create(username: String) -> Future<User, NSError> {
        return requestData(.POST, routes: "/api/users", param: ["user": [username: username]])
    }

    public func show(id: Int) -> Future<User, NSError> {
        return requestData(.GET, routes: "/api/users/\(id)", param: nil)
    }

    public func update(id: Int, username: String, items: [Item]) -> Future<User, NSError> {
        return requestData(.PATCH, routes: "/api/users/\(id)", param: ["user": [username: username]])
    }

    public func delete(id: Int) -> Future<Bool, NSError> {
        return requestSuccess(.DELETE, routes: "/api/users/\(id)", param: nil)
    }

    public func buyItem(itemId: Int) -> Future<Bool, NSError> {
        return requestSuccess(.POST, routes: "/users/buy", param: [item_id: itemId])
    }

}
```

## Usage(Swift)

First, you have to setup.

```:sh
$ mix nativegen.swift.setup /your/to/your/directory
```

Next, following command will generate accessible REST API swift code.

```sh:
$ mix nativegen.swift.create /path/to/your/directory User users username:string group:Group items:array:Item
```

And, generate Json model the following command.

```sh:
$ mix nativegen.swift.model Item name:string strength:integer
```

Also, append model in your swift code.

```sh:
$ mix nativegen.swift.model Item name:string strength:integer --file /path/to/your/repo.swift
```

You can also generate methods

```sh:
$ mix nativegen.swift.method post /api/chat/response responseMessage Chat thread_id:integer message:string
```

## Lisence
MIT Lisence
