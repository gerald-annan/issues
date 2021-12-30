# Issues

**TODO: Add description**

Let’s stop hacking and get serious.
You’ll want to organize your source code, write tests, and handle any dependencies.
And you’ll want to follow Elixir conventions, because that way you’ll
get support from the tools.
In this chapter we’ll look at mix, the Elixir build tool. We’ll investigate the
directory structure it uses and see how to manage external dependencies.
And we’ll end up using ExUnit to write tests for our code (and to validate the
examples in our code’s documentation). To motivate this, we’ll write a tool
that downloads and lists the n oldest issues from a GitHub project. Along the
way, we’ll need to find some libraries and make some design decisions typical
of an Elixir project. We’ll call our project issues.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `issues` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:issues, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/issues](https://hexdocs.pm/issues).
