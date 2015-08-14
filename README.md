Nativegen
========

[![Build Status](https://travis-ci.org/yoavlt/nativegen.svg)](https://travis-ci.org/yoavlt/nativegen)

Nativegen is a native app accessing REST API source code generator.
It is supported just Swift code now, but will Android, Unity and so on.

## Installation

You can add dependency in your `mix.exs` from Hex packages.

```:elixir
    {:nativegen, "~> 0.0.1"}
```

then,

```:sh
$ mix deps.get && mix compile
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
