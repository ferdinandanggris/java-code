import { NgModule } from '@angular/core'
import { Routes, RouterModule } from '@angular/router'
import { PenjualanCustomerComponent } from './penjualan-customer/components/penjualan-customer/penjualan-customer.component'
import { PenjualanMenuComponent } from './penjualan-menu/components/penjualan-menu/penjualan-menu.component'
import { RekapPenjualanComponent } from './rekap-penjualan/components/rekap-penjualan/rekap-penjualan.component'

const routes: Routes = [
  {
    path: 'penjualan-menu',
    component: PenjualanMenuComponent,
  },
  {
    path: 'penjualan-customer',
    component: PenjualanCustomerComponent,
  },
  {
    path: 'rekap-penjualan',
    component: RekapPenjualanComponent,
  },
]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ReportRoutingModule {}
