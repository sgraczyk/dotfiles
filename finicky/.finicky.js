module.exports = {
  defaultBrowser: "Browserosaurus",
  handlers: [
    {
      match: finicky.matchHostnames([
        "slack.com",
        "github.com",
        "atlassian.net",
      ]),
      browser: "Google Chrome",
    },
    {
      match: finicky.matchHostnames(["youtube.com"]),
      browser: "Safari",
    },
    {
      match: ({ url }) => url.hostname === "localhost" && url.port === "5173",
      browser: "Google Chrome",
    },
  ],
};
