<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Reservation;
use App\Models\Location;
use App\Models\Branch;
use App\Models\Department;
use App\Models\Service;
use App\Models\Doctor;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    // =========================
    // Reservations Index
    // =========================
    public function index(Request $request)
    {
        // 1. جلب المستخدم المسجل دخوله حالياً
        $user = auth()->user();

        // 2. بناء الاستعلام الأساسي
        $query = Reservation::where('is_archive', 0)->with(['location', 'branch', 'department', 'service', 'doctor']);

        // 3. تطبيق فلتر الفرع بناءً على الصلاحية
        // إذا لم يكن أدمن، ويملك فرع محدد، يقوم بتصفية الحجوزات على فرعه فقط
        if ($user->role !== 'admin' && $user->branch_id) {
            $query->where('branch_id', $user->branch_id);
        }
        // حماية إضافية: إذا لم يكن أدمن ولم يُحدد له فرع في قاعدة البيانات، لا يرى أي حجوزات
        elseif ($user->role !== 'admin' && !$user->branch_id) {
            $query->whereRaw('1 = 0'); // استعلام يرجع فارغاً دائماً
        }

        // 4. تطبيق فلاتر البحث العادية
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('search_id')) {
            $query->where('id', $request->search_id);
        }

        $reservations = $query->latest()->paginate(10);

        $branchCondition = ($user->role !== 'admin' && $user->branch_id) ? ['branch_id' => $user->branch_id] : [];

        $totalReservations = Reservation::where($branchCondition)->count();
        $pending = Reservation::where('status', 'pending')->where($branchCondition)->count();
        $confirmed = Reservation::where('status', 'confirmed')->where($branchCondition)->count();
        $completed = Reservation::where('status', 'completed')->where($branchCondition)->count();
        $archive = Reservation::where('is_archive', true)->where($branchCondition)->count();

        return view('admin.reservations.index', compact(
            'reservations',
            'totalReservations',
            'pending',
            'confirmed',
            'completed',
            'archive'
        ));
    }

    public function confirmStatus($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->update(['status' => 'confirmed']);

        return redirect()->back()->with('status', 'تم تأكيد الحجز بنجاح!');
    }

    public function completeStatus($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->update(['status' => 'completed']);

        return redirect()->back()->with('status', 'تم تسجيل الحجز كمكتمل (تم الحضور)!');
    }

    // =========================
    // Create
    // =========================
    public function create()
    {
        $locations = Location::all();
        $branches = Branch::all();
        $departments = Department::all();
        $services = Service::all();
        $doctors = Doctor::all();

        return view('admin.reservations.create', compact(
            'locations',
            'branches',
            'departments',
            'services',
            'doctors'
        ));
    }

    // =========================
    // Store
    // =========================
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'              => 'required|string|max:255',
            'phone'             => 'required|string|max:20',
            'email'             => 'nullable|email|max:255',
            'location_id'       => 'nullable|exists:locations,id',
            'branch_id'         => 'nullable|exists:branches,id',
            'department_id'     => 'nullable|exists:departments,id',
            'service_id'        => 'nullable|exists:services,id',
            'doctor_id'         => 'nullable|exists:doctors,id',
            'reservation_date'  => 'required|date|after_or_equal:today',
            'reservation_time'  => 'required',
            'notes'             => 'nullable|string',
            'message'           => 'nullable|string',
        ]);

        $validated['status'] = 'pending';
        $validated['is_archive'] = 0;
        $validated['is_delete'] = 0;

        Reservation::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'تم إرسال طلب الحجز بنجاح! سنتواصل معك قريباً.'
        ]);
    }

    // =========================
    // Edit
    // =========================
    public function edit($id)
    {
        $reservation = Reservation::findOrFail($id);

        $locations = Location::all();
        $branches = Branch::all();
        $departments = Department::all();
        $services = Service::all();
        $doctors = Doctor::all();

        return view('admin.reservations.edit', compact(
            'reservation',
            'locations',
            'branches',
            'departments',
            'services',
            'doctors'
        ));
    }

    // =========================
    // Update
    // =========================
    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);

        $validated = $request->validate([
            'name'              => 'required|string|max:255',
            'phone'             => 'required|string|max:20',
            'email'             => 'nullable|email|max:255',
            'location_id'       => 'nullable|exists:locations,id',
            'branch_id'         => 'nullable|exists:branches,id',
            'department_id'     => 'nullable|exists:departments,id',
            'service_id'        => 'nullable|exists:services,id',
            'doctor_id'         => 'nullable|exists:doctors,id',
            'reservation_date'  => 'required|date',
            'reservation_time'  => 'required',
            'status'            => 'required|in:pending,confirmed,cancelled,completed',
            'notes'             => 'nullable|string',
        ]);

        $reservation->update($validated);

        return redirect()
            ->route('reservations.index')
            ->with('status', 'تم تحديث الحجز بنجاح!');
    }

    // =========================
    // Delete
    // =========================
    public function destroy($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->delete();

        return redirect()
            ->back()
            ->with('status', 'تم حذف الحجز نهائيًا!');
    }

    // =========================
    // Archive
    // =========================
    public function archive(Request $request)
    {
        $query = Reservation::where('is_archive', 1)->with(['location', 'branch', 'department', 'service', 'doctor']);

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('search_id')) {
            $query->where('id', $request->search_id);
        }

        $reservations = $query->latest()->paginate(10);
        $totalArchived = Reservation::where('is_archive', 1)->count();

        return view('admin.reservations.archive', compact('reservations', 'totalArchived'));
    }

    public function moveToArchive($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->update(['is_archive' => 1]);

        return redirect()->route('reservations.index')->with('status', 'تم أرشفة الحجز بنجاح!');
    }

    // =========================
    // Archived
    // =========================
    public function archived()
    {
        $reservations = Reservation::where('is_archive', 1)
            ->where('is_delete', 0)
            ->with(['location', 'branch', 'department', 'service', 'doctor']) // إضافة العلاقات
            ->latest()
            ->paginate(10);

        return view('reservations.archived', compact('reservations'));
    }

    public function restore($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->update(['is_archive' => 0]);

        return redirect()->route('reservations.archive')->with('status', 'تم استعادة الحجز بنجاح!');
    }
}
