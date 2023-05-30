Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D53717788
	for <lists+amd-gfx@lfdr.de>; Wed, 31 May 2023 09:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3877E10E487;
	Wed, 31 May 2023 07:07:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF4E10E442
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 May 2023 23:08:29 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-64d41d8bc63so4025696b3a.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 May 2023 16:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685488108; x=1688080108;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I1XTjeSWZcGMiJuWL5FVq0CXwJ+1oPVvZhAeV/ZW9Hg=;
 b=c4fmrcom4NDh8NHKSBNUSY9k0wao+F4b7jO+o1GuQ+qpu0ilHov/G220o8+Ox9h4SV
 TNsy+GphzgRm607k6xxkGjPbVKpLlrAApnvHCEZEb7+5c4BJEibcWbcO/6oMExiwdAwO
 UBmDN59ZMnn8jQZuQ/rFDtLP/3OsxSDovSr60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685488108; x=1688080108;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1XTjeSWZcGMiJuWL5FVq0CXwJ+1oPVvZhAeV/ZW9Hg=;
 b=AN/0DDHk/rDZmzq0MwKF83wpPLhmjcLQmGLuA/PwmiGLHkeNrPVM8CLfPH7kibQPW7
 g6hIxa6BQL4kl2KlkpDo043E0vL2oQ5l3Vb852jMxQWOaLnRjDn8qyJM6zX0vQDMRaxJ
 nXn45YgH+21AzjuFZbGBsRehHkcWI/H9didvf3r2lE4CAokBiI7HkxqzIOp/R25EkhPX
 lJkAkDC5LbImM1p3sOnvdhhvRzY8VqEO5Tg2E8jxv0lD8lvR0rmDmuwl4qvSy95nFP60
 EfAo8C42QL3eEn9bpnqqc00VzQNrpWLGmw4yuDnpXQdClqbJKSR9mSkGXEhjNXrelHHE
 m3lw==
X-Gm-Message-State: AC+VfDwrWXDxn/m5i01P5zpRDueOG+vKkOHVd0kNdndjUXHyE6XpYf95
 02PGXwmorAwlXFQ2BH6rpdNsZA==
X-Google-Smtp-Source: ACHHUZ7J6pxCYiDXPce2YlnpWudvs+EEkyDWcM4lsiSyFIay8ZQqbkdVA4ksi4O11VIcUrBrzz7+Mw==
X-Received: by 2002:a05:6a00:16c9:b0:64f:835c:a9ff with SMTP id
 l9-20020a056a0016c900b0064f835ca9ffmr5606232pfc.12.1685488108392; 
 Tue, 30 May 2023 16:08:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 g16-20020a62e310000000b0064d74808738sm2068241pfh.214.2023.05.30.16.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 16:08:27 -0700 (PDT)
Date: Tue, 30 May 2023 16:08:27 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/amdgpu/discovery: Replace fake flex-arrays
 with flexible-array members
Message-ID: <202305301608.2982BD3CAF@keescook>
References: <ZHO4/Z+iO+lqV4rW@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZHO4/Z+iO+lqV4rW@work>
X-Mailman-Approved-At: Wed, 31 May 2023 07:07:45 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, May 28, 2023 at 02:26:37PM -0600, Gustavo A. R. Silva wrote:
> Zero-length and one-element arrays are deprecated, and we are moving
> towards adopting C99 flexible-array members, instead.
> 
> Use the DECLARE_FLEX_ARRAY() helper macro to transform zero-length
> arrays in a union into flexible-array members. And replace a one-element
> array with a C99 flexible-array member.
> 
> Address the following warnings found with GCC-13 and
> -fstrict-flex-arrays=3 enabled:
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1009:89: warning: array subscript kk is outside array bounds of ‘uint32_t[0]’ {aka ‘unsigned int[]’} [-Warray-bounds=]
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1007:94: warning: array subscript kk is outside array bounds of ‘uint64_t[0]’ {aka ‘long long unsigned int[]’} [-Warray-bounds=]
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1310:94: warning: array subscript k is outside array bounds of ‘uint64_t[0]’ {aka ‘long long unsigned int[]’} [-Warray-bounds=]
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1309:57: warning: array subscript k is outside array bounds of ‘uint32_t[0]’ {aka ‘unsigned int[]’} [-Warray-bounds=]
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/21
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/300
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
