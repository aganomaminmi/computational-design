import { BrowserRouter, Route, Routes } from 'react-router-dom'
import HelloReact from './pages/HelloReact'
import { AudioAPI } from './pages/AudioAPI'
import { AudioAPIDraft } from './pages/AudioAPIDraft'
import { TuringPattern } from './pages/TuringPattern'
import { TuringSound } from './pages/TuringSound'
import { FFTPage } from './pages/FFT'
import { DigitalLove } from './pages/DigitalLove'
import { OneMoreTime } from './pages/OneMoreTime'
import { Music } from './pages/Music'


export const RoutesProvider = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HelloReact />} />
        <Route path="/audio-api" element={<AudioAPI />} />
        <Route path="/audio-api-draft" element={<AudioAPIDraft />} />
        <Route path="/turing" element={<TuringPattern />} />
        <Route path="/turing-sound" element={<TuringSound />} />
        <Route path="/fft" element={<FFTPage />} />
        <Route path="/digital-love" element={<DigitalLove />} />
        <Route path="/one-more-time" element={<OneMoreTime />} />
        <Route path="/music" >
          <Route path=":id" element={<Music />} />
        </Route>
      </Routes>
    </BrowserRouter>
  )
}
