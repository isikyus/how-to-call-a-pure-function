# How to Call a Pure Function

Companion repository to my [blog post](https://isikyus.com/wordpress/) about calling Elm code from Node.js.

The function is defined in `test-func.elm`. The code that calls it is in `aeldardin.js` (named after the project I extracted this from).

## How (I think) It Works

I'm not quite sure what the Main function in the Elm code is doing, but I believe it's more or less the standard Elm project setup with the code that would normally render HTML removed.

The following is my guesses about how this works. I'm really not an authority, so take this with a grain of salt:

The key code for responding to JS is this block:

    Test newText ->
      ( Model newText, done (model.text ++ "a") )

This responds to the Test message (due to `subscriptions model = test Test`), by doing two things:

* Update the model: `Model newText`, which Elm will use as the model for the next iteration. Note that this doesn't affect the _current_ model, so `model.text` here is still whatever I set it to last time.
* Sends a response out the `done` port, with a value of `model.text` with "a" appended. I believe `done (...)` actually creates a Command object, which tells Elm to send the response on its next iteration.

The JS is more-or-less copied from index.html in [evancz's Spelling example](https://gist.github.com/evancz/e69723b23958e69b63d5b5502b0edf90), except that I call `send()` _outside_ the `subscribe()` callback to start things off (whereas evancz has Elm starting the conversation).
