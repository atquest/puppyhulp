#!/bin/bash

# Schone start maken
mkdir -p /tmp/puppyhulp-temp
cd /tmp/puppyhulp-temp

# Next.js project aanmaken met stabiele versies
npx create-next-app@14.0.4 . \
  --typescript \
  --tailwind \
  --eslint \
  --app \
  --src-dir \
  --import-alias="@/*"

# Tailwind configureren
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: 'rgb(79, 142, 189)',
        secondary: 'rgb(255, 184, 108)',
        accent: 'rgb(130, 180, 130)',
      },
      fontFamily: {
        sans: ['var(--font-inter)', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
EOF

# Globale stijlen
cat > src/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --foreground: #333333;
  --background: #fcfaf8;
}

body {
  color: var(--foreground);
  background: var(--background);
  min-height: 100vh;
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 600;
}

@layer components {
  .btn-primary {
    @apply bg-primary text-white rounded-lg px-4 py-2 transition-colors hover:bg-primary/90;
  }
  
  .btn-secondary {
    @apply bg-secondary text-gray-800 rounded-lg px-4 py-2 transition-colors hover:bg-secondary/90;
  }
  
  .card {
    @apply bg-white p-6 rounded-xl shadow-md;
  }
}
EOF

# Eenvoudige Home pagina
cat > src/app/page.tsx << 'EOF'
import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <div className="text-center">
        <h1 className="text-3xl font-bold text-primary mb-4">
          Welkom bij PuppyHulp
        </h1>
        <p className="text-lg text-gray-600 mb-8">
          Begeleiding voor het hele gezin bij de opvoeding van jullie puppy.
        </p>
        <button className="btn-primary">
          Start de app
        </button>
      </div>
    </main>
  )
}
EOF

# Layout
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'], variable: '--font-inter' })

export const metadata: Metadata = {
  title: 'PuppyHulp - Gezinsgerichte puppy opvoeding',
  description: 'Help je gezin bij het opvoeden van jullie puppy met gestructureerde begeleiding, taakverdeling en opvoedtips.',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="nl">
      <body className={`${inter.variable} font-sans`}>
        {children}
      </body>
    </html>
  )
}
EOF

# Project draaien om te testen
npm run dev 