Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDB30D826
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Feb 2021 12:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCD76EA5C;
	Wed,  3 Feb 2021 11:09:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D506EA5D
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Feb 2021 11:09:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 7so23744735wrz.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Feb 2021 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=10v1VhHSAkUfosKyz8E/GXqf1Nzg9103R9baLtggV6c=;
 b=AwADaWJ4LwJCoyZjbksaAIXa2APpKqAzdcH9SXnJSG7fszSPLuUH+3Bwq8LRRDPDdi
 NoWIXSFbFk7LIjysbkr0z+9qT5D6IV+LPHIDP1dNAXkIXUoE8fy0uJRszcDfXUx0bqw7
 A7GDs34BM4mVn+70Za7HOYwh3WFfPNv53flts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=10v1VhHSAkUfosKyz8E/GXqf1Nzg9103R9baLtggV6c=;
 b=G7z9+++mosfxe9kXmNlRj0fByJYNmqEMsGOGbiLnwv/BG6SyB+peUFjkBou9HSrdAW
 zGonaoVHAW2TSFPBeqEul2dtKF/YD6JPhczO0rfkPhhkdLHZfH/vwCKmzjhW2dPkDgBi
 CIyL6tbXFYQwxtvOQ4NIHNu6rGCo3ni8syZ0J8XeXMnRmDcty+jvR4VbY138cfmC+uXG
 TgiD6AgGswPf7Nw1C/XPVVkOIBzsWnqSSRoSE4AussTJab5SEzKZAdbdSuQ5Bl1isPAv
 SqmeY42jQeaZzGxC911RYHjSw7LgOLTJFvEuT/h1VfEBY2teV942hxYgGi0K5Sl1X27T
 dTKA==
X-Gm-Message-State: AOAM532iNCe06aakYv+ZLOQzOFRQqHtZTdIq6yVGCHklMBYiz1jskFGV
 44fMuANnQ+EJmPqsPPTXg63sZQ==
X-Google-Smtp-Source: ABdhPJz/Tt+QvRistfYVb5CQI5w5vU2oPDBqvoYzreN0pUZNDkogq1vrI5kxcwA1KSZxNTuzut/k+A==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr2881295wrw.410.1612350575262; 
 Wed, 03 Feb 2021 03:09:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm2969771wrs.25.2021.02.03.03.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:09:34 -0800 (PST)
Date: Wed, 3 Feb 2021 12:09:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
Message-ID: <YBqEbHyIjUjgk+es@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-eXMqcNpjFxbcuUDU7Y-CCYJRNT_9mzqFYm1jeCPdADGQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Alexander Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Network Development <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 11:51:07AM -0500, Kenny Ho wrote:
> [Resent in plain text.]
> 
> On Mon, Feb 1, 2021 at 9:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > - there's been a pile of cgroups proposal to manage gpus at the drm
> >   subsystem level, some by Kenny, and frankly this at least looks a bit
> >   like a quick hack to sidestep the consensus process for that.
> No Daniel, this is quick *draft* to get a conversation going.  Bpf was
> actually a path suggested by Tejun back in 2018 so I think you are
> mischaracterizing this quite a bit.
> 
> "2018-11-20 Kenny Ho:
> To put the questions in more concrete terms, let say a user wants to
>  expose certain part of a gpu to a particular cgroup similar to the
>  way selective cpu cores are exposed to a cgroup via cpuset, how
>  should we go about enabling such functionality?
> 
> 2018-11-20 Tejun Heo:
> Do what the intel driver or bpf is doing?  It's not difficult to hook
> into cgroup for identification purposes."

Yeah, but if you go full amd specific for this, you might as well have a
specific BPF hook which is called in amdgpu/kfd and returns you the CU
mask for a given cgroups (and figures that out however it pleases).

Not a generic framework which lets you build pretty much any possible
cgroups controller for anything else using BPF. Trying to filter anything
at the generic ioctl just doesn't feel like a great idea that's long term
maintainable. E.g. what happens if there's new uapi for command
submission/context creation and now your bpf filter isn't catching all
access anymore? If it's an explicit hook that explicitly computes the CU
mask, then we can add more checks as needed. With ioctl that's impossible.

Plus I'm also not sure whether that's really a good idea still, since if
cloud companies have to built their own bespoke container stuff for every
gpu vendor, that's quite a bad platform we're building. And "I'd like to
make sure my gpu is used fairly among multiple tenents" really isn't a
use-case that's specific to amd.

If this would be something very hw specific like cache assignment and
quality of service stuff or things like that, then vendor specific imo
makes sense. But for CU masks essentially we're cutting the compute
resources up in some way, and I kinda expect everyone with a gpu who cares
about isolating workloads with cgroups wants to do that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
