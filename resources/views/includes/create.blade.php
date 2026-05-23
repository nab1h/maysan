<div class="min-h-screen bg-gray-50 flex items-center justify-center py-10 px-4 sm:px-6 lg:px-8">
    <div class="w-full max-w-6xl mx-auto bg-white rounded-3xl shadow-2xl shadow-[#135158]/10 flex flex-col lg:flex-row overflow-hidden border border-gray-100">

        <!-- النصف الأيمن: الصورة والديكور (مخفي في الموبايل، يظهر في الشاشات الكبيرة) -->
        <div class="hidden lg:block lg:w-1/2 relative bg-cover bg-center" style="background-image: url('booking.jpg');">
            <!-- تدرج لوني فوق الصورة لجعل النص مقروء وإعطاء طابع فاخر -->
            <div class="absolute inset-0 bg-gradient-to-t from-[#135158] via-[#135158]/80 to-[#135158]/40"></div>
        </div>

        <!-- النصف الأيسر: الفورم -->
        <div class="w-full lg:w-1/2 p-8 md:p-12 relative overflow-y-auto max-h-[90vh]">

            <!-- هيدر يظهر في الموبايل فقط -->
            <div class="lg:hidden text-center mb-8">
                <h2 class="text-3xl font-bold text-[#135158]">احجز موعدك الآن</h2>
                <p class="text-gray-500 text-sm mt-2">اختاري الوقت المناسب لك ودعي العناية تبدأ</p>
            </div>

            <!-- Error Message -->
            <div id="formErrorMessage" class="hidden mb-6 bg-red-50 border border-red-200 text-red-700 rounded-xl p-4 text-sm">
                <ul id="errorList" class="list-disc list-inside"></ul>
            </div>

            <!-- 1. حاوية الفورم -->
            <div id="formWrapper">
                <form id="reservationForm" action="{{ route('reservations.store') }}" method="POST" class="space-y-6">
                    @csrf

                    <!-- القسم الأول: تفاصيل الموعد -->
                    <div class="space-y-4">
                        <h3 class="text-lg font-bold text-gray-900 flex items-center gap-2">
                            <span class="w-7 h-7 rounded-full bg-[#135158] text-white flex items-center justify-center text-xs">1</span>
                            تفاصيل الموعد
                        </h3>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">المدينة</label>
                                <select name="location_id" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                                    <option value="">اختاري المدينة</option>
                                    @foreach($locations as $location)
                                    <option value="{{ $location->id }}" {{ request('location_id') == $location->id ? 'selected' : '' }}>{{ $location->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">الفرع</label>
                                <select required name="branch_id" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                                    <option value="">اختاري الفرع</option>
                                    @foreach($branches as $branch)
                                    <option value="{{ $branch->id }}" {{ request('branch_id') == $branch->id ? 'selected' : '' }}>{{ $branch->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">القسم</label>
                                <select name="department_id" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                                    <option value="">اختاري القسم</option>
                                    @foreach($departments as $department)
                                    <option value="{{ $department->id }}" {{ request('department_id') == $department->id ? 'selected' : '' }}>{{ $department->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">الخدمة</label>
                                <select name="service_id" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                                    <option value="">اختاري الخدمة</option>
                                    @foreach($services as $service)
                                    <option value="{{ $service->id }}" {{ request('service_id') == $service->id ? 'selected' : '' }}>{{ $service->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="sm:col-span-2">
                                <label class="block text-sm font-medium text-gray-700 mb-1">الطبيب (اختياري)</label>
                                <select name="doctor_id" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                                    <option value="">اختاري الطبيب</option>
                                    @foreach($doctors as $doctor)
                                    <option value="{{ $doctor->id }}" {{ request('doctor_id') == $doctor->id ? 'selected' : '' }}>{{ $doctor->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">التاريخ المفضل</label>
                                <input type="date" name="reservation_date" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">الوقت المفضل</label>
                                <input type="time" name="reservation_time" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                            </div>
                        </div>
                    </div>

                    <!-- القسم الثاني: البيانات الشخصية -->
                    <div class="space-y-4 pt-4 border-t border-gray-100">
                        <h3 class="text-lg font-bold text-gray-900 flex items-center gap-2">
                            <span class="w-7 h-7 rounded-full bg-[#135158] text-white flex items-center justify-center text-xs">2</span>
                            بياناتك الشخصية
                        </h3>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="sm:col-span-2">
                                <label class="block text-sm font-medium text-gray-700 mb-1">الاسم بالكامل</label>
                                <input type="text" name="name" placeholder="مثال: فاطمة أحمد" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">رقم الجوال</label>
                                <input type="tel" name="phone" placeholder="05xxxxxxxx" dir="ltr" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm text-left">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">البريد الإلكتروني (اختياري)</label>
                                <input type="email" name="email" placeholder="email@example.com" dir="ltr" class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm text-left">
                            </div>

                            <div class="sm:col-span-2">
                                <label class="block text-sm font-medium text-gray-700 mb-1">رسالتك (اختياري)</label>
                                <textarea name="message" rows="3" placeholder="اكتب رسالتك أو استفسارك هنا..." class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-[#135158] transition text-sm resize-none"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- زر الحجز -->
                    <div class="pt-2">
                        <button type="submit" id="submitBtn" class="w-full bg-[#135158] text-white font-bold py-3.5 rounded-xl hover:bg-[#1a6b73] transition-all duration-300 transform hover:scale-[1.02] shadow-lg shadow-[#135158]/30 text-lg flex items-center justify-center gap-2">
                            <span id="submitText">تأكيد الحجز</span>
                            <svg id="submitSpinner" class="hidden animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>

            <!-- 2. حاوية رسالة النجاح -->
            <div id="successWrapper" class="hidden flex flex-col items-center justify-center h-full text-center py-10">
                <div class="w-20 h-20 bg-green-50 rounded-full flex items-center justify-center mx-auto mb-6 border-4 border-green-100">
                    <i class="fas fa-check-circle text-green-500 text-4xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-2">تم الحجز بنجاح!</h3>
                <p class="text-gray-500 mb-8">هل تريد حجز موعد آخر؟</p>

                <div id="successActions" class="flex flex-col sm:flex-row justify-center gap-3 w-full max-w-sm">
                    <button id="btnAnotherBooking" class="bg-[#135158] text-white font-bold py-3 px-6 rounded-xl hover:bg-[#1a6b73] transition-all duration-300 shadow-lg shadow-[#135158]/20 flex items-center justify-center gap-2">
                        <i class="fas fa-plus"></i> نعم، حجز آخر
                    </button>
                    <button id="btnNoThanks" class="bg-gray-100 text-gray-700 font-bold py-3 px-6 rounded-xl hover:bg-gray-200 transition-all duration-300 border border-gray-200">
                        لا، شكراً
                    </button>
                </div>

                <!-- رسالة تظهر إذا اختار "لا" -->
                <div id="thankYouMsg" class="hidden mt-8 text-[#135158] font-semibold text-lg">
                    <p>شكراً لتواصلك معنا! سنتواصل معك قريباً لتأكيد الموعد.</p>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- كود الجافاسكريبت -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('reservationForm');
        const formWrapper = document.getElementById('formWrapper');
        const successWrapper = document.getElementById('successWrapper');
        const errorBox = document.getElementById('formErrorMessage');
        const errorList = document.getElementById('errorList');
        const submitBtn = document.getElementById('submitBtn');
        const submitText = document.getElementById('submitText');
        const submitSpinner = document.getElementById('submitSpinner');

        const btnAnotherBooking = document.getElementById('btnAnotherBooking');
        const btnNoThanks = document.getElementById('btnNoThanks');
        const successActions = document.getElementById('successActions');
        const thankYouMsg = document.getElementById('thankYouMsg');

        form.addEventListener('submit', function(e) {
            e.preventDefault();

            errorBox.classList.add('hidden');
            errorList.innerHTML = '';

            submitBtn.disabled = true;
            submitText.textContent = 'جاري الإرسال...';
            submitSpinner.classList.remove('hidden');

            const formData = new FormData(form);

            fetch(form.action, {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                        'Accept': 'application/json',
                    }
                })
                .then(response => {
                    if (response.ok) return response.json();
                    return response.json().then(err => {
                        throw err;
                    });
                })
                .then(data => {
                    formWrapper.classList.add('hidden');
                    successWrapper.classList.remove('hidden');

                    submitBtn.disabled = false;
                    submitText.textContent = 'تأكيد الحجز';
                    submitSpinner.classList.add('hidden');
                    form.reset();

                    successActions.classList.remove('hidden');
                    thankYouMsg.classList.add('hidden');
                })
                .catch(error => {
                    submitBtn.disabled = false;
                    submitText.textContent = 'تأكيد الحجز';
                    submitSpinner.classList.add('hidden');

                    if (error.errors) {
                        let errorsHtml = '';
                        for (let key in error.errors) {
                            error.errors[key].forEach(msg => {
                                errorsHtml += `<li>${msg}</li>`;
                            });
                        }
                        errorList.innerHTML = errorsHtml;
                        errorBox.classList.remove('hidden');
                    } else {
                        errorList.innerHTML = '<li>حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.</li>';
                        errorBox.classList.remove('hidden');
                    }
                });
        });

        btnAnotherBooking.addEventListener('click', function() {
            successWrapper.classList.add('hidden');
            formWrapper.classList.remove('hidden');
        });

        btnNoThanks.addEventListener('click', function() {
            successActions.classList.add('hidden');
            thankYouMsg.classList.remove('hidden');
        });
    });
</script>
