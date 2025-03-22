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
