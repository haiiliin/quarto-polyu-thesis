# quarto-polyu-thesis

A [Quarto](https://quarto.org/) template for thesis of The Hong Kong Polytechnic University. Modified from [quxiaofeng/PolyU_thesis_template](https://github.com/quxiaofeng/PolyU_thesis_template).

## Creating a New Article

To create a new article using this format:

```bash
quarto use template haiiliin/quarto-polyu-thesis
```

This will create a new directory with an example document that uses this format.

## Using with an Existing Document

To add this format to an existing document:

```bash
quarto add haiiliin/quarto-polyu-thesis
```

Then, add the format to your document options:

```yaml
format:
  polyu-thesis-pdf: default
```

## Options

- `draft`: Set to `true` to enable draft mode.
- `degree`: Degree, `master` or `doctor`, by default `doctor`
- `title`: Title
- `author`: Author
- `subject`: Subject
- `date`: Date
- `version`: Version
- `university`: University, by default "The Hong Kong Polytechnic University"
- `department`: Department
- `institute`: Institute, by default "Thesis Research Centre"
- `city`: City, by default "Hong Kong"
- `address`: Address, by default "Hung Hom, Kowloon"
- `partner_university`: Partner university
- `partner_department`: Partner department
- `first_viewer`: First viewer
- `second_viewer`: Second viewer
- `supervisor`: Supervisor
- `abstract`: Abstract
- `keywords`: Keywords
- `acknowledgement`: Acknowledgement
