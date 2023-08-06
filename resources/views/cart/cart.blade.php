@extends('layouts.main')
@section('content')
<main>
    <div class="container-fluid px-4">
        <h1 class="my-4">Cart</h1>
        <div class="card mb-4">
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Image</th>
                            <th>Nama</th>
                            <th>Harga</th>
                            <th>Merk</th>
                            <th>QTY</th>
                            <th>Hapus</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; ?>
                        @foreach ($cartItems as $item)
                        <tr>
                            <td>{{$no++}}</td>
                            <td class="hidden pb-4 md:table-cell">
                                <a href="#">
                                    <img src="{{ asset('storage/product/'.$item->attributes->image) }}" alt="{{$item->image}}" style="width: 50px;">
                                </a>
                            </td>
                            <td>
                                {{ $item->name }}
                            </td>
                            <td class="hidden text-right md:table-cell">
                                <span class="text-sm font-medium lg:text-base">
                                    Rp. {{ $item->price }}
                                </span>
                            </td>
                            <td>Brand</td>
                            <td class="justify-center mt-8 md:justify-end md:flex">
                                <div class="h-16 w-28">
                                    <div class="relative flex flex-row w-full h-8">
                                        <form action="{{ route('cart.update') }}" method="POST">
                                            @csrf
                                            <input type="hidden" name="id" value="{{ $item->id}}">
                                            <input type="number" name="quantity" value="{{ $item->quantity }}" class="w-16 text-center h-6 text-gray-800 outline-none rounded border border-blue-600" />
                                            <button class="px-4 mt-1 py-1.5 text-sm rounded rounded shadow text-violet-100 bg-violet-500">Update</button>
                                        </form>
                                    </div>
                                </div>
                            </td>
                            <td class="justify-center mt-8 md:justify-end md:flex">
                                <div class="h-10 w-28">
                                    <div class="relative flex flex-row w-full h-8">
                                        <form action="{{ route('cart.remove') }}" method="POST">
                                            @csrf
                                            <input type="hidden" value="{{ $item->id }}" name="id">
                                            <button class="px-4 mt-1 py-1.5 text-sm rounded rounded shadow text-violet-100 bg-violet-500">x</button>
                                        </form>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <div class="d-flex align-items-center justify-content-between mt-6 mb-0">
                    <h2>Total: Rp. {{ Cart::getTotal() }}</h2>
                    <form action="{{ route('cart.clear') }}" method="POST">
                        @csrf
                        <button class="px-6 py-2 text-sm  rounded shadow text-red-100 bg-red-500">Clear Carts</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="mt-4 mb-0">
            <div class="d-grid"><a class="btn btn-primary btn-block" href="{{route('transaction.checkout')}}">Check Out</a></div>
        </div>
    </div>
</main>
@endsection
