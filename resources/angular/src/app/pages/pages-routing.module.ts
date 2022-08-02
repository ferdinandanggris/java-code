import { NgModule } from '@angular/core'
import { Routes, RouterModule } from '@angular/router'
import { LayoutComponent } from '../layouts/layout.component'

import { DashboardComponent } from './dashboard/dashboard.component'
import { FormItemComponent } from './master/items/components/form-item/form-item.component'
import { ProfileComponent } from './master/profile/components/profile.component'

const routes: Routes = [
  { path: '', redirectTo: 'home' },
  {
    path: 'home',
    component: DashboardComponent,
    data: { breadcumb: 'Dashboard' },
  },
  {
    path: 'master',
    loadChildren: () =>
      import('./master/master.module').then((m) => m.MasterModule),
  },
  {
    path: 'report',
    loadChildren: () =>
      import('./report/report.module').then((m) => m.ReportModule),
  },
  {
    path: 'profile',
    component: ProfileComponent,
    data: { breadcumb: 'Profile' },
  },
  {
    path: 'master/item',
    component: FormItemComponent,
  },
]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PagesRoutingModule {}
