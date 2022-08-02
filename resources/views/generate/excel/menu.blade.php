<?php 
$status = [
    'food' => 1,
    'snack' => 1,
    'drink' => 1
];
?>

<!DOCTYPE html>
<html lang="en">

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
            <thead>
                <tr class="menu">
                    <td colspan="{{count($data['jmlHari'])+3}}" class="thead-light">
                      {{ $listMenu[0] ? strtoupper($listMenu[0]['kategori']) : '' }}
                    </td>
                  </tr>
            </thead>

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