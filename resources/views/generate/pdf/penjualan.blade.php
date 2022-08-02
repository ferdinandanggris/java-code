<?php 
$status = [
    'food' => 1,
    'snack' => 1,
    'drink' => 1
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
                    <td class="text-center" colspan="11">LAPORAN REKAP PENJUALAN</td>
                </tr>
                <tr class="heading">
                    <td class="text-center" colspan="11">Periode {{$data['periode']['bulan']}} {{$data['periode']['tahun']}}</td>
                </tr>
                <tr class="heading">
                    <td class="text-center" rowspan="2">No</td>
                    <td class="text-center" rowspan="2">No Struk</td>
                    <td class="text-center" rowspan="2">Customer</td>
                    <td class="text-center" rowspan="2">Tanggal</td>
                    <td class="text-center" rowspan="2">Menu</td>
                    <td class="text-center" rowspan="2">Jumlah</td>
                    <td class="text-center" rowspan="2">Harga</td>
                    <td class="text-center" rowspan="2">Total</td>
                    <td class="text-center" colspan="2">Promo</td>
                    <td class="text-center" rowspan="2">Total Bayar</td>
                  </tr>
                  <tr class="heading">
                    <td class="text-center">Diskon</td>
                    <td class="text-center">Voucher</td>
                  </tr>
            </thead>

            @foreach ($data['listRekapPenjualan'] as $rekap)
            <tbody>
                <tr class="item">
                    <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{ $loop->iteration }}
                      </td>
                      <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{ $rekap["no_struk"] }}
                      </td>
                      <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{ $rekap["nama_user"] }}
                      </td>
                      <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{ $rekap["tanggal"] }}
                      </td>
                      <td class="text-center">{{ $rekap["menu"][0]["nama"] }}</td>
                      <td class="text-center">{{ $rekap["menu"][0]["jumlah"] }}</td>
                      <td class="text-center">{{ $rekap["menu"][0]["harga"] }}</td>
                      <td class="text-center">
                        {{ $rekap["menu"][0]["total"] }}
                      </td>
                      <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{
                          ($rekap['potongan'] == 0 || $rekap['potongan'] == null
                            ? '-'
                            : ($rekap['potongan']))
                        }}{{
                          ($rekap['diskon'] == 0 || $rekap['diskon'] == null
                            ? '-'
                            : '(' . $rekap['diskon'] . '%)')
                        }}
                      </td>
                      <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{
                          $rekap["voucher"]
                        }}
                      </td>
                      <td class="text-center" rowspan="{{count($rekap['menu'])}}">
                        {{ $rekap["total_bayar"] }}
                      </td>
                </tr>
                @for ($i = 1; $i < count($rekap['menu']); $i++)
                    <tr>
                        <td class="text-center">{{ $rekap['menu'][$i]["nama"] }}</td>
                        <td class="text-center">{{ $rekap['menu'][$i]["jumlah"] }}</td>
                        <td class="text-center">{{ $rekap['menu'][$i]["harga"] }}</td>
                        <td class="text-center">{{ $rekap['menu'][$i]["total"] }}</td>
                    </tr>
                @endfor
            </tbody>
            @endforeach
        </table>
</body>
</html>