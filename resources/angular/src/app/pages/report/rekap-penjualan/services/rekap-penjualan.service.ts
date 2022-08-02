import { Injectable } from '@angular/core'
import { LandaService } from 'src/app/core/services/landa.service'

@Injectable({
  providedIn: 'root',
})
export class RekapPenjualanService {
  constructor(private landaService: LandaService) {}

  getRekapPenjualan(arrParameter) {
    return this.landaService.DataGet('/v1/report-rekap-penjualan', arrParameter)
  }

  generatePDF(arrParameter) {
    return this.landaService.GenPdf('/v1/generatePdf', arrParameter)
  }

  generateExcel(arrParameter) {
    return this.landaService.GenPdf('/v1/exportExcel', arrParameter)
  }
}
