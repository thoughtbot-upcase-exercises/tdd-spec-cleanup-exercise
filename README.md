# Fundamentals of TDD / Tdd Spec Cleanup Exercise

Hey there! We're [thoughtbot](https://thoughtbot.com), a design and
development consultancy that brings your digital product ideas to life.
We also love to share what we learn.

This coding exercise comes from [Upcase](https://thoughtbot.com/upcase),
the online learning platform we run. It's part of the
[Fundamentals of TDD](https://thoughtbot.com/upcase/fundamentals-of-tdd) course and is just one small sample of all
the great material available on Upcase, so be sure to visit and check out the rest.

## Exercise Intro

Test code deserves the same care and effort as we put into writing our production code. In this exercise you'll take a messy test and refactor it to better capture the intent and tell a good story.

## Instructions

To start, you'll want to clone and run the setup script for the repo

    git clone git@github.com:thoughtbot-upcase-exercises/tdd-spec-cleanup-exercise.git
    cd tdd-spec-cleanup-exercise
    bin/setup

Your goal is to refactor the provided spec to help it tell a good story. Currently the spec makes heavy use of features like `let` and `before`, obscuring the behavior and assertions in each of the specs. Instead, we want each spec to stand on its own, telling a small clear story about the behavior of our model

1. Edit the spec in `spec/models/invitation_spec.rb`.
2. Refactor the spec, cleaning up and clarifying things _without_ changing the test or model behavior
3. As with any good refactoring, your tests should remain green throughout. Be sure to check with:

```
$ bin/rspec spec/models/invitation_spec.rb
```

**Your goal is to refactor the specs in that file to clarify the behavior and tell a good story**

- Keep the 4 phase test model in mind (likely you'll only need 3 as tear down is automated)
- Feel free to extract helper methods to abstract away details while keeping setup explicit to the spec

## Tips and Tricks

Revisit the video on [Telling a Story with Your Tests](https://thoughtbot.com/upcase/videos/telling-a-story-with-your-tests) for tips on how to tackle this cleanup.

## Forum Discussion

If you find yourself stuck, be sure to check out the associated
[Upcase Forum discussion](https://forum.upcase.com)
for this exercise to see what other folks have said.

## Next Steps

When you've finished the exercise, head on back to the
[Fundamentals of TDD](https://thoughtbot.com/upcase/fundamentals-of-tdd) course to find the next exercise,
or explore any of the other great content on
[Upcase](https://thoughtbot.com/upcase).

## License

tdd-spec-cleanup-exercise is Copyright © 2015-2018 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the
[LICENSE](/LICENSE.md) file.

## Credits

![thoughtbot](https://presskit.thoughtbot.com/assets/images/logo.svg)

This exercise is maintained and funded by
[thoughtbot, inc](http://thoughtbot.com/community).

The names and logos for Upcase and thoughtbot are registered trademarks of
thoughtbot, inc.
