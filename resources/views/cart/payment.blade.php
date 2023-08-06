@extends('layouts.main')

@section('content')

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Checkout Confirm</h3></div>
                    <div class="card-body">
                        <h3 class="font-weight-light my-4">Untuk Pembayaran bisa dikirim ke :</h3>
                        <hr>
                        <h5 class="font-weight-light my-4">BRI No. Rekening: 3524889456</h5>
                        <h5 class="font-weight-light my-4">A.n Arsisyah </h5>     
                        <hr>                   
                        <h5 class="font-weight-light my-4">lalu upload dengan menekan tombol dibawah ini</h5>
                        <hr>
                        <h5 class="font-weight-light my-4">konfirmasi hub. 08813581249 </h5>
                        <hr>
                        <h5 class="font-weight-light my-4">No. Nota : {{$nota}} </h5>

                        <form action="{{ route('transaction.confirm_payment') }}" enctype="multipart/form-data" method="POST">
                        @csrf
                            <input type="hidden" name="nota" value="{{$nota}}">
                            <div class="row mb-3">
                                <div class="col-md-12">

                                    <div class="form-floating mb-3 mb-md-0">                                       
                                        <input type="file"  class="form-control" name="file" placeholder="Upload Bukti Transfer">      
                                       
                                    </div>
                                </div>                                 
                            </div>             
                                     
                            <div class="mt-4 mb-0">
                                <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Proses</button></div>
                            </div>
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
</main>

@endsection