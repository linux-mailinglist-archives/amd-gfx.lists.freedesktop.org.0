Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228EF192C10
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2020 16:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE666E876;
	Wed, 25 Mar 2020 15:17:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E3A6E876
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Mar 2020 15:17:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c81so2885044wmd.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Mar 2020 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uEA+54Hh9e4roJE/BQRB7//YEiiD//3xbhLkMjASdjs=;
 b=ZZBNFzH3kgytGfJ84275fGBYyKN38aF+LXf/5gNenTC+SVqkV2bjnnnT/ioXTGn3oG
 LWRm3z1gVoWhR071Su5/gm9Lmxn8IW2YfNkbxqh1uo4R1mFijljS4FGt/RweeZm77Jrv
 X0m60jFDRkfWWJCMR45bj4oI0osZdCRTSiFZ2F9JjbnEoeYpnhrxwZzi6V8DzdXhr8SZ
 Wv3kgh/JvehxbETD/01+1rtZwQ7QWnQqPAZZCrdg5wLb8bJUjU+btbzNM6M+/cwjGXEf
 QbHR8TAPXgcy20jGx67DbzdqTDOgxI7j73+jfslFtHwRF81z9l66HQ+DR9F3r/c6Ieex
 HTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uEA+54Hh9e4roJE/BQRB7//YEiiD//3xbhLkMjASdjs=;
 b=LolI5foboZ/Zlbze+mgKE1BGKz6b0vajSo+6KOh/YIcA45o6zNrnqaq5p9lBrJHJJT
 rGhrna5A8S3p54+dHJNeauwigyDURRcM/oT43/b1Vzed0JIKP8GMGEeX9zIXif4JfQaJ
 a6ctDrmb/kDwVs4H9Cw1tuRLQWZWhbTzOxwnOVgjlQXIRHT1lFsLHp0VIgshyIYaOfrL
 jJuHBw10M0kthSM9r644bhnj9l9X9caGa19tIhxgRrMaPHZ9GuvI041kEzNxF2tC16pD
 WG1WNe+dQXVRxHJK5CMymBuSSV9trkoQNoBL0yIpkb+mgv00VzT4QnA270E/sc/0qbNH
 I3fg==
X-Gm-Message-State: ANhLgQ2hLTTCNMieukkGG8GMunde1MTDw/+zWgNo/SIm8W35HTY1oOqo
 RxSLJlFGer2q4PzopL0I8qTMZo3xDhW5souNV5k=
X-Google-Smtp-Source: ADFU+vvLZAP5+2BKp5weODRIZLygODHVPW1olTVA2GPLhk4BOyHH48ZZ3BdeSRShrT9UgyIe4W5+sAC+P9DFsS0Ye6c=
X-Received: by 2002:a1c:2842:: with SMTP id o63mr3947271wmo.73.1585149457715; 
 Wed, 25 Mar 2020 08:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <1585125181-14195-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1585125181-14195-1-git-send-email-Emily.Deng@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Mar 2020 11:17:26 -0400
Message-ID: <CADnq5_NAehRZ7x4J_UO_J8L6Axro6Zy+wNrGaV2wNErRA-Z_rg@mail.gmail.com>
Subject: Re: [PATCH 2/4] SWDEV-227334 - No need support vcn decode
To: Emily Deng <Emily.Deng@amd.com>
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

On Wed, Mar 25, 2020 at 4:33 AM Emily Deng <Emily.Deng@amd.com> wrote:
>
> As no need to support vcn decode feature, so diable the
> ring.
>
> Signed-off-by: Emily Deng <Emily.Deng@amd.com>

Please fix the patch title prefix to drm/amdgpu.  An additional comment below.

> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index ec8091a..febd4c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -223,6 +223,10 @@ static int vcn_v2_0_hw_init(void *handle)
>         if (r)
>                 goto done;
>
> +       //Disable vcn decode for sriov

Please use C style comments.

With those fixed, the patch is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


> +       if (amdgpu_sriov_vf(adev))
> +               ring->sched.ready = false;
> +
>         for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>                 ring = &adev->vcn.inst->ring_enc[i];
>                 r = amdgpu_ring_test_helper(ring);
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
