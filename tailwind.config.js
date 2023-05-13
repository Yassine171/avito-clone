/** @type {import('tailwindcss').Config} */
module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/**/*.html.slim',
    './app/**/*.rb',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('flowbite/plugin')
  ],
  content: [
    './node_modules/flowbite/**/*.js'
   ],
}

