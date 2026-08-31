import { AutumnHero } from '@/components/autumn-hero'
import { SiteHeader } from '@/components/site-header'

export default function Page() {
  return (
    <main className="relative">
      <div className="absolute inset-x-0 top-0 z-20">
        <SiteHeader />
      </div>
      <AutumnHero />
    </main>
  )
}
