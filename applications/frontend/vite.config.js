import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    proxy: {
      '/api': {
        target: 'http://ac1cf5e4e2f31433abf66de3ab9296de-235114055.us-east-1.elb.amazonaws.com',
        changeOrigin: true,
        secure: false
      },
      '/backend': {
        target: 'http://ac1cf5e4e2f31433abf66de3ab9296de-235114055.us-east-1.elb.amazonaws.com',
        changeOrigin: true,
        secure: false
      }
    }
  }
})
