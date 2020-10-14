Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913128E6C3
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Oct 2020 20:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8686EB33;
	Wed, 14 Oct 2020 18:53:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3889D02
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 18:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/f2tj7o2fCCAStmJQdH+6DZ0/JQnBrKtT9HE22TGbUo=; b=Kwnt0nedv79S/uFsOAIag9G/P7
 ssDCGqUTBdNGlH/e2PhrjZWhaeJAPaFB1GKxNrmijSW4EuEL0im/RZMXotKfnSoh7lo+nvBudDVAR
 N1rPS/JnqOWpnCueixGy9iW7DEx3FLDDI6nh1yrohOCnrnta9vh6+WkCZQo2LjDW6p3nsoNiDfQCq
 HtjE91IeDDYlinZE6oFxjKyexdWZyFaX9LR5/kUOHhwUI6ubYHLMYBfEFA406SCQs6me/EH/jhUb/
 9tF1D/elccDYAk/rwPSncmFzQzSQRlWQb2WrMsWWdUy3jU4PpciAhNMnuIwjrr23HN/ishU+uvL7j
 68gQX8QA==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSlgW-0000wj-L7; Wed, 14 Oct 2020 18:39:37 +0000
Subject: Re: [PATCH] drm/amdgpu/display: DRM_AMD_DC_DCN3_02 depends on
 DRM_AMD_DC_DCN3_01
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20201014175507.973772-1-alexander.deucher@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eae6e70d-c5d2-bab9-4dfb-d48d2696effd@infradead.org>
Date: Wed, 14 Oct 2020 11:39:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201014175507.973772-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 14 Oct 2020 18:53:58 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 10/14/20 10:55 AM, Alex Deucher wrote:
> Fix this to avoid build problems if DRM_AMD_DC_DCN3_02 is defined, but
> DRM_AMD_DC_DCN3_01 is not.
> 
> Fixes: 36d26912e8d854 ("drm/amd/display: Add support for DCN302 (v2)")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/gpu/drm/amd/display/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 5906778627f0..93cdcd1ee9ff 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -45,6 +45,7 @@ config DRM_AMD_DC_DCN3_01
>  config DRM_AMD_DC_DCN3_02
>          bool "DCN 3.02 family"
>          depends on DRM_AMD_DC_DCN3_0
> +        depends on DRM_AMD_DC_DCN3_01
>          help
>              Choose this option if you want to have
>              Dimgrey_cavefish support for display engine
> 


-- 
~Randy
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
