import { LeafIcon } from '@/components/leaf-icon'

const NAV_ITEMS = ['이야기', '갤러리', '레시피', '문의']

export function SiteHeader() {
  return (
    <header className="relative z-20 flex items-center justify-between px-6 py-6 sm:px-10">
      <a
        href="#"
        className="flex items-center gap-2 font-serif text-lg font-semibold tracking-tight text-foreground"
      >
        <LeafIcon className="h-5 w-5 text-primary" />
        <span>단풍노트</span>
      </a>

      <nav aria-label="주요 메뉴" className="hidden items-center gap-8 md:flex">
        {NAV_ITEMS.map((item) => (
          <a
            key={item}
            href="#"
            className="text-sm font-medium text-foreground/70 transition-colors hover:text-foreground"
          >
            {item}
          </a>
        ))}
      </nav>

      <a
        href="#"
        className="rounded-full border border-foreground/15 bg-card px-4 py-2 text-sm font-medium text-foreground shadow-sm transition-colors hover:bg-secondary md:px-5"
      >
        구독하기
      </a>
    </header>
  )
}
