Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3965740B4
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Jul 2022 02:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827DB18AFFA;
	Thu, 14 Jul 2022 00:59:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD759F77E
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jul 2022 23:27:04 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id e69so460814ybh.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jul 2022 16:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLq1U+d1bmcNfWsFJ6K/IL9XxkkFgeH5akYdfwOXkK0=;
 b=FBksoOy+S0aCWxyI2UXUB//mYF0XarHhcELqYLWfX3aGKjJxSFOD66c7QrR8mpgvCh
 ml1NaWom7AqZ77+nocy4d9LotD5hYlTKy5970upnY2Gv00mmNhdx5Zx8p6JhT1ACiZvo
 wkTY46EsuUBjwFTrS+n79bQRzJI4cWK1C8+NeuN7ggVr53XJHDy8ddXfdytSOz2Q1SN0
 1RC1HFTkSFmAzlO2eYvoLQYCopfJY2AUgxgaiQGtlJ/+eSb4qqrOdXilLT+6WLc4nKk7
 SppEjQZXkFXd/egJyHTziLcw1TVnnVxpDRCgtJ+0WdijwURE2AwGUivYMsc1azFQLp8p
 g+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLq1U+d1bmcNfWsFJ6K/IL9XxkkFgeH5akYdfwOXkK0=;
 b=LlTwL1KdHkq1hm1zAgXRb6YsW1REe+r7CuQPX886X3QjsxSIY6I4BSPXk3tX0dODee
 RO6QaP0biZb9ZeaDQ2fYf6MB8wiEDUWC97vCJvUeDpdihXgo0kzVJ3bWyzOENH+jw71m
 kt5VQZdYzOZQTXsX5RDxrPC2/BbE31ewYC1rb+Fkt0iZIx5K0xmf2iAUpNNFM5HiJ40U
 A9+3E/F2oYVkcV79LldmoNr7VXtzSQ6zBnS01yB8Uo5zzUd3Xus1tWvHB0SvpLXwF6Gj
 bIvBXEMqOvPfV//65WWak7hp2/L98Wrm3P1SQiudNC0tiM7I7v6sMnkHYzxeN7o0Ryg+
 cUbw==
X-Gm-Message-State: AJIora9cE4zZs3cqStOeM73rsFE4KmUxuM2cvMhOwxUwBjEIruEXsqOk
 ok5k60rapXV4Z0Ld8lnxB0ivs4NXrTUKyMH5HjM=
X-Google-Smtp-Source: AGRyM1tf2PHunlzOKcP68GnhEt7k26NxZu9hWDuRWB/2Njj21U6X5rwz525eL9VplaSor2/TBOx6Em3oBgtWDaurbG8=
X-Received: by 2002:a5b:20d:0:b0:66e:3b19:82c5 with SMTP id
 z13-20020a5b020d000000b0066e3b1982c5mr6229993ybl.517.1657754823917; Wed, 13
 Jul 2022 16:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgTmGaToVFdSdoFqT2sNkk7jg2rSWasUYv-tASUZ2j_0Q@mail.gmail.com>
 <20220713050724.GA2471738@roeck-us.net>
 <CAHk-=widUqghhXus_GCM9+FESa5vHqMb_pO3=0dGYH8C+yix2w@mail.gmail.com>
 <Ys8hqoiN5iWbslsM@shell.armlinux.org.uk>
 <CAHk-=wjNxyXQqn=k0KipzUPoBYWQhUwybxee8GTkF_Oz6RPVFw@mail.gmail.com>
 <CADVatmMJ4f+3-z1SWOSXuygee3fMsLqjcWhEY=NLhSCj61OB5Q@mail.gmail.com>
 <CAHk-=wgUGp96_Wup3=Utws=Mn+07vi7ZXknv4nKZkAJv8Ezhnw@mail.gmail.com>
 <CADVatmPx=T_i1oaX2i_d5crbWkixFZU7s-_wky_kz58wDgwGDQ@mail.gmail.com>
 <20220713225627.GC32544@roeck-us.net>
 <CADVatmM=JR4d4WU_53PtA6g-y40qc=CbHL9uhsJc2cSW=uoOXA@mail.gmail.com>
 <20220713231211.GF32544@roeck-us.net>
In-Reply-To: <20220713231211.GF32544@roeck-us.net>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 14 Jul 2022 00:26:27 +0100
Message-ID: <CADVatmOAnoiZ1WE7iDBYCXVSiMo8RvC_P6mBhR_F75asfDWr4w@mail.gmail.com>
Subject: Re: Linux 5.19-rc6
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 14 Jul 2022 00:59:04 +0000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Leo Li <sunpeng.li@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Balbir Singh <bsingharora@gmail.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Daniel Axtens <dja@axtens.net>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 12:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Jul 14, 2022 at 12:09:24AM +0100, Sudip Mukherjee wrote:
> > On Wed, Jul 13, 2022 at 11:56 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Wed, Jul 13, 2022 at 10:50:06PM +0100, Sudip Mukherjee wrote:
> > > > On Wed, Jul 13, 2022 at 10:45 PM Linus Torvalds
> > > > <torvalds@linux-foundation.org> wrote:
> > > > >
> > > > > On Wed, Jul 13, 2022 at 2:36 PM Sudip Mukherjee
> > > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > > >
> > > > > > > >
> > > > > > > > https://lore.kernel.org/all/20220524025139.40212-1-wangkefeng.wang@huawei.com/
> > > > > > >
> > > > > > > That patch looks sane to me, but I guess Guenter would need to check
> > > > > >
> > > > > > I still see the failure in my builds with this patch. But surprisingly
> > > > > > I dont see the build failure (with or without this patch) with gcc-12,
> > > > > > only with gcc-11.
> > > > >
> > > > > Arrghs. "build failure"?
> > > >
> > > > Uhh.. no, sorry.. I meant the same problem which Guenter reported with
> > > > powerpc64-linux-ld, hard float and soft float.
> > > > But I dont see this problem with gcc-12, only with gcc-11.
> > > >
> > >
> > > Weird. It works for me with gcc 11.3.0 / binutils 2.38 as well as with
> > > gcc 11.2.0 / binutils 2.36.1.
> >
> > Its entirely possible that I have messed up, there are references to
> > many patches in this thread. :)
> > Can you please paste the link of the patch that you say is working for
> > you. I will try a clean build with that.
> >
>
> The patch is at:
>
> https://lore.kernel.org/lkml/20220618232737.2036722-1-linux@roeck-us.net/raw

Thanks, that works. tested with gcc-11.3.1, and binutils 2.38 on top
of latest mainline (4a57a8400075bc5287c5c877702c68aeae2a033d)

When I said I still had the problem, I tested with
https://lore.kernel.org/all/20220524025139.40212-1-wangkefeng.wang@huawei.com/


-- 
Regards
Sudip
