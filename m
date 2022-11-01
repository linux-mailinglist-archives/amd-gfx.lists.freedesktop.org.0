Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C3614F46
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Nov 2022 17:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B4B10E3F9;
	Tue,  1 Nov 2022 16:31:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A9510E3F9
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Nov 2022 16:31:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3F05616A1;
 Tue,  1 Nov 2022 16:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD84C433D6;
 Tue,  1 Nov 2022 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667320297;
 bh=beFa7xg5aKgKvDxmomMDzpM1jKDB1WUzp4AeIHwRHDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CSBeW+R6nBe/LlhwWE/3Q0Ij9d8HFwpxSqDuJqRFIfFkpmwCcbA4KHmW9OOiJmHYZ
 lmdH8zE+ByZjcrvkT9vXZbTyPu39TFsnsCOm+t2dyq8n37TLE7yc7g2+mifetL8Zbv
 E4gS1qDGvGaAPhzoYYsNaI4U7KPfRTugilCRGf0y8bm2A2gUWN5vTNguTXrFlPBKFY
 Y9w47XB3kdfFcS1M1WjwncQY1Z53diLniwb/D8MfZExZ4LiGAA2fOLLkSHMXKvcydN
 4O0YHlNZSVtNNlQcsUEWSFq+4JucS+WBssNBflaYOevY7s19smEU4XaryP2BtTxy+S
 RfQO+fYywLTbA==
Date: Tue, 1 Nov 2022 09:31:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH v4 1/1] drm/amd/display: add DCN support for ARM64
Message-ID: <Y2FJ5wXpEpKf9v/P@dev-arch.thelio-3990X>
References: <20221031193738.23538-1-hacc1225@gmail.com>
 <20221031193738.23538-2-hacc1225@gmail.com>
 <6b5fb93f-fd23-c96d-0f1d-ba8bcd7a5079@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b5fb93f-fd23-c96d-0f1d-ba8bcd7a5079@amd.com>
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
Cc: Ao Zhong <hacc1225@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 10:36:08AM -0400, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-10-31 15:37, Ao Zhong wrote:
> > After moving all FPU code to the DML folder, we can enable DCN support
> > for the ARM64 platform. Remove the -mgeneral-regs-only CFLAG from the
> > code in the DML folder that needs to use hardware FPU, and add a control
> > mechanism for ARM Neon.
> > 
> > Signed-off-by: Ao Zhong <hacc1225@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/display/Kconfig           |  3 ++-
> >   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    |  6 ++++++
> >   drivers/gpu/drm/amd/display/dc/dml/Makefile   | 20 +++++++++++++++----
> >   3 files changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> > index 0142affcdaa3..843a55a6a3ac 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -6,7 +6,8 @@ config DRM_AMD_DC
> >   	bool "AMD DC - Enable new display engine"
> >   	default y
> >   	select SND_HDA_COMPONENT if SND_HDA_CORE
> > -	select DRM_AMD_DC_DCN if (X86 || PPC64)
> > +	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> > +	select DRM_AMD_DC_DCN if (X86 || PPC64 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> >   	help
> >   	  Choose this option if you want to use the new display engine
> >   	  support for AMDGPU. This adds required support for Vega and
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > index ab0c6d191038..1743ca0a3641 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > @@ -31,6 +31,8 @@
> >   #elif defined(CONFIG_PPC64)
> >   #include <asm/switch_to.h>
> >   #include <asm/cputable.h>
> > +#elif defined(CONFIG_ARM64)
> > +#include <asm/neon.h>
> >   #endif
> >   /**
> > @@ -99,6 +101,8 @@ void dc_fpu_begin(const char *function_name, const int line)
> >   			preempt_disable();
> >   			enable_kernel_fp();
> >   		}
> > +#elif defined(CONFIG_ARM64)
> > +		kernel_neon_begin();
> >   #endif
> >   	}
> > @@ -136,6 +140,8 @@ void dc_fpu_end(const char *function_name, const int line)
> >   			disable_kernel_fp();
> >   			preempt_enable();
> >   		}
> > +#elif defined(CONFIG_ARM64)
> > +		kernel_neon_end();
> >   #endif
> >   	}
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > index d0c6cf61c676..d4e93bed1c8e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > @@ -33,6 +33,10 @@ ifdef CONFIG_PPC64
> >   dml_ccflags := -mhard-float -maltivec
> >   endif
> > +ifdef CONFIG_ARM64
> > +dml_rcflags := -mgeneral-regs-only
> > +endif
> > +
> >   ifdef CONFIG_CC_IS_GCC
> >   ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> >   IS_OLD_GCC = 1
> > @@ -55,8 +59,6 @@ frame_warn_flag := -Wframe-larger-than=2048
> >   endif
> >   CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
> > -
> > -ifdef CONFIG_DRM_AMD_DC_DCN
> >   CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
> >   CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_ccflags)
> >   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_ccflags)
> > @@ -88,7 +90,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calcs.o := $(dml_ccflags)
> >   CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_auto.o := $(dml_ccflags)
> >   CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_math.o := $(dml_ccflags) -Wno-tautological-compare
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
> > -CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn2x/dcn2x.o := $(dml_rcflags)
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_rcflags)
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_rcflags)
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_rcflags)
> > @@ -105,7 +106,18 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o := $(dml_rcf
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_rcflags)
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_rcflags)
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o  := $(dml_rcflags)
> > -endif
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn314/display_mode_vba_314.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn314/display_rq_dlg_calc_314.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn314/dcn314_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/dcn30_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn32/dcn32_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn321/dcn321_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn303/dcn303_fpu.o := $(dml_rcflags)
> > +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_math.o := $(dml_rcflags)
> >   CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
> >   CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
> >   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_rcflags)
> 
> lgtm,
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> Nathan,
> 
> If it is ok for you, I can merge this change.

Yes, this version looks good to me, as the code can no longer be built
for arm64 when using clang.

Cheers,
Nathan
