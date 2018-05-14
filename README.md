# Text2Sign
[![Build Status](https://travis-ci.org/Waasi/text_2_sign.svg?branch=master)](https://travis-ci.org/Waasi/text_2_sign)

Text to Sign Language Translator Elixir Library. It uses the resources in
https://www.signingsavvy.com/ to translate a list of words to sign language.

### Installation

  1. Add `text_2_sign` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:text_2_sign, git: "https://github.com/Waasi/text_2_sign"}]
end
```

### Usage

##### Text2Sign.Translator Module translate/1

```elixir
Text2Sign.Translator.translate ["Hello", "World"] # => [hello_sign_video_url, world_sign_video_url]
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/text_2_sign/fork )
2. Create your feature branch (`git checkout -b feature/my_new_feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Special Thanks To:

The people @ [Signing Savvy](https://www.signingsavvy.com/) for all
the resources that made this library possible.

