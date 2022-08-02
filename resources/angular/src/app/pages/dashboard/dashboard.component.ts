import { Component, OnInit,ViewChild } from '@angular/core'
import { ActivatedRoute, Router } from '@angular/router'
import { DashboardService } from './services/dashboard.service'

import {
  ChartComponent,
  ApexAxisChartSeries,
  ApexChart,
  ApexXAxis,
  ApexTitleSubtitle,
  ApexDataLabels,  
} from "ng-apexcharts";
import * as moment from 'moment';



@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})



export class DashboardComponent implements OnInit {

  chartOptions:{
    series : ApexAxisChartSeries
    chart :ApexChart
    xaxis : ApexXAxis
    dataLabels : ApexDataLabels
  }
  public daterange: any = {}
  public options: any = {
    locale: { format: 'YYYY-MM-DD' },
    alwaysShowCalendars: false,
  }
  listData : any
  listYear : any
  constructor(private router : Router,private route: ActivatedRoute,private dashboardService : DashboardService) {

  }
  searchModel :{
    id_tahun?:number
  }


  ngOnInit(): void {
    this.initializeChartsOptions()
    this.emptyData()
    this.getData()
    this.getYear()
  }

  selectedDate(value: any, datepicker?: any) {
    console.log(value);
    
  }

  initializeChartsOptions():void{
    this.chartOptions = {
      series: [{
        name: "My-series",
        data: [0,0,0,0,0,0,0,0,0,0,0,0,0],
        
      }],
      chart: {
        height: 350,
        type: "bar"
      },
      xaxis: {
        categories: ["Januari", "Februari",  "Maret",  "April",  "Mei",  "Juni",  "Juli",  "Agustus", "September","Oktober","November","Desember"]
      },
      dataLabels: {
        enabled: false
      },
      
    };
  }

  emptyData(){
    this.listData ={
      hari_ini :{
        nama :'',
        total : 0
      },
      bulan_ini :{
        nama :'',
        total : 0
      },
      kemarin :{
        nama :'',
        total : 0
      },
      bulan_lalu :{
        nama :'',
        total : 0
      }
    }
    this.searchModel = {
      id_tahun:moment().year()
    }
  }

  getData(){
        const params = {
          filter : JSON.stringify(this.searchModel)
        }

        this.dashboardService.getDashboard(params).subscribe((res: any) => {
          this.listData = res.data;
          this.chartOptions.series=[{ name:'Revenue',data :res.data.total_bulan}]
          this.chartOptions.xaxis ={categories : res.data.id_bulan}
      }, err => {
          console.log(err);
      });
  }

  getYear() {
    let yearNow = moment().year()
    this.listYear = [
      {
        value: yearNow - 2,
      },
      {
        value: yearNow - 1,
      },
      {
        value: yearNow,
      },
      {
        value: yearNow + 1,
      },
      {
        value: yearNow + 2,
      },
    ]
  }

  refreshData(){
    console.log(this.searchModel.id_tahun);
    this.getData()
  }
}
