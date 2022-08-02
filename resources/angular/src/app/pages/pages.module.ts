import { NgModule } from '@angular/core'
import { CommonModule } from '@angular/common'
import { FormsModule, ReactiveFormsModule } from '@angular/forms'

import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar'
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar'
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar'
import { NgbAlertModule, NgbCollapseModule, NgbModule } from '@ng-bootstrap/ng-bootstrap'

import { PagesRoutingModule } from './pages-routing.module'

import { DashboardComponent } from './dashboard/dashboard.component'
import { BreadcrumbModule } from 'angular-crumbs'
import { BrowserModule } from '@angular/platform-browser'
import { NgApexchartsModule } from 'ng-apexcharts'
import { Daterangepicker } from 'ng2-daterangepicker'
import { NgSelectModule } from '@ng-select/ng-select'

const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true,
  wheelSpeed: 0.3,
}

@NgModule({
  declarations: [DashboardComponent],
  imports: [
    ReactiveFormsModule,
    NgbAlertModule,
    CommonModule,
    PagesRoutingModule,
    PerfectScrollbarModule,
    BreadcrumbModule,
    NgApexchartsModule,
    FormsModule,
    ReactiveFormsModule,
    Daterangepicker,
    NgSelectModule
  ],
  providers: [
    {
      provide: PERFECT_SCROLLBAR_CONFIG,
      useValue: DEFAULT_PERFECT_SCROLLBAR_CONFIG,
    },
  ],
})
export class PagesModule {}
