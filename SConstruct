import os
from pathlib import Path

main = "thesis"

env = Environment(ENV=os.environ)
env["PDFLATEX"] = "xelatex"

# Build our document from notes.tex
document = env.PDF(target= main + ".pdf", source= "example/" + main + ".tex")

env.Depends(document, "uiowa-thesis.cls")

# Delete our document once done building not before, places nicer with document viewers
env.Precious(document)

# vim: set filetype=python:
