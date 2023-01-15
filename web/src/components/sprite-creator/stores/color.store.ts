import { writable } from 'svelte/store'
import { IColor, palette } from '../utils/palette'

const initialColor: IColor = palette[0]

function createColor() {
  const { subscribe, set } = writable(initialColor)

  return {
    subscribe,
    changeColor: (color: IColor) => set(color),
    reset: () => set(initialColor),
  }
}

export const currentColor = createColor()
