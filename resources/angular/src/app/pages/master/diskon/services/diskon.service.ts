import { Injectable } from '@angular/core'
import { LandaService } from 'src/app/core/services/landa.service'

@Injectable({
  providedIn: 'root',
})
export class DiskonService {
  constructor(private landaService: LandaService) {}

  getDiskons(arrParameter) {
    return this.landaService.DataGet('/v1/diskons', arrParameter)
  }

  createDiskon(payload) {
    return this.landaService.DataPost('/v1/diskons', payload)
  }
  updateDiskon(payload) {
    return this.landaService.DataPut('/v1/diskons', payload)
  }

  getDiskonById(diskonId) {
    return this.landaService.DataGet('/v1/diskons/' + diskonId)
  }

  deleteDiskon(diskonId) {
    return this.landaService.DataDelete('/v1/diskons/' + diskonId)
  }
}
