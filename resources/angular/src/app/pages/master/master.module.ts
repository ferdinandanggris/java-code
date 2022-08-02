import { NgModule } from '@angular/core'
import { CommonModule } from '@angular/common'
import { FormsModule, ReactiveFormsModule } from '@angular/forms'

import {
  NgbModule,
  NgbTooltipModule,
  NgbModalModule,
} from '@ng-bootstrap/ng-bootstrap'
import { NgSelectModule } from '@ng-select/ng-select'
import { DataTablesModule } from 'angular-datatables'

import { MasterRoutingModule } from './master-routing.module'
import { DaftarUserComponent } from './users/components/daftar-user/daftar-user.component'
import { FormUserComponent } from './users/components/form-user/form-user.component'
import { DaftarRolesComponent } from './roles/components/daftar-roles/daftar-roles.component'
import { FormRolesComponent } from './roles/components/form-roles/form-roles.component'
import { DaftarCustomerComponent } from './customers/components/daftar-customer/daftar-customer.component'
import { FormCustomerComponent } from './customers/components/form-customer/form-customer.component'
import { FormItemComponent } from './items/components/form-item/form-item.component'
import { SearchItemComponent } from './items/components/search-item/search-item.component'
import { DaftarItemComponent } from './items/components/daftar-item/daftar-item.component'
import { ProfileComponent } from './profile/components/profile.component'
import { BreadcrumbModule } from 'angular-crumbs'
import { DaftarPromoComponent } from './promo/components/daftar-promo/daftar-promo.component'
import { FormPromoComponent } from './promo/components/form-promo/form-promo.component'
import { CKEditorModule } from 'ckeditor4-angular'
import { FormDiskonComponent } from './diskon/components/form-diskon/form-diskon.component'
import { DaftarDiskonComponent } from './diskon/components/daftar-diskon/daftar-diskon.component'
import { DaftarVoucherComponent } from './voucher/components/daftar-voucher/daftar-voucher.component'
import { FormVoucherComponent } from './voucher/components/form-voucher/form-voucher.component'
import { Daterangepicker } from 'ng2-daterangepicker'

@NgModule({
  declarations: [
    DaftarUserComponent,
    FormUserComponent,
    DaftarRolesComponent,
    FormRolesComponent,
    DaftarCustomerComponent,
    FormCustomerComponent,
    FormItemComponent,
    DaftarItemComponent,
    ProfileComponent,
    SearchItemComponent,
    DaftarPromoComponent,
    FormPromoComponent,
    DaftarDiskonComponent,
    FormDiskonComponent,
    DaftarVoucherComponent,
    FormVoucherComponent,
  ],
  imports: [
    CommonModule,
    MasterRoutingModule,
    NgbModule,
    NgbTooltipModule,
    NgbModalModule,
    NgSelectModule,
    FormsModule,
    DataTablesModule,
    BreadcrumbModule,
    ReactiveFormsModule,
    CKEditorModule,
    Daterangepicker,
  ],
})
export class MasterModule {}
