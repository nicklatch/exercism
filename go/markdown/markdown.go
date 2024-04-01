package markdown

import (
	"fmt"
	"strings"
)

func Render(markdown string) string {
	markdown = strings.Replace(markdown, "__", "<strong>", 1)
	markdown = strings.Replace(markdown, "__", "</strong>", 1)
	markdown = strings.Replace(markdown, "_", "<em>", 1)
	markdown = strings.Replace(markdown, "_", "</em>", 1)

	var strBuilder strings.Builder
	lines := strings.Split(markdown, "\n")

	for i := 0; i < len(lines); i++ {
		headingLevel := len(lines[i]) - len(strings.TrimLeft(lines[i], "#"))
		switch {
		case headingLevel > 0 && headingLevel < 7:
			strBuilder.WriteString(fmt.Sprintf("<h%d>%s</h%d>", headingLevel, strings.TrimLeft(lines[i], "# "), headingLevel))
		case lines[i][:1] == "*":
			strBuilder.WriteString("<ul>")
			for ; ; i++ {
				strBuilder.WriteString(fmt.Sprintf("<li>%s</li>", strings.TrimLeft(lines[i], "* ")))
				if !(i+1 < len(lines) && lines[i+1][:1] == "*") {
					break
				}
			}
			strBuilder.WriteString("</ul>")

		default:
			strBuilder.WriteString(fmt.Sprintf("<p>%s</p>", lines[i]))

		}
	}
	return strBuilder.String()
}
