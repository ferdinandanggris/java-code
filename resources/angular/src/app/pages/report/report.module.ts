import { NgModule } from '@angular/core'
import { CommonModule } from '@angular/common'

import { ReportRoutingModule } from './report-routing.module'
import { PenjualanMenuComponent } from './penjualan-menu/components/penjualan-menu/penjualan-menu.component'
import { NgbModule } from '@ng-bootstrap/ng-bootstrap'
import { NgSelectModule } from '@ng-select/ng-select'
import { PenjualanCustomerComponent } from './penjualan-customer/components/penjualan-customer/penjualan-customer.component'
import { Daterangepicker } from 'ng2-daterangepicker'
import { FormsModule } from '@angular/forms';
import { RekapPenjualanComponent } from './rekap-penjualan/components/rekap-penjualan/rekap-penjualan.component'

@NgModule({
  declarations: [PenjualanMenuComponent, PenjualanCustomerComponent, RekapPenjualanComponent],
  imports: [
    CommonModule,
    ReportRoutingModule,
    NgbModule,
    NgSelectModule,
    Daterangepicker,
    FormsModule,
  ],
})
export class ReportModule {}
