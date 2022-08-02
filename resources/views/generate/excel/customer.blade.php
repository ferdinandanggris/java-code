

<!DOCTYPE html>
<html lang="en">
    <style>
        *{
            font-family: 'Poppins', sans-serif;
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
<body>

        <table>
            <thead>
                <tr class="heading">
                    <td class="text-center" colspan="{{count($data['jmlHari'])+2}}">LAPORAN PENJUALAN CUSTOMER</td>
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

            <thead>

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
                            $total['total'])
                          
                        </td>
                    </tr>
                @endforeach
            </tbody>
            <tbody>
            @foreach ($data['listPenjualanCustomer'] as $dt)
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
                
            @endforeach
            </tbody>
        </table>
</body>
</html>