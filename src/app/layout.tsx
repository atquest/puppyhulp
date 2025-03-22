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
