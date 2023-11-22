Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6377F4880
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Nov 2023 15:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E64210E64D;
	Wed, 22 Nov 2023 14:05:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA26E10E5E1;
 Wed, 22 Nov 2023 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D5blU8RG7wrWZ9Dq/ESX/eAs3vI1C5+aiUl11b64TJI=; b=IkSrqbabsxJtFB+ZQhe2j8K6x6
 gmah3bew0TPP0ysiQgpNZUFrCqPuz5lHJ+SRgg6OImxizgLz7xojou4jvO85FIqRpS8QO0tAUdKHE
 rA4Uw6YYjcm+0HTujZSCoMbzEXPyjWNDQi5h4dJLM9wM/Ln2IYZXZY/WTR+WxIMJhILJ9DeeFlb8z
 Sh9AFZK843MfY4JIxtlkW0I9zICdKW+ntXEodBFLQaC6YNvuXWjW87h+UB/TmK1UMAkUGI6VTa+3d
 vVnSMTFNScSJr0L8JDnsTrn8iTyZqAK/m1GbJ6lYvAbf33DcWE787BrnJDz6876cmhrbYs26CtV3T
 0kSji68g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r5imd-0015Nr-35; Wed, 22 Nov 2023 08:40:31 +0000
Date: Wed, 22 Nov 2023 00:40:31 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <ZV2+f/yu3C6xTVqn@infradead.org>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-4-samuel.holland@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 22 Nov 2023 14:05:10 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Nicolas Schier <nicolas@fjasle.eu>,
 Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Pan Xinhui <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

> -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
> +	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
> +	select DRM_AMD_DC_FP if RISCV && FPU
> +	select DRM_AMD_DC_FP if LOONGARCH || X86

This really is a mess.  Can you add a ARCH_HAS_KERNEL_FPU_SUPPORT
symbol that all architetures that have it select instead, and them
make DRM_AMD_DC_FP depend on it?

> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>  		kernel_fpu_begin();
>  #elif defined(CONFIG_PPC64)
>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> @@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
>  
>  	depth = __this_cpu_dec_return(fpu_recursion_depth);
>  	if (depth == 0) {
> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>  		kernel_fpu_end();
>  #elif defined(CONFIG_PPC64)
>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))

And then this mess can go away.  We'll need to decide if we want to
cover all the in-kernel vector support as part of it, which would
seem reasonable to me, or have a separate generic kernel_vector_begin
with it's own option.

> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index ea7d60f9a9b4..5c8f840ef323 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
>  dml_rcflags := -msoft-float
>  endif
>  
> +ifdef CONFIG_RISCV
> +include $(srctree)/arch/riscv/Makefile.isa
> +# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
> +dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifneq ($(call gcc-min-version, 70100),y)
>  IS_OLD_GCC = 1

And this is again not really something we should be doing.
Instead we need a generic way in Kconfig to enable FPU support
for an object file or set of, that the arch support can hook
into.

Btw, I'm also really worried about folks using the FPU instructions
outside the kernel_fpu_begin/end windows in general (not directly
related to the RISC-V support).  Can we have objecttool checks
for that similar to only allowing the unsafe uaccess in the
uaccess begin/end pairs?
