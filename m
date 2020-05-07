Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50F1C8B61
	for <lists+amd-gfx@lfdr.de>; Thu,  7 May 2020 14:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23336E97D;
	Thu,  7 May 2020 12:52:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0943C6E97D
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 May 2020 12:52:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v8so7442024wma.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 07 May 2020 05:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wlxigA5kAanyWBB1m7Ouv48qMTdGXDPOwMv/4YVOSeE=;
 b=lgUt97acpgq4MshuD3+tMA3Wt4X3AoDOj3osp6SIn5KcpL4NKG7Ggz4mBy247QIG4W
 1+JfMKY8CkdK9b9Z05kTJSiMGvw8fLleTmNkku+QxFQgR8CErQW2AFUQBf5cEuSUQX/f
 vVpZY74pIRtvX9IRauL5jDmsqOdKVzDg6Q7NRfi1M9TWBu4D8qfD44/IK1WfaaNLksfL
 Q8GRSr3xrVu9KUXNPpSxTut8wrvVs3Idryy29KDBR6q3V9hovsA/DdnQLEHEjsxhDBIV
 g8wviOy6PIjI7Q041S80LJ1bDIH/12Bz70gyw5yletAMB+jE2kHRhCbQNPOQ9vqvWyuA
 agSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wlxigA5kAanyWBB1m7Ouv48qMTdGXDPOwMv/4YVOSeE=;
 b=F+IZDRUnkM/EpFePEf1nn9vgkU62jjP9KMzhZgCuvEvX6FGujJwLt0y/XmNJmVILav
 EZNYEFjAzvSiFPrVO/3RKIihn7pV4Ze77HER2Ix3R+QT4uEeca/1AdhPkn+o0OPyGj4J
 PFCAmrP2ik1zPrTRS4L86Oc14FtvyMXYMuYd6ErWmH6fBuHJn52/Krkl9N7tjjEbRl0C
 z03LNBUXSFrRliPHvkonKOr6LkDgjoDBPCeTrO6IEbGpM1FQfY2rg/UK5TPHf2BqXPki
 LNwZFF+S9GCd/dj4KFRlkiqhqQ0IlOufd13F76P4dZ6CWOSWXJ9jcty+W+VNHqlfzEge
 GXPQ==
X-Gm-Message-State: AGi0PuZAMGRJ8HQ4nqfgFtd4eulXD7eQtJTI1a6io27Y7tXMunM4J8vO
 2GfnPcUpl2w4F+aIyIwjFw8isNhpPxqULcvMU1w7+Q==
X-Google-Smtp-Source: APiQypI4eTKlwfVHazXjdLXIWOfqwOJiMBtezFrfvpYFviQFi/kCkIbWiJF8prENQVxVzmVbQm9i1CQj08QOW4mhfLI=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr10558390wme.79.1588855972684; 
 Thu, 07 May 2020 05:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200507123804.8376-1-tom.stdenis@amd.com>
In-Reply-To: <20200507123804.8376-1-tom.stdenis@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 May 2020 08:52:41 -0400
Message-ID: <CADnq5_PT3Qot17aE5GpRyU3Uag7GNbkfbApoojiQwqjpqCCUsA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add raven1 part to the gfxoff quirk list
To: Tom St Denis <tom.stdenis@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, May 7, 2020 at 8:38 AM Tom St Denis <tom.stdenis@amd.com> wrote:
>
> On my raven1 system (rev c6) with VBIOS 113-RAVEN-114 GFXOFF is
> not stable (resulting in large block tiling noise in some applications).
>
> Disabling GFXOFF via the quirk list fixes the problems for me.
>
> Signed-off-by: Tom St Denis <tom.stdenis@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index fbd54d347d91..1573ac1f03b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -1233,6 +1233,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
>         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc8 },
>         /* https://bugzilla.kernel.org/show_bug.cgi?id=207171 */
>         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
> +       /* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
> +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
>         { 0, 0, 0, 0, 0 },
>  };
>
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
