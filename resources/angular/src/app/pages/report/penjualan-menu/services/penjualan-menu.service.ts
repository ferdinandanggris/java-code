import { Injectable } from '@angular/core'
import { LandaService } from 'src/app/core/services/landa.service'

@Injectable({
  providedIn: 'root',
})
export class PenjualanMenuService {
  constructor(private landaService: LandaService) {}

  getPenjualanMenu(arrParameter) {
    return this.landaService.DataGet('/v1/report-penjualan-menu', arrParameter)
  }

  generatePDF(arrParameter) {
    return this.landaService.GenPdf('/v1/generatePdf', arrParameter)
  }

  generateExcel(arrParameter) {
    return this.landaService.GenPdf('/v1/exportExcel', arrParameter)
  }
}
