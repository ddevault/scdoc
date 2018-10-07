scdoc(1)

# NAME

scdoc - tool for generating *roff*(7) manual pages

# SYNOPSIS

*scdoc* < _input_ > _output_

# DESCRIPTION

scdoc is a tool designed to make the process of writing man pages more
friendly. It reads scdoc syntax from stdin and writes roff to stdout, suitable
for reading with *man*(1). For a description of the syntax of scdoc source
files, see *scdoc*(5).

# SEE ALSO

*scdoc*(5)

# AUTHORS

Maintained by Drew DeVault <sir@cmpwn.com>. Up-to-date sources can be found at
https://git.sr.ht/~sircmpwn/scdoc and bugs/patches can be submitted by email to
~sircmpwn/public-inbox@lists.sr.ht.
