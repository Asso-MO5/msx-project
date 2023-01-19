<script>
  import { onMount } from 'svelte'
  import { currentColor } from './sprite-creator/stores/color.store'

  let container
  let canvas
  let canvasWidth
  let canvasHeight
  let cameraZoom = 1
  let screenX = 0
  let screenY = 0
  let init = false
  const screenWidth = 256
  const screenHeight = 192

  let pixels = []

  const selectPixel = (e) => {
    const canvasPosition = canvas.getBoundingClientRect()
    const ctx = canvas.getContext('2d')
    const transform = ctx.getTransform()
    //mouse position in canvas
    const mouseX = e.clientX - canvasPosition.left
    const mouseY = e.clientY - canvasPosition.top
    const transformedX = mouseX - transform.e
    const transformedY = mouseY - transform.f
    //for target pixel under mouse
    const x = Math.floor(transformedX / cameraZoom).toFixed(0)
    const y = Math.floor(transformedY / cameraZoom).toFixed(0)

    pixels.push({
      x,
      y,
      //color in store
      color: $currentColor,
    })

    draw()
  }

  const drawPixel = () => {
    pixels.forEach((pixel) => {
      const ctx = canvas.getContext('2d')
      ctx.fillStyle = pixel.color.hex
      ctx.fillRect(pixel.x, pixel.y, 1, 1)
    })
  }

  const setWindowWidth = () => {
    canvasWidth = container.clientWidth
    canvasHeight = container.clientHeight
    draw()
  }

  const draw = () => {
    const ctx = canvas.getContext('2d')
    //TODO problème avec la taille
    canvas.width = canvasWidth
    canvas.height = canvasHeight

    ctx.translate(canvasWidth / 2, canvasHeight / 2)
    ctx.scale(cameraZoom, cameraZoom)
    ctx.translate(-canvasWidth / 2, -canvasHeight / 2)
    drawScreen()
    drawBoard()
    drawPixel()
  }

  const drawScreen = () => {
    const ctx = canvas.getContext('2d')
    ctx.fillStyle = 'white'
    screenX = (canvasWidth - 25) / 2 - screenWidth / 2
    screenY = (canvasHeight - 25) / 2 - screenHeight / 2
    ctx.fillRect(screenX, screenY, screenWidth, screenHeight)
  }

  const drawBoard = () => {
    const posX = (canvasWidth - 25) / 2 - screenWidth / 2
    const posY = (canvasHeight - 25) / 2 - screenHeight / 2
    const bw = screenWidth
    const bh = screenHeight
    const ctx = canvas.getContext('2d')
    ctx.lineWidth = 0.1
    ctx.strokeStyle = 'rgba(2,7,159,0.2)'
    for (let x = posX; x < posX + bw - 1; x += 8) {
      for (let y = posY; y < posY + bh - 1; y += 8) {
        ctx.strokeRect(x, y, 8, 8)
      }
    }
  }

  const zoom = (e) => {
    if (e.deltaY > 0) {
      cameraZoom += 0.1
    } else {
      cameraZoom -= 0.1
    }
    draw()
  }

  onMount(() => {
    if (init) return
    setWindowWidth()
    init = true
  })
</script>

<svelte:window on:resize={setWindowWidth} />

<div class="container" bind:this={container}>
  <canvas bind:this={canvas} on:wheel={zoom} on:click={selectPixel} />
</div>

<style>
  .container {
    width: 100%;
    height: 85%;
  }

  canvas {
    border: 1px solid black;
    background: #ccc;
  }
</style>
