import { LeafIcon } from '@/components/leaf-icon'

type LeafConfig = {
  left: number
  size: number
  duration: number
  delay: number
  sway: number
  spin: number
  color: string
  opacity: number
}

// Fixed, hand-tuned configs (not Math.random) so server and client markup match exactly.
const LEAVES: LeafConfig[] = [
  { left: 3, size: 22, duration: 13, delay: 0, sway: 40, spin: 380, color: 'var(--leaf-1)', opacity: 0.9 },
  { left: 10, size: 16, duration: 10, delay: 2.4, sway: -30, spin: -320, color: 'var(--leaf-2)', opacity: 0.75 },
  { left: 17, size: 26, duration: 15, delay: 5, sway: 50, spin: 420, color: 'var(--leaf-3)', opacity: 0.85 },
  { left: 24, size: 14, duration: 9, delay: 1, sway: -25, spin: -300, color: 'var(--leaf-1)', opacity: 0.6 },
  { left: 31, size: 20, duration: 12, delay: 3.6, sway: 35, spin: 360, color: 'var(--leaf-4)', opacity: 0.8 },
  { left: 38, size: 18, duration: 11, delay: 6.2, sway: -40, spin: -340, color: 'var(--leaf-2)', opacity: 0.7 },
  { left: 45, size: 24, duration: 14, delay: 0.8, sway: 30, spin: 400, color: 'var(--leaf-3)', opacity: 0.9 },
  { left: 52, size: 15, duration: 10.5, delay: 4.4, sway: -20, spin: -280, color: 'var(--leaf-1)', opacity: 0.65 },
  { left: 59, size: 21, duration: 13.5, delay: 2, sway: 45, spin: 360, color: 'var(--leaf-4)', opacity: 0.85 },
  { left: 66, size: 17, duration: 11.5, delay: 7, sway: -35, spin: -320, color: 'var(--leaf-2)', opacity: 0.7 },
  { left: 73, size: 25, duration: 15.5, delay: 1.6, sway: 40, spin: 440, color: 'var(--leaf-3)', opacity: 0.9 },
  { left: 80, size: 14, duration: 9.5, delay: 5.6, sway: -25, spin: -300, color: 'var(--leaf-1)', opacity: 0.6 },
  { left: 87, size: 19, duration: 12.5, delay: 3, sway: 30, spin: 380, color: 'var(--leaf-4)', opacity: 0.8 },
  { left: 94, size: 16, duration: 10.8, delay: 6.8, sway: -30, spin: -340, color: 'var(--leaf-2)', opacity: 0.7 },
  { left: 55, size: 22, duration: 14.2, delay: 8.4, sway: 35, spin: 400, color: 'var(--leaf-3)', opacity: 0.8 },
  { left: 20, size: 18, duration: 12.8, delay: 9.2, sway: -40, spin: -360, color: 'var(--leaf-1)', opacity: 0.75 },
]

export function FallingLeaves() {
  return (
    <div
      className="pointer-events-none absolute inset-0 overflow-hidden"
      aria-hidden="true"
    >
      {LEAVES.map((leaf, i) => (
        <LeafIcon
          key={i}
          className="leaf-fall absolute top-[-10%]"
          style={
            {
              left: `${leaf.left}%`,
              width: leaf.size,
              height: leaf.size,
              color: leaf.color,
              opacity: 0,
              '--leaf-duration': `${leaf.duration}s`,
              '--leaf-delay': `${leaf.delay}s`,
              '--leaf-sway': `${leaf.sway}px`,
              '--leaf-spin': `${leaf.spin}deg`,
              '--leaf-opacity': leaf.opacity,
            } as React.CSSProperties
          }
        />
      ))}
    </div>
  )
}
