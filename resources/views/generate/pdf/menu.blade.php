<?php 
$status = [
    'food' => true,
    'snack' => true,
    'drink' => true
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
        *{
            font-family: 'Poppins', sans-serif;
            font-size: 10px
        }
        table {
				width: 100%;
				line-height: inherit;
				text-align: left;
				border-collapse: collapse;
			}
            table td {
				padding: 5px;
				vertical-align: top;
			}
            table tr td:nth-child(2) {
				text-align: right;
			}
            table tr td:nth-child(2) {
				text-align: right;
			}
            table tr.top table td {
				padding-bottom: 20px;
			}
            table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}
            table tr.heading td {
				background: #2c8da2;
				border: 1px solid #eee;
				font-weight: bold;
                color: white
			}
            table tr.total td{
                background: #eee;
				font-weight: bold;
            }
            table tr.menu td{
                background: rgb(192, 192, 192);
				font-weight: bold;
            }
            table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}
            table tr.item td {
				border-bottom: 1px solid #eee;
			}
            .text-center{
                text-align: center
            }
    </style>
</head>
<body>

        <table>
            <thead>
                <tr class="heading">
                    <td class="text-center" colspan="{{count($data['jmlHari'])+2}}">LAPORAN PENJUALAN MENU</td>
                </tr>
                <tr class="heading">
                    <td rowspan="2" class="text-center">Menu</td>
                    <td colspan="{{count($data['jmlHari'])}}" class="text-center" >Periode {{$data['periode']['bulan']}} {{$data['periode']['tahun']}}</td>
                    <td rowspan="2" class="text-center">Total</td>
                </tr>
                <tr class="heading">
                    @foreach ($data['jmlHari'] as $hari)
                        <td class="text-center">{{$loop->iteration}}</td>
                    @endforeach
                </tr>
            </thead>

            <tbody>
                @foreach ($data['listGrandTotal'] as $total)
                      <tr class="total">
                          <td colspan="1">{{ $total['nama'] }}</td>
                          @foreach ($data['jmlHari'] as $hari)
                              <td>
                                  @currency(
                                      $total['tgl'.$loop->iteration]
                                  )
                              </td>
                          @endforeach
                          <td class="vertical-middle">
                            @currency(
                              $total['total'] == 0 ? '-' : ($total['total'] ))
                            
                          </td>
                      </tr>
                  @endforeach
              </tbody>
            @foreach ($data['listPenjualanMenu'] as $listMenu)
            <tbody>
                @if (($listMenu[0])&&($status[$listMenu[0]['kategori']]==true))
                <tr class="menu">
                    <td colspan="{{count($data['jmlHari'])+3}}" class="thead-light">
                        @php
                            $status[$listMenu[0]['kategori']] = false
                        @endphp
                        {{ $listMenu[0] ? strtoupper($listMenu[0]['kategori']) : '' }}
                    </td>
                </tr>
                @endif
            </tbody>

            <tbody>
            @foreach ($listMenu as $dt)
            
                @if ($dt['nama'] == 'TOTAL')
                <tr class="total">
                    <td colspan="{{count($data['jmlHari'])+1}}" style="padding-top: 20px; padding-bottom: 20px">
                        {{$dt['nama']}} {{strtoupper($listMenu[0]['kategori'])}}
                    </td>
                    <td style="padding-top: 10px; padding-bottom: 10px">
                        @currency(
                            $dt['total']
                        )
                    </td>
                </tr>
                @else
                <tr class="item">
                    <td>
                        {{$dt['nama']}}
                    </td>

                @foreach ($data['jmlHari'] as $hari)
                    <td>
                        @currency(
                            $dt['tgl'.$loop->iteration]
                          )
                    </td>
                @endforeach
                    <td class="">
                        @currency(
                            $dt['total']
                        )
                    </td>
                </tr>
                @endif
            @endforeach
            </tbody>
            @endforeach
        </table>
</body>
</html>