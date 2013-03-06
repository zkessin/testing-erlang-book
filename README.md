
# Testing Erlang

## About this Book

Erlang has existed for a long time but has only recently become a
trending language that is being used in more and more places as people
find that Erlang is the perfect fit for building networked concurrent
applications for the web and other places.

However in order to make a high performance scalable applications
developers need to test those applications. The goal of this book is
to introduce the reader to how to do different types of testing in
Erlang. 

This book starts with using EUnit for building Unit Tests in
Erlang. It will then move on to other kinds of testing in
Erlang. Including Statistical tests with QuickCheck, Type Checking
with Dialyzer, Setting up CI with Jenkins or Travis, building
performance tests and more.


## Building as open source

This is "Testing Erlang" which is an experiment in collective
authoring of a book on how to do Testing in Erlang. I want to tap the
collective mind of the internet to make this book amazing and to cover
a wide range of topics.

This book is for now a work in progress and is at an early phase. The
end goal is that it will be published as a book/ebook by a major
publisher.

In addition I am going to put the built HTML online in the near
future. 

## Technical Details


This project is being written in AsciiDoc which is a pretty simple
format, you can find details here: http://www.methods.co.nz/asciidoc/
we will then convert it to Docbook (XML).

## How do you decide what to include

Mostly its what ever I am working with on a given day. If I am doing
unit testing I will be adding content about unit tests. If I am
working on Stress testing then I will be writing about that. 

## Why haven't you included something about "X"

Probably because it hasn't come up in any of my projects. Feel free to
start work on it and send me a pull request!

## To Contribute

If you want to contribute to this project please read the style guide
first. After that fork this project and send a pull request.

Any content I receive by pull request may be included in the book, so
if you don't want your content included please don't send it to
me. Also please make sure I have your name and email address, If you
want to include your twitter handle or other contact details please
feel free. 

If you are adding a new chapter please add a link into
"book.doc" in the "New Chapters" section

## Style Guide

Each chapter should be its own file named <topic.doc> So unit tests
are *eunit.doc* There should also be a directory *eunit* with sub
directories *images* and *src* that contains source code, figures and
so on for each chapter.

Indent code with spaces not tabs, make it easy to read. Make sure all
code is referenced in the text in some useful way. 


## To Build 

To build this on Linux install the asciidoc package (via yum or
apt-get) make a html directory and run the build.sh script this will
turn everything into HTML


=== Chapters

* <preface.asciidoc>
* [Building With Rebar]<rebar.asciidoc>
* [Using EUnit]<eunit.asciidoc>
* [Advanced Topics in EUnit]<advanced_eunit.asciidoc>
* [Run tests Automaticly When Files change]<eunit_auto_test_runner.asciidoc>
* [Lets do some TDD Together]<eunit_tdd_practicum.asciidoc>
* [CI with Travis and Jenkins]<ci.asciidoc>
* [Performance and Stress Tests]<performance_tests.asciidoc>
* [Testing Resilience with a Chaos Monkey]<chaos_monkey.asciidoc>
