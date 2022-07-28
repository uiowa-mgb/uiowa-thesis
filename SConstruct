import os

pkg = "uiowa-thesis"
class_src = pkg + ".cls"
manual_src = pkg + ".tex"

build = "build"
dist = "dist"

# os.makedirs(build)

env = Environment(ENV=os.environ)

SConscript(".scons", variant_dir="build")

# Prepare the CTAN release files
files = [pkg + ext for ext in [".pdf", ".cls", ".tex"]] + ["readme.md", "example"]
files = [ os.path.join(build, f) for f in files ]
ctan = env.Zip(os.path.join(dist, pkg), files, ZIPROOT=build)
env.Alias("ctan", ctan)

# Prepare the github release files
thesis = os.path.join(build, "release_thesis")

file_list = Glob("example/*") + [class_src]
release_files = Install(thesis, file_list)
release_archive = Zip(
    os.path.join(dist, "release", "thesis.zip"),
    release_files,
    ZIPROOT=thesis,
)
release_document = Install(
    os.path.join(dist, "release"),
    os.path.join(build, "thesis.pdf"),
)
env.Alias("release", [release_archive, release_document])

# vim: set filetype=python:
