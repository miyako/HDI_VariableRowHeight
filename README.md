![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_VariableRowHeight

Automatic, per-row height in a 4D View Pro list box, driven by an array instead of a single fixed value. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Binding a list box's row height to an array (`rowHeightSource`) so each row can have its own height, rather than one fixed `rowHeight` for the whole list box.
- Reading and writing an individual row's height at runtime with `LISTBOX Get row height` / `LISTBOX SET ROW HEIGHT`.
- Reloading the demo data from a table selection ("Reset") versus zeroing the height array in place while keeping its size ("Clear").
- Populating the same `_Names` / `_Ipsum` / `_Heights` arrays from two different sources: a bundled JSON resource on load, and a `LOREM` table selection on demand.
- Localised sample data: the JSON resource loaded on `On Load` is chosen (`LOREM-en.json` / `LOREM-ja.json`) based on the current 4D localization.

## Key commands

| Command / property | Used for |
|---|---|
| `rowHeightSource` (list box property) | Binds each row's height to the `_Heights` array instead of a single fixed value |
| `LISTBOX SET ROW HEIGHT` | Setting one row's height at runtime ("Set" button) |
| `LISTBOX Get row height` | Reading one row's height at runtime ("Get" button) |
| `COLLECTION TO ARRAY` | Populating `_Names` / `_Ipsum` / `_Heights` from the parsed JSON resource on load |
| `SELECTION TO ARRAY` | Reloading the same arrays from the `LOREM` table selection ("Reset" button) |
| `JSON Parse` | Reading `LOREM-en.json` / `LOREM-ja.json` from the resources folder |

## How it works

The startup method `Project/Sources/Methods/00_Start.4dm` opens the standard `HDI` splash form; its `BtnDemo` object method opens the real demo form `HDI2`.

`Project/Sources/Forms/HDI2/method.4dm` runs `initHDI` and rebuilds `_Heights`, `_Names` and `_Ipsum` on `On Load`, parsing a language-specific JSON resource (`LOREM-en.json` or `LOREM-ja.json`) with `JSON Parse` and unpacking it into the three arrays with `COLLECTION TO ARRAY`. The list box `LB0` lives on the form's shared background page and stays hidden until the user reaches page 2 or 3 (`On Page Change` toggles `OBJECT SET VISIBLE(*; "LB0"; FORM Get current page>1)`), so the same instance backs both the "Set/Get" demo and the array editor.

Page 2's "Individual row setting" group lets the user pick a row (`vRow`) and a height (`vHeight`), then calls `Button2.4dm` (`LISTBOX SET ROW HEIGHT`) or `Button3.4dm` (`LISTBOX Get row height`) against `LB0` by name.

Page 3 shows the `_Heights` array in a second list box (`LB3`) alongside two buttons: `Button10.4dm` ("Reset") re-reads `_Names` / `_Ipsum` / `_Heights` from the `LOREM` table with `SELECTION TO ARRAY`, while `Button11.4dm` ("Clear") resizes `_Heights` to `0` and back to its original length, which zeroes every element without touching `_Names` / `_Ipsum`.

## Points of interest

- `rowHeightSource` takes precedence over `rowHeight` -- once a height array is bound, individual rows are sized by their array element rather than the list box's flat default.
- "Clear" doesn't delete rows; shrinking an array to `0` and back to its original size is a quick way to reset every element to its type's default (here, `0`) while preserving the row count.
- The demo data is loaded from JSON on every "On Load" but can also be reloaded from the `LOREM` table via "Reset" -- two different techniques for feeding the same array-backed list box.
- The project was modernised in this session on top of the binary-to-project conversion: XLIFF localisation for all menus/forms/methods, a rebuilt startup dialog (window reuse, `CALL WORKER`, non-blocking `DIALOG`), method visibility fixes for the Run Method dialog, `menus.json` migrated to the `"action": "quit"` standard action, dark mode support via `"automatic"`/`"automaticAlternate"` colors and CSS media queries, and Tahoe Liquid Glass button sizing.

## Modernisation notes

Converted from the 4D v16 binary `.4DB` to the `.4DProject` architecture.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-hdi-modernisation`](../../tree/miyako-hdi-modernisation) | Full HDI modernisation on top of `main`: XLIFF localisation for menus/forms/methods, a rebuilt startup dialog, standard menu actions, method visibility fixes, dark mode CSS, and Tahoe Liquid Glass button theming. | [localisation.instructions.md](.github/instructions/localisation.instructions.md), [startup.instructions.md](.github/instructions/startup.instructions.md), [menu.instructions.md](.github/instructions/menu.instructions.md), [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md), [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md), [listbox.instructions.md](.github/instructions/listbox.instructions.md) |

## References

- [4D blog: Automatic row height in listboxes, a new 4D View Pro feature!](https://blog.4d.com/automatic-row-height-in-listboxes-a-new-4d-view-pro-feature/)
- [4D documentation: LISTBOX SET ROW HEIGHT](https://developer.4d.com/docs/commands/listbox-set-row-height)
- [4D documentation: LISTBOX Get row height](https://developer.4d.com/docs/commands/listbox-get-row-height)
- Original download: [HDI_4DVP_AutoRowHeight.zip](https://download.4d.com/Demos/4D_v16_R5/HDI_4DVP_AutoRowHeight.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots
