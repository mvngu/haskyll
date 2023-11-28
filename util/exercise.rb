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

# Number the exercises in a section/chapter.  Each exercise follows this
# format:
#
# :exercise: Insert text of the exercise.
#
# The text ":exercise:" delimits the beginning of an exercise.  This script
# expects the following command line argument:
#
# doc := A section/chapter in the entire document.  Assumed to be located under
#     the directory "_tabs/".
def main
    doc = ARGV[0]
    ex_delim = ":exercise:"
    n = 1
    content = ""
    File.foreach(doc) do |line|
        if line.strip.start_with?(ex_delim)
            exercise = format("<strong>Exercise %d.</strong>", n)
            content += line.gsub(/:exercise:/, exercise)
            n += 1
        else
            content += line
        end
    end
    # Overwrite the existing content of the file.
    File.open(doc, "w") do |f|
        f.write(content)
    end
end

################################################################################
# Start here
################################################################################

main
