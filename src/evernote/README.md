# Evernote Scripts

## Requirement

1. Get Evernote Developper Token. See [Developer Tokens - Evernote Developers](https://dev.evernote.com/doc/articles/dev_tokens.php).
1. Write down your token in `developper_token.json` just like `developper_token_sample.json`. (Please be notified this is an insecure way. Developper token must not be known by others so it should not be written in plain text.)

## Scripts

### login2evernote.rb
Load developper token and login to Evernote.

### listNotebooks.rb

Just list your Evernote Notebooks. Use this for a test.

### pdf2evernote.rb

Coming soon. Create a note and attach a PDF file on that. The note title will be same as PDF file name and other file information will be written in the note. If the PDF file has information of downloaded URL, URL value of the note will be filled.
