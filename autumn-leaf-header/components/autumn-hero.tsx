import Image from 'next/image'
import { FallingLeaves } from '@/components/falling-leaves'

export function AutumnHero() {
  return (
    <section className="relative min-h-[92vh] overflow-hidden">
      <Image
        src="/images/autumn-hero.png"
        alt="따뜻한 색조로 물든 가을 나무들과 오솔길을 그린 일러스트"
        fill
        priority
        className="object-cover"
      />

      <div
        className="absolute inset-0 bg-gradient-to-b from-background/10 via-background/5 to-background"
        aria-hidden="true"
      />

      <FallingLeaves />

      <div className="relative z-10 flex min-h-[92vh] flex-col items-center justify-center px-6 pb-24 text-center">
        <p className="mb-4 text-sm font-medium uppercase tracking-[0.25em] text-accent">
          Autumn Collection
        </p>
        <h1 className="max-w-3xl font-serif text-4xl font-semibold leading-tight text-balance text-foreground sm:text-6xl md:text-7xl">
          <span className="block">가을이 내려앉는</span>
          <span className="block">계절의 문 앞에서</span>
        </h1>
        <p className="mt-6 max-w-xl text-pretty text-base leading-relaxed text-foreground/75 sm:text-lg">
          바스락거리는 낙엽 소리와 따뜻한 색으로 물든 오후,
          <br className="hidden sm:block" />
          올가을 이야기가 조용히 시작됩니다.
        </p>

        <div className="mt-10 flex flex-wrap items-center justify-center gap-4">
          <a
            href="#"
            className="rounded-full bg-primary px-7 py-3 text-sm font-semibold text-primary-foreground shadow-md transition-transform hover:scale-[1.03]"
          >
            이야기 둘러보기
          </a>
          <a
            href="#"
            className="rounded-full border border-foreground/20 bg-background/40 px-7 py-3 text-sm font-semibold text-foreground backdrop-blur-sm transition-colors hover:bg-background/70"
          >
            뉴스레터 구독
          </a>
        </div>
      </div>

      <div
        className="absolute inset-x-0 bottom-0 z-10 flex justify-center pb-6 text-foreground/50"
        aria-hidden="true"
      >
        <svg
          width="22"
          height="22"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="1.5"
          className="animate-bounce"
        >
          <path d="M12 4v14m0 0l-6-6m6 6l6-6" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
      </div>
    </section>
  )
}
