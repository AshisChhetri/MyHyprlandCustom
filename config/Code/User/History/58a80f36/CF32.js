/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      container: {
        center: true,
        padding: '1rem', // Change the default padding if needed
      },
      h-screen-10:{
        height:10vw
      }
    },
  },
  plugins: [],
}
