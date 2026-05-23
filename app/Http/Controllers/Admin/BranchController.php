<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BranchController extends Controller
{
    public function index()
    {
        $branches = Branch::with('location')->latest()->get();
        return view('admin.branches.index', compact('branches'));
    }

    public function create()
    {
        $locations = Location::all();
        return view('admin.branches.create', compact('locations'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'location_id'    => 'required|exists:locations,id',
            'name'           => 'required|string|max:255',
            'phone'          => 'required|string|max:255',
            'address'        => 'required|string',
            'image'          => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'instagram_url'  => 'nullable|url|max:255',
            'google_map_url' => 'nullable|url|max:255',
        ], [
            'location_id.required' => 'يرجى اختيار المكان',
            'name.required'        => 'اسم الفرع مطلوب',
            'phone.required'       => 'رقم الهاتف مطلوب',
            'address.required'     => 'العنوان مطلوب',
            'image.image'          => 'الملف يجب أن يكون صورة',
            'instagram_url.url'    => 'رابط انستجرام غير صالح',
            'google_map_url.url'   => 'رابط جوجل ماب غير صالح',
        ]);

        $data = $request->except('image');

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('branches', 'public');
        }

        Branch::create($data);

        return redirect()->route('admin.branches.index')
            ->with('status', 'تم إضافة الفرع بنجاح');
    }

    public function edit(Branch $branch)
    {
        $locations = Location::all();
        return view('admin.branches.edit', compact('branch', 'locations'));
    }

    public function update(Request $request, Branch $branch)
    {
        $request->validate([
            'location_id'    => 'required|exists:locations,id',
            'name'           => 'required|string|max:255',
            'phone'          => 'required|string|max:255',
            'address'        => 'required|string',
            'image'          => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'instagram_url'  => 'nullable|url|max:255',
            'google_map_url' => 'nullable|url|max:255',
        ], [
            'location_id.required' => 'يرجى اختيار المكان',
            'name.required'        => 'اسم الفرع مطلوب',
            'phone.required'       => 'رقم الهاتف مطلوب',
            'address.required'     => 'العنوان مطلوب',
        ]);

        $data = $request->except('image');

        if ($request->hasFile('image')) {
            if ($branch->image) {
                Storage::disk('public')->delete($branch->image);
            }
            $data['image'] = $request->file('image')->store('branches', 'public');
        }

        $branch->update($data);

        return redirect()->route('admin.branches.index')
            ->with('status', 'تم تحديث الفرع بنجاح');
    }

    public function destroy(Branch $branch)
    {
        if ($branch->departments()->count() > 0) {
            return redirect()->route('admin.branches.index')
                ->with('error', 'لا يمكن حذف هذا الفرع لوجود أقسام مرتبطة به');
        }

        if ($branch->image) {
            Storage::disk('public')->delete($branch->image);
        }

        $branch->delete();

        return redirect()->route('admin.branches.index')
            ->with('status', 'تم حذف الفرع بنجاح');
    }
}
