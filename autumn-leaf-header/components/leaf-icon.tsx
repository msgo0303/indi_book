export function LeafIcon({
  className,
  style,
}: {
  className?: string
  style?: React.CSSProperties
}) {
  return (
    <svg
      viewBox="0 0 64 64"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      style={style}
      aria-hidden="true"
    >
      <path
        d="M32 4C14 12 8 30 16 46c4 8 12 13 16 13s12-5 16-13c8-16 2-34-16-42Z"
        fill="currentColor"
      />
      <path
        d="M32 6V58"
        stroke="rgba(0,0,0,0.18)"
        strokeWidth="1.5"
        strokeLinecap="round"
      />
    </svg>
  )
}
