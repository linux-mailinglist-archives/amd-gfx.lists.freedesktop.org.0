Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C6375EB0
	for <lists+amd-gfx@lfdr.de>; Fri,  7 May 2021 04:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8206EDCC;
	Fri,  7 May 2021 02:06:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8143D6EDCC;
 Fri,  7 May 2021 02:06:45 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id z13so10661529lft.1;
 Thu, 06 May 2021 19:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RusZqf2ICrM5fo1RSYd7Qden8l8w86x5qFZgmckN64E=;
 b=D3bvz8i81tQkrtuQ+d1bkqIKoTdXAZWYYo6Jfm6wspflRIADJqkHwK3Tng54nv8L8j
 kIUQ4Gd1GX0Mm3MGVRY/Cv0CqOQ2b/SwKrjuqKQ2ZLb42V5VpGDH8k9zdxW5F8jvJyfa
 oLTIlByZ21h77IN3GiYOi8DRoH5svGBcNiKp/hCtXMH1J7nhMihzdzDioSOcRJ0RARol
 OVt144Jx1rzUTkCU0vW3daSLf0owrtC0yAdtvCT57MQoOyn7OYD0UppOnItgNU2aQ3lA
 twFeOWFtx02nENFd16Y5AUuwOe/mWTYJiHeGA8pGRIoA8ogpgcLuy5gafsmAh3Y1WSVg
 /i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RusZqf2ICrM5fo1RSYd7Qden8l8w86x5qFZgmckN64E=;
 b=P2mS9AbXDZQPvsmz57AYXjOg/oUpUjTHivIplDWQuVqlRS3yH85qgLymsdkXJR/6jV
 wO3kGWh31AriUWTygUWyZh14lq2gknppvrOus8SDOVg20M3LtHcLUhHapTK+VAv9JBpK
 JHVWzYe3pa3mlS7TDIEdFdbvDMutJc7aIlaOmjTw2ltXd2yMhskNfH3zIJI1VEIuARSN
 0eGLcNHR2pGPBxXZ03MkrNlny8zmVOVqRzemN7osK9G0ojHQUNmTBlkS2AB4hwaG/Pnd
 W/5SbpdYoh7g2quk5QRHXTa0t/op4EPXhj6YVISpYbYIsm2plgSTENVob/oA5HzjF0+v
 YRnA==
X-Gm-Message-State: AOAM532Nlb649HiDhwO3GlndCMyIcyL1oUVtcBsz+D0tDVq8l0jcAQFU
 crSFUk4ZasVbVJOsqoL+xIKBvCUF0zLDK7hWLt0=
X-Google-Smtp-Source: ABdhPJy6fE0F0maDDYRJg2QRG950fLRhaA0QiW7C6vG6nsHx3tC0UfW9AmOOCNLGEB8W9gmuKKolcqYX/UZkgFF0HoM=
X-Received: by 2002:a05:6512:c04:: with SMTP id
 z4mr4820989lfu.167.1620353203882; 
 Thu, 06 May 2021 19:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOWid-d=a1Q3R92s7GrzxWhXx7_dc8NQvQg7i7RYTVv3+jHxkQ@mail.gmail.com>
 <20201103053244.khibmr66p7lhv7ge@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-eQSPru0nm8+Xo3r6C0pJGq+5r8mzM8BL2dgNn2c9mt2Q@mail.gmail.com>
 <CAADnVQKuoZDB-Xga5STHdGSxvSP=B6jQ40kLdpL1u+J98bv65A@mail.gmail.com>
 <CAOWid-czZphRz6Y-H3OcObKCH=bLLC3=bOZaSB-6YBE56+Qzrg@mail.gmail.com>
 <20201103210418.q7hddyl7rvdplike@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-djQ_NRfCbOTnZQ-A8Pr7jMP7KuZEJDSsvzWkdw7qc=yA@mail.gmail.com>
 <20201103232805.6uq4zg3gdvw2iiki@ast-mbp.dhcp.thefacebook.com>
 <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
 <CAOWid-eXMqcNpjFxbcuUDU7Y-CCYJRNT_9mzqFYm1jeCPdADGQ@mail.gmail.com>
 <YBqEbHyIjUjgk+es@phenom.ffwll.local>
 <CAOWid-c4Nk717xUah19B=z=2DtztbtU=_4=fQdfhqpfNJYN2gw@mail.gmail.com>
 <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
In-Reply-To: <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 6 May 2021 22:06:32 -0400
Message-ID: <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kenny Ho <Kenny.Ho@amd.com>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Brian Welty <brian.welty@intel.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Martin KaFai Lau <kafai@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Network Development <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Sorry for the late reply (I have been working on other stuff.)

On Fri, Feb 5, 2021 at 8:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> So I agree that on one side CU mask can be used for low-level quality
> of service guarantees (like the CLOS cache stuff on intel cpus as an
> example), and that's going to be rather hw specific no matter what.
>
> But my understanding of AMD's plans here is that CU mask is the only
> thing you'll have to partition gpu usage in a multi-tenant environment
> - whether that's cloud or also whether that's containing apps to make
> sure the compositor can still draw the desktop (except for fullscreen
> ofc) doesn't really matter I think.
This is not correct.  Even in the original cgroup proposal, it
supports both mask and count as a way to define unit(s) of sub-device.
For AMD, we already have SRIOV that supports GPU partitioning in a
time-sliced-of-a-whole-GPU fashion.

Kenny
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
