Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222F33ACFC
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Mar 2021 09:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988A489D66;
	Mon, 15 Mar 2021 08:04:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE4B89F63
 for <amd-gfx@lists.freedesktop.org>; Sun, 14 Mar 2021 10:01:27 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw7264Z4z9sWH; Sun, 14 Mar 2021 21:01:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, geert@linux-m68k.org,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
References: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Fix missing declaration of
 [en/dis]able_kernel_vsx()
Message-Id: <161571587339.138988.8288160163932312489.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:18 +1100 (AEDT)
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:04:21 +0000
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
Cc: alexdeucher@gmail.com, linuxppc-dev@lists.ozlabs.org,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, 9 Mar 2021 08:39:39 +0000 (UTC), Christophe Leroy wrote:
> Add stub instances of enable_kernel_vsx() and disable_kernel_vsx()
> when CONFIG_VSX is not set, to avoid following build failure.
> 
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o
> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:37,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:27:
> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In function 'dcn_bw_apply_registry_override':
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:64:3: error: implicit declaration of function 'enable_kernel_vsx'; did you mean 'enable_kernel_fp'? [-Werror=implicit-function-declaration]
>    64 |   enable_kernel_vsx(); \
>       |   ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:640:2: note: in expansion of macro 'DC_FP_START'
>   640 |  DC_FP_START();
>       |  ^~~~~~~~~~~
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:75:3: error: implicit declaration of function 'disable_kernel_vsx'; did you mean 'disable_kernel_fp'? [-Werror=implicit-function-declaration]
>    75 |   disable_kernel_vsx(); \
>       |   ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:676:2: note: in expansion of macro 'DC_FP_END'
>   676 |  DC_FP_END();
>       |  ^~~~~~~~~
> cc1: some warnings being treated as errors
> make[5]: *** [drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o] Error 1

Applied to powerpc/fixes.

[1/1] powerpc: Fix missing declaration of [en/dis]able_kernel_vsx()
      https://git.kernel.org/powerpc/c/bd73758803c2eedc037c2268b65a19542a832594

cheers
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
