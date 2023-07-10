import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    open: true
  },
  resolve: {
    alias: [
      { find: '@/', replacement: '/src/' }
    ]
  },
  define: {
    global: {
      p5: 'p5'
    }
  },
  plugins: [react()],
})
