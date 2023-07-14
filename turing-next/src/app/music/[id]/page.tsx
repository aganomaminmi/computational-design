'use client'

import p5 from 'p5'
import { NextPage } from 'next'
import dynamic from 'next/dynamic'

const MusicSketch = dynamic<{ id: string }>(() => import('@/components/page-parts/music/').then((module) => module.MusicSketch), {
  loading: () => <></>,
  ssr: false
})


const MusicPage: NextPage<{ params: { id: string } }> = ({ params }) => {
  const { id } = params

  if (!id) {
    return <div>404</div>
  }

  return (
    <MusicSketch id={id} />
  )
}

export default MusicPage
