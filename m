Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B45340C8C
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Mar 2021 19:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024D16E159;
	Thu, 18 Mar 2021 18:12:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16966E159;
 Thu, 18 Mar 2021 18:12:21 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 f73-20020a9d03cf0000b02901b4d889bce0so6026993otf.12; 
 Thu, 18 Mar 2021 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Mp/bqm2YFp4NyDCzBjnGP7gif34FWuZnhrIj0q+jJI=;
 b=G1ah34xvIoECWz9i/TlzYs207EAkTumLJMTcgRZAZqEsFRP8j8vtS+i93OZj3Fwyh5
 xansT8QAg1v+0aj/4MNUhVTpxws8NOoOpiiflSJr5w4vTLn8pq1WMdIlo364jwNPSqui
 4xSvIr4Hc1qkThPAZ4IvN+DnKMv8YhW0MEIfn4pk+rhDViDvJ77t0P/LfM2E+nsWVGw/
 mfXolrgKVVJCeiUWRNPg2QqEDXRujI/F3HxEKKQAROAg/HwGXvLTkYW+gUb254UrZn+L
 4VmOyG2ITSZwEEUVjKFvDCArHXHADotUOZQNX+OdML050e5t+eWU9hL3jFyayQ32L4fH
 UwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Mp/bqm2YFp4NyDCzBjnGP7gif34FWuZnhrIj0q+jJI=;
 b=j4EcRWA9vOmJhdg4Y4I2PeveOTwyQjL22r7WQaeO74826In1Wu/dK2MxOBgRbaFRpX
 YIFpnoVINsw3pB9zmkzJE4saAyf9e/LQau5cnqS6j/a7gq8VKCzduXWsCn1KS2vi4W7K
 DnHIbJcq7eIFpAG/B8Ylo09sLBP6Exgz8P2tTAnsWT5SyvxHdadTQsX4WRQbzWHdfS8V
 6QkZ0iY7/TWIR83ICW/NETGyVqLkPsHqbb7wzKR8NBbJ6AXgHSurSSsCR7iBM7VJ2vjJ
 VUsbQPyVgA8IjUOkUKv1O6Dwt8QSj35MC1mdf2W6QC0bizLksddQ8GVV1uTKYL7Mq2rH
 Gteg==
X-Gm-Message-State: AOAM530DxGCwxAaqYs0FCnAwDD/Lip8/J366H5M09pL/zIItjgw3BvV0
 vDdzMBN2E5YDWcxXCmsaNGdi0sAJuHD0Y+iG5aI=
X-Google-Smtp-Source: ABdhPJwis+EdQ8GEL/sfDI7LNFt1XiDBiVCBHLPvZtHLfXfeeppuS/V3TIi6KXXkkyMkCPVpuaS2m8dXyFQ0/kRgwmo=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr6216093ots.23.1616091141211;
 Thu, 18 Mar 2021 11:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210318113308.1345-1-unixbhaskar@gmail.com>
 <b09b524c-1f3d-6231-29b9-f0eac3e77293@infradead.org>
In-Reply-To: <b09b524c-1f3d-6231-29b9-f0eac3e77293@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Mar 2021 14:12:10 -0400
Message-ID: <CADnq5_OsrHGxmXeuEiV06qas7jJ0pvExqdrw-PmqpKvWi=0jOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, "Chen,
 Guchun" <guchun.chen@amd.com>, Dave Airlie <airlied@linux.ie>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jiansong Chen <Jiansong.Chen@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, John Clements <John.Clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 2:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/18/21 4:33 AM, Bhaskar Chowdhury wrote:
> >
> > s/traing/training/
> >
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > index c325d6f53a71..db18e4f6cf5f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > @@ -661,7 +661,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
> >
> >       if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
> >               /*
> > -              * Long traing will encroach certain mount of bottom VRAM,
> > +              * Long training will encroach certain mount of bottom VRAM,
>
>                                                        amount
> I think.

Yeah, I think it should read something like:

Long training will encroach a certain amount on the bottom of VRAM;
save the content from the bottom VRAM to system memory
before training, and restore it after training to avoid
VRAM corruption.

Alex

>
> >                * saving the content of this bottom VRAM to system memory
> >                * before training, and restoring it after training to avoid
> >                * VRAM corruption.
> > --
> > 2.26.2
> >
>
>
> --
> ~Randy
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
