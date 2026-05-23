@extends('layouts.maysan')

@section('title', 'الرئسية')

@section('content')
<!-- ===== HERO SECTION ===== -->
<section id="home" class="relative h-screen min-h-[650px] md:min-h-[800px] overflow-hidden mt-24 md:mt-40">

    <!-- Slides -->
    @foreach ($galleryImages as $image)
    <div class="hero-slide {{ $loop->first ? 'active' : '' }} absolute inset-0 w-full h-full transition-opacity duration-700">

        <img src="{{ asset('storage/' . $image->path) }}"
            alt="عيادة تجميل"
            class="w-full h-full object-cover object-center">

        <div class="absolute inset-0 bg-gradient-to-l from-brand-900/70 via-brand-900/70 to-brand-900/40"></div>
    </div>
    @endforeach

    <!-- Hero Content -->
    <div class="absolute inset-0 flex items-center z-10">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
            <div class="max-w-2xl">

            </div>
        </div>
    </div>

    <!-- Slider Controls -->
    <div class="absolute bottom-10 left-1/2 -translate-x-1/2 z-20 flex items-center gap-4">
        <button id="prevSlide" class="w-11 h-11 rounded-full bg-white/10 backdrop-blur-sm border border-white/20 flex items-center justify-center text-white hover:bg-white/20 transition-all">
            <i data-lucide="chevron-right" class="w-5 h-5"></i>
        </button>
        <div class="flex items-center gap-2" id="dotsContainer">
            <div class="dot active" data-index="0"></div>
            <div class="dot" data-index="1"></div>
            <div class="dot" data-index="2"></div>
            <div class="dot" data-index="3"></div>
        </div>
        <button id="nextSlide" class="w-11 h-11 rounded-full bg-white/10 backdrop-blur-sm border border-white/20 flex items-center justify-center text-white hover:bg-white/20 transition-all">
            <i data-lucide="chevron-left" class="w-5 h-5"></i>
        </button>
    </div>

    <!-- Scroll indicator -->
    <div class="absolute bottom-10 right-8 z-20 hidden lg:flex flex-col items-center gap-2 text-white/50">
        <span class="text-xs tracking-widest rotate-180" style="writing-mode: vertical-rl;">اكتشفي المزيد</span>
        <div class="w-[1px] h-12 bg-white/30 relative overflow-hidden">
            <div class="w-full h-4 bg-gold-400 absolute animate-bounce"></div>
        </div>
    </div>
</section>



<!-- ===== STATS BAR ===== -->
<section class="relative z-10 -mt-16">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="bg-white rounded-2xl shadow-2xl shadow-brand-800/10 p-6 sm:p-8 grid grid-cols-2 lg:grid-cols-4 gap-6 reveal">

            @foreach ($stats as $stat)
            <div class="counter-box text-center p-4 rounded-xl bg-brand-50/50">
                <div class="text-3xl lg:text-4xl font-black text-brand-800 mb-1" data-count="{{ $stat->number }}">0</div>
                <div class="text-sm text-gray-500">{{ $stat->title_ar }}</div>
            </div>
            @endforeach
        </div>
    </div>
</section>

@include('includes.working')
@include('includes.departments')
@include('includes.tobooking')
@include('includes.before-after')
@include('includes.reviewscta')
@include('includes.doctors')
@include('includes.viewreviews')
@include('includes.articals')


<script>
    // Initialize Lucide Icons


    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.dot');
    const progressBar = document.getElementById('slideProgress');
    let currentSlide = 0;
    let slideInterval;
    const slideDuration = 5000;

    // التحقق من وجود سلايدات لتجنب الأخطاء
    if (slides.length > 0) {
        function goToSlide(index) {
            slides[currentSlide].classList.remove('active');
            dots[currentSlide].classList.remove('active');
            currentSlide = index;
            slides[currentSlide].classList.add('active');
            dots[currentSlide].classList.add('active');
            resetProgress();
        }

        function nextSlide() {
            goToSlide((currentSlide + 1) % slides.length);
        }

        function prevSlide() {
            goToSlide((currentSlide - 1 + slides.length) % slides.length);
        }

        function resetProgress() {
            if (!progressBar) return;
            progressBar.style.transition = 'none';
            progressBar.style.width = '0%';
            setTimeout(() => {
                progressBar.style.transition = `width ${slideDuration}ms linear`;
                progressBar.style.width = '100%';
            }, 50);
        }

        function startAutoSlide() {
            clearInterval(slideInterval);
            slideInterval = setInterval(nextSlide, slideDuration);
            resetProgress();
        }

        document.getElementById('nextSlide').addEventListener('click', () => {
            nextSlide();
            startAutoSlide();
        });

        document.getElementById('prevSlide').addEventListener('click', () => {
            prevSlide();
            startAutoSlide();
        });

        dots.forEach(dot => {
            dot.addEventListener('click', () => {
                goToSlide(parseInt(dot.dataset.index));
                startAutoSlide();
            });
        });

        // Touch/Swipe support for hero
        let touchStartX = 0;
        const heroSection = document.getElementById('home');
        heroSection.addEventListener('touchstart', e => {
            touchStartX = e.changedTouches[0].screenX;
        });
        heroSection.addEventListener('touchend', e => {
            const diff = touchStartX - e.changedTouches[0].screenX;
            if (Math.abs(diff) > 50) {
                if (diff > 0) nextSlide();
                else prevSlide();
                startAutoSlide();
            }
        });

        startAutoSlide();
    }
</script>
@endsection
