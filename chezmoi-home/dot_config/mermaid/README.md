# Mermaid Config

[All of the options](https://github.com/mermaid-js/mermaid/blob/v10.1.0/packages/mermaid/src/defaultConfig.ts)

## Averting SVG issues

https://github.com/mermaid-js/mermaid-cli/issues/112#issuecomment-869401507

To take advantage of this in org-mode, you need to add this property to the source block

https://github.com/arnm/ob-mermaid#supported-properties

``` org
:mermaid-config-file ~/.config/mermaid/config.json
```
