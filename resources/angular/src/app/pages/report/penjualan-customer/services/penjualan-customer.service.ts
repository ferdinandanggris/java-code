import { Injectable } from '@angular/core'
import { LandaService } from 'src/app/core/services/landa.service'

@Injectable({
  providedIn: 'root',
})
export class PenjualanCustomerService {
  constructor(private landaService: LandaService) {}

  getPenjualanCustomer(arrParameter) {
    return this.landaService.DataGet(
      '/v1/report-penjualan-customer',
      arrParameter,
    )
  }

  generatePDF(arrParameter) {
    return this.landaService.GenPdf('/v1/generatePdf', arrParameter)
  }

  generateExcel(arrParameter) {
    return this.landaService.GenPdf('/v1/exportExcel', arrParameter)
  }
}
