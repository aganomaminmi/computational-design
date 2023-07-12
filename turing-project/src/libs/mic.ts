export default class Mic {
  private context: AudioContext
  private input: MediaStreamAudioSourceNode
  private analayzer: AnalyserNode
  private processor: ScriptProcessorNode
  private spectrum: Uint8Array
  private res: number
  constructor() {
    navigator.mediaDevices.getUserMedia({ audio: true, video: false }).then((stream) => {
      this.context = new AudioContext();
      this.input = this.context.createMediaStreamSource(stream)
      this.input.connect(this.analayzer)
      this.analayzer = this.context.createAnalyser()
      this.processor = this.context.createScriptProcessor(1024 * 2, 1, 1)
      this.analayzer.connect(this.processor)
      this.processor.connect(this.context.destination)
      this.spectrum = new Uint8Array()
      this.res = 0
      this.processor.onaudioprocess = () => {
        this.spectrum = new Uint8Array(this.analayzer.frequencyBinCount)
        this.analayzer.getByteFrequencyData(this.spectrum)
        this.res = this.spectrum.reduce((a, b) => Math.max(a, b))
      }
    })
  }

  getLevel() {
    return this.res
  }

  close() {
    this.context.close()
  }
}
