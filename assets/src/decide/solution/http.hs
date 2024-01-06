--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Aaron Nguyen <mvngu [AT] gmx [DOT] com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--------------------------------------------------------------------------------

import Data.Foldable
import Text.Printf

-- | The category to which a HTTP status code belongs.
httpClass :: Int -> String
httpClass code =
    case head . show $ code of
        '1' -> "informational response"
        '2' -> "successful"
        '3' -> "redirection"
        '4' -> "client error"
        '5' -> "server error"
        _   -> "Unknown HTTP status class"

-- | The meaning corresponding to an HTTP status code.  The status codes are
-- from:
--
-- https://web.archive.org/web/20240105224035/https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
httpStatus :: Int -> String
httpStatus code =
    case code of
        100 -> "Continue"
        101 -> "Switching Protocols"
        102 -> "Processing (WebDAV; RFC 2518)"
        103 -> "Early Hints (RFC 8297)"
        200 -> "OK"
        201 -> "Created"
        202 -> "Accepted"
        203 -> "Non-Authoritative Information (since HTTP/1.1)"
        204 -> "No Content"
        205 -> "Reset Content"
        206 -> "Partial Content"
        207 -> "Multi-Status (WebDAV; RFC 4918)"
        208 -> "Already Reported (WebDAV; RFC 5842)"
        226 -> "IM Used (RFC 3229)"
        300 -> "Multiple Choices"
        301 -> "Moved Permanently"
        302 -> "Found (Previously 'Moved temporarily')"
        303 -> "See Other (since HTTP/1.1)"
        304 -> "Not Modified"
        305 -> "Use Proxy (since HTTP/1.1)"
        306 -> "Switch Proxy"
        307 -> "Temporary Redirect (since HTTP/1.1)"
        308 -> "Permanent Redirect"
        400 -> "Bad Request"
        401 -> "Unauthorized"
        402 -> "Payment Required"
        403 -> "Forbidden"
        404 -> "Not Found"
        405 -> "Method Not Allowed"
        406 -> "Not Acceptable"
        407 -> "Proxy Authentication Required"
        408 -> "Request Timeout"
        409 -> "Conflict"
        410 -> "Gone"
        411 -> "Length Required"
        412 -> "Precondition Failed"
        413 -> "Payload Too Large"
        414 -> "URI Too Long"
        415 -> "Unsupported Media Type"
        416 -> "Range Not Satisfiable"
        417 -> "Expectation Failed"
        418 -> "I'm a teapot (RFC 2324, RFC 7168)"
        421 -> "Misdirected Request"
        422 -> "Unprocessable Content"
        423 -> "Locked (WebDAV; RFC 4918)"
        424 -> "Failed Dependency (WebDAV; RFC 4918)"
        425 -> "Too Early (RFC 8470)"
        426 -> "Upgrade Required"
        428 -> "Precondition Required (RFC 6585)"
        429 -> "Too Many Requests (RFC 6585)"
        431 -> "Request Header Fields Too Large (RFC 6585)"
        451 -> "Unavailable For Legal Reasons (RFC 7725)"
        500 -> "Internal Server Error"
        501 -> "Not Implemented"
        502 -> "Bad Gateway"
        503 -> "Service Unavailable"
        504 -> "Gateway Timeout"
        505 -> "HTTP Version Not Supported"
        506 -> "Variant Also Negotiates (RFC 2295)"
        507 -> "Insufficient Storage (WebDAV; RFC 4918)"
        508 -> "Loop Detected (WebDAV; RFC 5842)"
        510 -> "Not Extended (RFC 2774)"
        511 -> "Network Authentication Required (RFC 6585)"
        _   -> "Unknown HTTP status code"

-- | An HTTP status code and its meaning.
main = do
    let code = [123, 200, 234, 300, 345, 404, 418, 420, 456, 500, 567, 789, 890]
    for_ code $ \x -> do
        printf "%d -> %s\n" x $ httpClass x
        printf "%d -> %s\n" x $ httpStatus x
