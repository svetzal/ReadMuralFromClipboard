# Read Mural From Clipboard

This is a simple command-line utility that will dump out the embedded JSON data from your clipboard,
after you've copied content in Mural.

The content is typically contained in a custom tag called `murally` like this:

(pretty-printed for your convenience)

```html
<meta charset='utf-8'>
<murally hiddenContent="mly://... (base64 encoded string containing json )">
</murally>
<table style="width: 99%;">
    <tr>
        <td style="padding: 0;">
            <div><span>abc</span></div>
        </td>
    </tr>
</table>
<table style="width: 99%;">
    <tr>
        <td style="padding: 0;">
            <div><span>def</span></div>
        </td>
    </tr>
</table>
```

The data in the two tables at the end represent a low-fidelity version of the Mural content
(two stickies with "abc" and "def" in them respectively) for which the high-fidelity content is
fully contained in the JSON data.

Presumably the low-fidelity content is provided for convenient copy/paste into other applications.

