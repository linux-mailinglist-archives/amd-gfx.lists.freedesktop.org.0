Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC10376918
	for <lists+amd-gfx@lfdr.de>; Fri,  7 May 2021 18:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5426E0B6;
	Fri,  7 May 2021 16:54:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081C76E0C8
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 May 2021 16:54:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d11so9945793wrw.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 May 2021 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6IcOWYBUOtQoCBL1qPtrhl4ZlflWgXWFQU8YGjyhs7c=;
 b=NIKVq0m6gJjzBck2EAI1PVdmkAbsbaI4znOrznNtz8uXgXDzeBmuBeul21mUa8bFt4
 uNJHE9B3ehF8bZeerXMHwqS6G21foVpmb3IQZtqRXhfYl9UnFQAikv/lXCxl6wTvLKd7
 OmEDxdM0J1Vrfb4t9X/N6LOKM7wokQPZavKlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6IcOWYBUOtQoCBL1qPtrhl4ZlflWgXWFQU8YGjyhs7c=;
 b=qX5VvfwiX/uRN6wHLtoUnDH0vWlyIfElAJ5m3uBpihGSHY61N43PXm+EzvtqEK4p6f
 oguIrnDAaCMT9SW8aDwCflfdnahkCeKMn719QdThOz0hldrdMwrmANk6j5QaqPdjlfuA
 gM2H1YWW0VEMBcLYrvQJd9PeXTMOhLLHObiTHI5Dj37NWYp+BSd75bzFhXrJa5Rq3i0v
 BqoE5hNlH3GQyHTE7uunb32LMAeCVmWhrJO9S5nDneFkat5+wsg44S8UZIbTXGLHm+ki
 fW2k2+hiwuDldb419EoxXVOomcvEBNrg82kP1bUhtqmjmqtKJinqben71trgLpLMF4ey
 dfOQ==
X-Gm-Message-State: AOAM5308v6Io6PSNVf+FlTZrR7+v45qnWvMRUAvNyj612Hkdnt9M9JR6
 +mWu51DuAkMGH9OR98RhAGUKvQ==
X-Google-Smtp-Source: ABdhPJx4XisqhypzoVmnN7f1cc81V9gCDgtdKMiD1+mhSs/hAB2Ds1VCFCcyfmp9AO96MGf2I/a4xg==
X-Received: by 2002:a5d:6342:: with SMTP id b2mr13678480wrw.203.1620406455723; 
 Fri, 07 May 2021 09:54:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f4sm9632445wrz.33.2021.05.07.09.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 09:54:15 -0700 (PDT)
Date: Fri, 7 May 2021 18:54:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
Message-ID: <YJVwtS9XJlogZRqv@phenom.ffwll.local>
References: <CAOWid-c4Nk717xUah19B=z=2DtztbtU=_4=fQdfhqpfNJYN2gw@mail.gmail.com>
 <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
 <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
 <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
 <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Brian Welty <brian.welty@intel.com>,
 John Fastabend <john.fastabend@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Kenny Ho <y2kenny@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, KP Singh <kpsingh@chromium.org>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Kenny Ho <Kenny.Ho@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Network Development <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, May 07, 2021 at 12:50:07PM -0400, Alex Deucher wrote:
> On Fri, May 7, 2021 at 12:31 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Fri, May 7, 2021 at 12:26 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, May 07, 2021 at 12:19:13PM -0400, Alex Deucher wrote:
> > > > On Fri, May 7, 2021 at 12:13 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Fri, May 07, 2021 at 11:33:46AM -0400, Kenny Ho wrote:
> > > > > > On Fri, May 7, 2021 at 4:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > >
> > > > > > > Hm I missed that. I feel like time-sliced-of-a-whole gpu is the easier gpu
> > > > > > > cgroups controler to get started, since it's much closer to other cgroups
> > > > > > > that control bandwidth of some kind. Whether it's i/o bandwidth or compute
> > > > > > > bandwidht is kinda a wash.
> > > > > > sriov/time-sliced-of-a-whole gpu does not really need a cgroup
> > > > > > interface since each slice appears as a stand alone device.  This is
> > > > > > already in production (not using cgroup) with users.  The cgroup
> > > > > > proposal has always been parallel to that in many sense: 1) spatial
> > > > > > partitioning as an independent but equally valid use case as time
> > > > > > sharing, 2) sub-device resource control as opposed to full device
> > > > > > control motivated by the workload characterization paper.  It was
> > > > > > never about time vs space in terms of use cases but having new API for
> > > > > > users to be able to do spatial subdevice partitioning.
> > > > > >
> > > > > > > CU mask feels a lot more like an isolation/guaranteed forward progress
> > > > > > > kind of thing, and I suspect that's always going to be a lot more gpu hw
> > > > > > > specific than anything we can reasonably put into a general cgroups
> > > > > > > controller.
> > > > > > The first half is correct but I disagree with the conclusion.  The
> > > > > > analogy I would use is multi-core CPU.  The capability of individual
> > > > > > CPU cores, core count and core arrangement may be hw specific but
> > > > > > there are general interfaces to support selection of these cores.  CU
> > > > > > mask may be hw specific but spatial partitioning as an idea is not.
> > > > > > Most gpu vendors have the concept of sub-device compute units (EU, SE,
> > > > > > etc.); OpenCL has the concept of subdevice in the language.  I don't
> > > > > > see any obstacle for vendors to implement spatial partitioning just
> > > > > > like many CPU vendors support the idea of multi-core.
> > > > > >
> > > > > > > Also for the time slice cgroups thing, can you pls give me pointers to
> > > > > > > these old patches that had it, and how it's done? I very obviously missed
> > > > > > > that part.
> > > > > > I think you misunderstood what I wrote earlier.  The original proposal
> > > > > > was about spatial partitioning of subdevice resources not time sharing
> > > > > > using cgroup (since time sharing is already supported elsewhere.)
> > > > >
> > > > > Well SRIOV time-sharing is for virtualization. cgroups is for
> > > > > containerization, which is just virtualization but with less overhead and
> > > > > more security bugs.
> > > > >
> > > > > More or less.
> > > > >
> > > > > So either I get things still wrong, or we'll get time-sharing for
> > > > > virtualization, and partitioning of CU for containerization. That doesn't
> > > > > make that much sense to me.
> > > >
> > > > You could still potentially do SR-IOV for containerization.  You'd
> > > > just pass one of the PCI VFs (virtual functions) to the container and
> > > > you'd automatically get the time slice.  I don't see why cgroups would
> > > > be a factor there.
> > >
> > > Standard interface to manage that time-slicing. I guess for SRIOV it's all
> > > vendor sauce (intel as guilty as anyone else from what I can see), but for
> > > cgroups that feels like it's falling a bit short of what we should aim
> > > for.
> > >
> > > But dunno, maybe I'm just dreaming too much :-)
> >
> > I don't disagree, I'm just not sure how it would apply to SR-IOV.
> > Once you've created the virtual functions, you've already created the
> > partitioning (regardless of whether it's spatial or temporal) so where
> > would cgroups come into play?
> 
> For some background, the SR-IOV virtual functions show up like actual
> PCI endpoints on the bus, so SR-IOV is sort of like cgroups
> implemented in hardware.  When you enable SR-IOV, the endpoints that
> are created are the partitions.

Yeah I think we're massively agreeing right now :-)

SRIOV is kinda by design vendor specific. You set up the VF endpoint, it
shows up, it's all hw+fw magic. Nothing for cgroups to manage here at all.

All I meant is that for the container/cgroups world starting out with
time-sharing feels like the best fit, least because your SRIOV designers
also seem to think that's the best first cut for cloud-y computing.
Whether it's virtualized or containerized is a distinction that's getting
ever more blurry, with virtualization become a lot more dynamic and
container runtimes als possibly using hw virtualization underneath.
-Daniel

> 
> Alex
> 
> >
> > Alex
> >
> > > -Daniel
> > >
> > > > Alex
> > > >
> > > > >
> > > > > Since time-sharing is the first thing that's done for virtualization I
> > > > > think it's probably also the most reasonable to start with for containers.
> > > > > -Daniel
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > > > _______________________________________________
> > > > > amd-gfx mailing list
> > > > > amd-gfx@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
