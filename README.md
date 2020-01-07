# Recommendations for Centralisation and Encryption 

This is the working area for an individual Internet-Draft.

The [editor's version](draft-arkko-farrell-arch-model-t.txt)


## Sections

The draft is split into a markdown file per section:

- [Introduction](intro.md)
- [Observations](observations.md)
- [Analysis](analysis.md)
- [Areas for further study](study.md)
- [Guidelines](guidelines.md)
- [Possible Changes to RFC 3552](changes3552.md)
- [Possible Changes to RFC 7258](changes7258.md)
- [Conclusions](conclusions.md)
- [References](refs.md)
- [Acknowlendgments](acks.md)

The [main markdown file](draft-arkko-farrell-arch-model-t.md) has ``!INCLUDE``
statements for all the above.

## Building the Draft

Formatted text and HTML versions of the draft can be built using `make`.

```sh
$ make
```

This requires that you have the necessary software installed.  See
[the instructions](https://github.com/martinthomson/i-d-template/blob/master/doc/SETUP.md).

In addition, since we're using "!INCLUDE" statements to handle
multiple input markdown files, you need to have ``markdown-pp``
available. To install that:

            sudo pip install MarkdownPP

## Contributing

See the
[guidelines for contributions](https://github.com/jariarkko/distributed-resolver-selection/blob/master/CONTRIBUTING.md).
