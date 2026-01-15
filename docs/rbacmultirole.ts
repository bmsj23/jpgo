export const ROLE_ROUTES = {
  admin: '/admin/dashboard',
  stakeholder: '/stakeholder/dashboard',
  user: '/user/dashboard',
} as const

export type UserRole = keyof typeof ROLE_ROUTES

export const getDefaultRoute = (role: string): string => {
  return ROLE_ROUTES[role as UserRole] || '/dashboard'
}

router.push(getDefaultRoute(profile?.role))