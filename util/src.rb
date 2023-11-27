################################################################################
## MIT License
##
## Copyright (C) 2023 Duck McSouls <quacksouls [AT] gmail [DOT] com>
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in
## all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
################################################################################

# Include within a section or chapter a source file that has programming code.
# The inclusion follows this format:
#
# :include: file="/path/to/source/file.extension", name="a short name"
#
# The source code will be placed between two sets of triple back ticks.  The
# extension of the included file will be used to infer syntax highlighting.
# This script expects the following command line argument:
#
# doc := A section/chapter in the entire document.  Assumed to be located under
#     the directory "_tabs/".
def main()
    doc = ARGV[0]
    ex_delim = ":include:"
    content = ""
    github = "https://github.com/quacksouls/haskyll/blob/main"
    File.foreach(doc) do |line|
        if line.strip.start_with?(ex_delim)
            new_line = line.gsub(/:include:/, "").strip
            file, name = new_line.split(",").map{|str| str.strip}
            file = file.scan(/^file="(\S+)"$/).last[-1]
            name = name.scan(/^name="(\S+)"$/).last[-1]
            content += "[`%s`](%s/%s)\n" % [name, github, file]
            content += "```%s\n" % [infer_language(file)]
            content += get_content(file)
            content += "```\n"
        else
            content += line
        end
    end
    # Overwrite the existing content of the file.
    File.open(doc, "w") do |f|
        f.write(content)
    end
end

# Get the content of a text file.
#
# @param file Read in this file.
# @returns The content of the given file.
def get_content(file)
    content = ""
    File.foreach(file) do |line|
        content += line
    end
    return content
end

# Infer the programming language from the extension of the source file.
#
# @param file Path to a source file.
# @returns The programming language of the source code.
def infer_language(file)
    ext = file.split("/")[-1]
    ext = ext.split(".")[-1]
    if ext == "hs"
        return "haskell"
    end
end

################################################################################
# Start here
################################################################################

main()
