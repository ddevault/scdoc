scdoc(5)

# NAME

scdoc - syntax description for scdoc markup language

# DESCRIPTION

scdoc is a tool designed to make the process of writing man pages more
friendly. It converts scdoc files into roff macros, which can then be converted
to man pages or a number of other formats. The syntax is inspired by, but not
directly taken from, markdown. Input files *must* use the UTF-8 encoding.

# PREAMBLE

Each scdoc file must begin with the following preamble:

	*name*(_section_)

The *name* is the name of the man page you are writing, and _section_ is the
section you're writing for (see *man*(1) for information on manual sections).

# SECTION HEADERS

Each section of your man page should begin with something similar to the
following:

	# HEADER NAME

Subsection headers are also understood - use two hashes. Each header must have
an empty line on either side.

# PARAGRAPHS

Begin a new paragraph with an empty line.

# FORMATTING

Text can be made *bold* or _underlined_ with asterisks and underscores: \*bold\*
or \_underlined\_.

# INDENTATION

You may indent lines with tab characters (*\\t*) to indent them by 4 spaces in
the output. Indented lines may not contain headers.

# LISTS

You may start bulleted lists with dashes, like so:

```
- Item 1
- Item 2
- Item 3
```

You may also use numbered lists like so:

```
1. Item 1
2. Item 2
3. Item 3
```

# LITERAL TEXT

You may turn off scdoc formatting and output literal text with escape codes and
literal blocks. Inserting a \\ into your source will cause the subsequent symbol
to be treated as a literal and copied directly to the output. You may also make
blocks of literal syntax like so:

```
\`\`\`
_This formatting_ will *not* be interpreted by scdoc.
\`\`\`
```

These blocks will be indented one level. Note that literal text is shown
literally in the man viewer - that is, it's not a means for inserting your own
roff macros into the output.
