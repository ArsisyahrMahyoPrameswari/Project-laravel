@extends('layouts.main')

@section('content')
    <main>
        <div class="container-fluid px-4">
            <h1 class="my-4">Transaksi</h1>
           
            <div class="card mb-4">
                <div class="card-body">
                     

                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>#</th>                             
                                <th>Tgl Pembayaran</th>
                                <th>Nota</th>
                                <th>Metode</th>
                                <th>A.N Nama</th>
                                <th>Alamat</th>
                                <th>Nominal</th>
                                <th>Status</th>
                                <th>Bukti TF</th>
                                
                                  <th>Approve</th>
                                   <th>Hapus</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($trans as $trs)
                                <tr>      
                                    <th>#</th>                              
                                    <td>{{$trs->tglPembayaran}}</td>
                                   <td>{{$trs->nota}}</td>
                                    <td>{{$trs->metode}}</td>
                                    <td>{{$trs->an_nama}}</td>
                                     <td>{{$trs->alamat}}</td>
                                     <td>{{$trs->nominal}}</td>
                                    <td>{{$trs->status}}</td>
                                    <td>                                       
                                        @if ($trs->image == null)
                                            <a href="{{route('transaction.payment',['nota'=>$trs->nota])}}"><span class="badge bg-primary">No Image</span></a>
                                        @else
                                           <a href="{{asset('storage/payment')}}/{{$trs->image}}" class="btn btn-primary pl-6 pr-6" download>Download File</a>
                                        @endif
                                       
                                    </td>
                                    <td>
                                     @if (Auth::user()->role->name == 'Admin')
                                        @if ($trs->status == 'approve')
                                            <span class="badge bg-success">Approve</span>
                                        @elseif ($trs->status == 'reject')
                                            <span class="badge bg-danger">Reject</span>
                                        @else
                                            <form  action="{{ route('transaction.confirm_payment',['nota'=>$trs->nota,'status'=>'accepted']) }}" method="POST" style="display: inline;">
                                                @csrf
                                                
                                               
                                                <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-check"></i></button>
                                            </form>

                                            <form  action="{{ route('transaction.confirm_payment', ['nota'=>$trs->nota,'status'=>'rejected']) }}" method="POST" style="display: inline;">
                                                @csrf
                                               
                                               
                                                <button type="submit" class="btn btn-sm btn-danger" ><i class="fas fa-times"></i></button>
                                            </form>
                                        @endif
                                     @endif
                                    </td>
                                                     <td>
                                           @if (Auth::user()->role->name == 'Admin')
                                        <form onsubmit="return confirm('Are you sure?');" action="{{ route('transaction.destroy',['nota'=>$trs->nota]) }}" method="POST">
                                          
                                            @csrf
                                            @method('POST')
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                          @endif
                                    </td>
                                   
                                    
                                    
                                    
                                  

                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

       
    </main>

@endsection


