import { BrowserRouter, Route, Routes } from 'react-router-dom';
import HelloReact from './pages/HelloReact';
import { AudioAPI } from './pages/AudioAPI';
import { AudioAPIDraft } from './pages/AudioAPIDraft';
import { TuringPattern } from './pages/TuringPattern';


export const RoutesProvider = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HelloReact />} />
        <Route path="/audio-api" element={<AudioAPI />} />
        <Route path="/audio-api-draft" element={<AudioAPIDraft />} />
        <Route path="/turing" element={<TuringPattern />} />
      </Routes>
    </BrowserRouter>
  );
};
