# atcoder

## acc, ojt login

At 2025/05/05, the tools cannot login from command line.

To avoid it, you need to copy paste the cookie from the web browser.


1. `Ctrl + Shift + I` to open the chrome developer tools on the atcoder web site.

2. Select the `Applications` tab from the top bar, and check the `Storage/Cookies` page.

3. Copy and paste `REVEL_SESSION` to the
`~/.config/atcoder-cli-nodejs/session.json` file.

  ```json
  {
    "cookies": [
      "REVEL_FLASH=",
      "REVEL_SESSION=<PASTE HERE>"
    ]
  }
  ```

  Make sure the file directory corresponds to the result of `acc config-dir`.

4. Copy and paste `REVEL_SESSION` to the
`~/.local/share/online-judge-tools/cookie.jar` file.

  ```jar
  #LWP-Cookies-2.0
  Set-Cookie3: REVEL_FLASH=""; path="/"; domain="atcoder.jp"; path_spec; secure; discard; HttpOnly=None; version=0
  Set-Cookie3: REVEL_SESSION="<PASTE HERE>"; path="/"; domain="atcoder.jp"; path_spec; secure; expires="<EXPIRE DATE>"; HttpOnly=None; version=0
  ```

  The cookie file path is shown during the installation of online-judge-tools.
