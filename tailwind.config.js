module.exports = {
  content: [
    './app/assets/stylesheets/**/*.css',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.html.erb',
    './app/views/components/**/*.js',
    './app/views/components/**/*.rb',
  ],
  theme: {
    extend: {
      colors: {
        background: "rgb(var(--color-background) / <alpha-value>)",
        "background-modal": "rgb(var(--color-background-modal) / <alpha-value>)",
        "background-modal-hover": "rgb(var(--color-background-modal-hover) / <alpha-value>)",
        "background-module": "rgb(var(--color-background-module) / <alpha-value>)",
        primary: "rgb(var(--color-primary) / <alpha-value>)",
        "primary-foreground": "rgb(var(--color-primary-foreground) / <alpha-value>)",
        text: "rgb(var(--color-text) / <alpha-value>)",
        "text-secondary-mid": "rgb(var(--color-text-secondary-mid) / <alpha-value>)",
        "text-secondary": "rgb(var(--color-text-secondary) / <alpha-value>)",
        "text-tertiary": "rgb(var(--color-text-tertiary) / <alpha-value>)",

        border: "rgb(var(--color-border) / <alpha-value>)",
        "border-hover": "rgb(var(--color-border-hover) / <alpha-value>)",
        "border-modal": "rgb(var(--color-border-modal) / <alpha-value>)",
        "border-module": "rgb(var(--color-border-module) / <alpha-value>)",
        "tile-background": "rgb(var(--color-tile-background) / <alpha-value>)",
        "modal-overlay": "rgb(var(--color-modal-overlay) / <alpha-value>)",

        "form-label": "rgb(var(--color-form-label) / <alpha-value>)",
        "field-border": "rgb(var(--color-field-border) / <alpha-value>)",
        "field-background": "rgb(var(--color-field-background) / <alpha-value>)",
        "field-background-active": "rgb(var(--color-field-background-active) / <alpha-value>)",

        "button-primary-background": "rgb(var(--color-button-primary-background) / <alpha-value>)",
        "button-primary-border": "rgb(var(--color-button-primary-border) / <alpha-value>)",
        "button-primary-text": "rgb(var(--color-button-primary-text) / <alpha-value>)",
        "button-secondary-background": "rgb(var(--color-button-secondary-background) / <alpha-value>)",
        "button-secondary-border": "rgb(var(--color-button-secondary-border) / <alpha-value>)",
        "button-secondary-text": "rgb(var(--color-button-secondary-text) / <alpha-value>)",
        "button-outline-border": "rgb(var(--color-button-outline-border) / <alpha-value>)",
        "button-outline-text": "rgb(var(--color-button-outline-text) / <alpha-value>)",
      },
    }
  }
}
