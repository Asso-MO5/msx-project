export type MenuLink = {
  title: string
  slug: string
  number: number
  category: string
  description: string
}

export type Link = {
  title: string
  posts: MenuLink[]
}
