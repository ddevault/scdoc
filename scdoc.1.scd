scdoc(1)

# NAME

scdoc - tool for generating *roff*(7) manual pages

# SYNOPSIS

*scdoc* < _input_ > _output_

# DESCRIPTION

scdoc is a tool designed to make the process of writing man pages more
friendly. It reads scdoc syntax from stdin and writes roff to stdout, suitable
for reading with *man*(1).

# SYNTAX

Input files must use the UTF-8 encoding.

## PREAMBLE

Each scdoc file must begin with the following preamble:

	*name*(_section_)

The *name* is the name of the man page you are writing, and _section_ is the
section you're writing for (see *man*(1) for information on manual sections).

## SECTION HEADERS

Each section of your man page should begin with something similar to the
following:

	# HEADER NAME

Subsection headers are also understood - use two hashes. Each header must have
an empty line on either side.

## PARAGRAPHS

Begin a new paragraph with an empty line.

## FORMATTING

Text can be made *bold* or _underlined_ with asterisks and underscores: \*bold\*
or \_underlined\_.

## INDENTATION

You may indent lines with tab characters (*\\t*) to indent them by 4 spaces in
the output. Indented lines may not contain headers.

	The result looks something like this.

	You may use multiple lines and most _formatting_.

Deindent to return to normal, or indent again to increase your indentation
depth.

## LISTS

You may start bulleted lists with dashes, like so:

```
- Item 1
- Item 2
	- Subitem 1
	- Subitem 2
- Item 3
```

The result looks like this:

- Item 1
- Item 2
	- Subitem 1
	- Subitem 2
- Item 3

## LITERAL TEXT

You may turn off scdoc formatting and output literal text with escape codes and
literal blocks. Inserting a \\ into your source will cause the subsequent symbol
to be treated as a literal and copied directly to the output. You may also make
blocks of literal syntax like so:

```
\```
_This formatting_ will *not* be interpreted by scdoc.
\```
```

These blocks will be indented one level. Note that literal text is shown
literally in the man viewer - that is, it's not a means for inserting your own
roff macros into the output. Note that \\ is still interpreted within literal
blocks, which for example can be useful to output \``` inside of a literal block.

# AUTHORS

Maintained by Drew DeVault <sir@cmpwn.com>. Up-to-date sources can be found at
https://git.sr.ht/~sircmpwn/scdoc and bugs/patches can be submitted by email to
sir@cmpwn.com.
