Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23D676287
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Jan 2023 01:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3124D89C68;
	Sat, 21 Jan 2023 00:45:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9260B89C68
 for <amd-gfx@lists.freedesktop.org>; Sat, 21 Jan 2023 00:45:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id qx13so17897398ejb.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Jan 2023 16:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zUgSdb69TEJhOUBZaUiLYpyzRe9pqHYq4QqymMc9Vw8=;
 b=KW94ih5LcR4Ie6o1P8ofnxvUTzEq9DuJE5CL32HS6HwB2fvrCGTrLjjxX4HbW+Jqqj
 jIwKu90Vl4/KROHp+8R8tnufOVoFRwBwdofnlpQXS0Icy8yxu2fCJRtzLxvPUbeICyG4
 1sp5JHad1f3tT81Tnxhf68W6dqehg0n7aXzTxWA9eyyaZFig+n0arhr+WUUavSVlAmDY
 UjmLlo37cn/FxqMqJrxLNe7UyK62EeJdnoSXGaziwHcw1VRXkM6r6JngOO1IzlpTiDnk
 IE0+JLq8DSA7fFNXmJFER17VFI3cCOAPi4b+kHi9NLCVJ1UKV/XqXsQihiq/ZW0xLZu8
 5Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zUgSdb69TEJhOUBZaUiLYpyzRe9pqHYq4QqymMc9Vw8=;
 b=ykI5aZ3Yjcxjz9LoKUwv/8AaBg1DXtfVkHZMHZ2t5kQtWg4OuBq4fgedIX6+zE+Ny0
 v7KsFplVa8fiqnUOfaF7/W8uByUK9gv491hqxgFeSOqP8fPERS4+y1zni7G1mmIsAsLk
 nZIEZK4jqxVx6COSS6Ea2YHIzFIHjI0qe4PxOA9pTyjs6fzT1OX64uc55iwsKRuPZazL
 DMmgcYtLQE+xnOttGTvBJRIqDMENl34n/OLSJIE4I8Y4VzoX4fGZFy3k1hfVuujfexl7
 ePOZexK080zGuOzIjW0FSAGIghWaG0mPotGql0tPNf1cDEiRj4WxjT7VJFExqTmRE1tc
 ojuQ==
X-Gm-Message-State: AFqh2kpYwb0UjhGSz+vYT67rxGazZ+teWa9tRr7OPJI9V3Su6pmPYJnB
 G4lEa1dEgeiDRNqt6WI/t2RDrhNC5Jg9RuoQfzfYJojM
X-Google-Smtp-Source: AMrXdXtGd9o3G38c0yqNOKnZUJXJtmUBRRwxcRm3EK6/4mPtqcDi7JyCANJVj5qsH2sCaZhOemiFNrCGxh4JIhq8kdI=
X-Received: by 2002:a17:906:961a:b0:872:8cb:3d87 with SMTP id
 s26-20020a170906961a00b0087208cb3d87mr1657493ejx.350.1674261950976; Fri, 20
 Jan 2023 16:45:50 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5su09qWsCekUX4ZzTMAX+9m-BemDxqL2Hh9328Z1WDqw@mail.gmail.com>
 <355bab4f-2ca8-3dd2-4cbc-264931fe9d7a@gmail.com>
 <CAAxE2A487Ra9ropymBGZpXSt=Zz81cjf56p_7wq+tK4cDfn1sA@mail.gmail.com>
 <1d0ddc01-b315-a5ff-f4cc-30b8aedfeb57@gmail.com>
 <CAAxE2A69e+rHQJP+wHYOxywB0+B4Vp4XsO429euoGE=H-VRsPw@mail.gmail.com>
 <d1463910-1eab-2dac-a633-812ada011cc4@gmail.com>
 <CAAxE2A5fWDp==muWuXSXuGGHtT_RThLpC1rK92c2mLVLdmGdUQ@mail.gmail.com>
 <fe0ca4a4-b339-20ab-fd42-68b2a5e00e9c@gmail.com>
 <CAAxE2A71r9sQqFCPajK2VhL5GBJZ=Js5YRvYkrrsRtTRT5yxTg@mail.gmail.com>
In-Reply-To: <CAAxE2A71r9sQqFCPajK2VhL5GBJZ=Js5YRvYkrrsRtTRT5yxTg@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 20 Jan 2023 19:45:14 -0500
Message-ID: <CAAxE2A6JcREmKKmh1n0xSgkOZq77kpnzC-27-srunLKduyAwiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: add AMDGPU_INFO_VM_STAT to return GPU VM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d957f105f2bb7c3b"
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--000000000000d957f105f2bb7c3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We badly need a way to query evicted memory usage. It's essential for
investigating performance problems and it uncovered the buddy allocator
disaster. Please either suggest an alternative, suggest changes, or review.
We need it ASAP.

Thanks,
Marek

On Tue, Jan 10, 2023 at 11:55 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> w=
rote:

> On Tue, Jan 10, 2023 at 11:23 AM Christian K=C3=B6nig <
> ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Am 10.01.23 um 16:28 schrieb Marek Ol=C5=A1=C3=A1k:
>>
>> On Wed, Jan 4, 2023 at 9:51 AM Christian K=C3=B6nig <
>> ckoenig.leichtzumerken@gmail.com> wrote:
>>
>>> Am 04.01.23 um 00:08 schrieb Marek Ol=C5=A1=C3=A1k:
>>>
>>> I see about the access now, but did you even look at the patch?
>>>
>>>
>>> I did look at the patch, but I haven't fully understood yet what you ar=
e
>>> trying to do here.
>>>
>>
>> First and foremost, it returns the evicted size of VRAM and visible VRAM=
,
>> and returns visible VRAM usage. It should be obvious which stat includes
>> the size of another.
>>
>>
>>> Because what the patch does isn't even exposed to common drm code, such
>>> as the preferred domain and visible VRAM placement, so it can't be in
>>> fdinfo right now.
>>>
>>> Or do you even know what fdinfo contains? Because it contains nothing
>>> useful. It only has VRAM and GTT usage, which we already have in the IN=
FO
>>> ioctl, so it has nothing that we need. We mainly need the eviction
>>> information and visible VRAM information now. Everything else is a bonu=
s.
>>>
>>>
>>> Well the main question is what are you trying to get from that
>>> information? The eviction list for example is completely meaningless to
>>> userspace, that stuff is only temporary and will be cleared on the next=
 CS
>>> again.
>>>
>>
>> I don't know what you mean. The returned eviction stats look correct and
>> are stable (they don't change much). You can suggest changes if you thin=
k
>> some numbers are not reported correctly.
>>
>>
>>>
>>> What we could expose is the VRAM over-commit value, e.g. how much BOs
>>> which where supposed to be in VRAM are in GTT now. I think that's what =
you
>>> are looking for here, right?
>>>
>>
>> The VRAM overcommit value is "evicted_vram".
>>
>>
>>>
>>> Also, it's undesirable to open and parse a text file if we can just cal=
l
>>> an ioctl.
>>>
>>>
>>> Well I see the reasoning for that, but I also see why other drivers do =
a
>>> lot of the stuff we have as IOCTL as separate files in sysfs, fdinfo or
>>> debugfs.
>>>
>>> Especially repeating all the static information which were already
>>> available under sysfs in the INFO IOCTL was a design mistake as far as =
I
>>> can see. Just compare what AMDGPU and the KFD code is doing to what for
>>> example i915 is doing.
>>>
>>> Same for things like debug information about a process. The fdinfo stuf=
f
>>> can be queried from external tools (gdb, gputop, umr etc...) as well wh=
ich
>>> makes that interface more preferred.
>>>
>>
>> Nothing uses fdinfo in Mesa. No driver uses sysfs in Mesa except drm
>> shims, noop drivers, and Intel for perf metrics. sysfs itself is an
>> unusable mess for the PCIe query and is missing information.
>>
>> I'm not against exposing more stuff through sysfs and fdinfo for tools,
>> but I don't see any reason why drivers should use it (other than for
>> slowing down queries and initialization).
>>
>>
>> That's what I'm asking: Is this for some tool or to make some driver
>> decision based on it?
>>
>> If you just want the numbers for over displaying then I think it would b=
e
>> better to put this into fdinfo together with the other existing stuff th=
ere.
>>
>
>> If you want to make allocation decisions based on this then we should
>> have that as IOCTL or even better as mmap() page between kernel and
>> userspace. But in this case I would also calculation the numbers complet=
ely
>> different as well.
>>
>> See we have at least the following things in the kernel:
>> 1. The eviction list in the VM.
>>     Those are the BOs which are currently evicted and tried to moved bac=
k
>> in on the next CS.
>>
>> 2. The VRAM over commit value.
>>     In other words how much more VRAM than available has the application
>> tried to allocate?
>>
>> 3. The visible VRAM usage by this application.
>>
>> The end goal is that the eviction list will go away, e.g. we will always
>> have stable allocations based on allocations of other applications and n=
ot
>> constantly swap things in and out.
>>
>> When you now expose the eviction list to userspace we will be stuck with
>> this interface forever.
>>
>
> It's for the GALLIUM HUD.
>
> The only missing thing is the size of all evicted VRAM allocations, and
> the size of all evicted visible VRAM allocations.
>
> 1. No list is exposed. Only sums of buffer sizes are exposed. Also, the
> eviction list has no meaning here. All lists are treated equally, and
> mem_type is compared with preferred_domains to determine where buffers ar=
e
> and where they should be.
>
> 2. I'm not interested in the overcommit value. I'm only interested in
> knowing the number of bytes of evicted VRAM right now. It can be as
> variable as the CPU load, but in practice it shouldn't be because PCIe
> doesn't have the bandwidth to move things quickly.
>
> 3. Yes, that's true.
>
> Marek
>
>

--000000000000d957f105f2bb7c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We badly need a way to query evicted memory usage. It=
&#39;s essential for investigating performance problems and it uncovered th=
e buddy allocator disaster. Please either suggest an alternative, suggest c=
hanges, or review. We need it ASAP.<br></div><div><br></div><div>Thanks,</d=
iv><div>Marek<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 11:55 AM Marek Ol=C5=A1=C3=
=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Jan 10, 2023 at 11:23 AM Christian K=C3=B6nig &lt;<a hre=
f=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">ckoenig.lei=
chtzumerken@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
 =20
   =20
 =20
  <div>
    Am 10.01.23 um 16:28 schrieb Marek Ol=C5=A1=C3=A1k:<br>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 4, 2023 at 9:51
            AM Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzum=
erken@gmail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> Am 04.01.23 um 00:08 schrieb Marek Ol=C5=A1=C3=A1k:<br>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div>I see about the access now, but did you even look
                    at the patch?</div>
                </div>
              </blockquote>
              <br>
              I did look at the patch, but I haven&#39;t fully understood
              yet what you are trying to do here.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>First and foremost, it returns the evicted size of VRAM
            and visible VRAM, and returns visible VRAM usage. It should
            be obvious which stat includes the size of another.<br>
          </div>
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div> Because what the patch does isn&#39;t even exposed
                    to common drm code, such as the preferred domain and
                    visible VRAM placement, so it can&#39;t be in fdinfo
                    right now.<br>
                  </div>
                  <div><br>
                  </div>
                  <div>Or do you even know what fdinfo contains? Because
                    it contains nothing useful. It only has VRAM and GTT
                    usage, which we already have in the INFO ioctl, so
                    it has nothing that we need. We mainly need the
                    eviction information and visible VRAM information
                    now. Everything else is a bonus.<br>
                  </div>
                </div>
              </blockquote>
              <br>
              Well the main question is what are you trying to get from
              that information? The eviction list for example is
              completely meaningless to userspace, that stuff is only
              temporary and will be cleared on the next CS again.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>I don&#39;t know what you mean. The returned eviction stats
            look correct and are stable (they don&#39;t change much). You
            can suggest changes if you think some numbers are not
            reported correctly.<br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              What we could expose is the VRAM over-commit value, e.g.
              how much BOs which where supposed to be in VRAM are in GTT
              now. I think that&#39;s what you are looking for here, right?=
<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>The VRAM overcommit value is &quot;evicted_vram&quot;.<br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div>
                    <div>Also, it&#39;s undesirable to open and parse a tex=
t
                      file if we can just call an ioctl.</div>
                  </div>
                </div>
              </blockquote>
              <br>
              Well I see the reasoning for that, but I also see why
              other drivers do a lot of the stuff we have as IOCTL as
              separate files in sysfs, fdinfo or debugfs.<br>
              <br>
              Especially repeating all the static information which were
              already available under sysfs in the INFO IOCTL was a
              design mistake as far as I can see. Just compare what
              AMDGPU and the KFD code is doing to what for example i915
              is doing.<br>
              <br>
              Same for things like debug information about a process.
              The fdinfo stuff can be queried from external tools (gdb,
              gputop, umr etc...) as well which makes that interface
              more preferred.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Nothing uses fdinfo in Mesa. No driver uses sysfs in Mesa
            except drm shims, noop drivers, and Intel for perf metrics.
            sysfs itself is an unusable mess for the PCIe query and is
            missing information.</div>
          <div><br>
          </div>
          <div>I&#39;m not against exposing more stuff through sysfs and
            fdinfo for tools, but I don&#39;t see any reason why drivers
            should use it (other than for slowing down queries and
            initialization).</div>
        </div>
      </div>
    </blockquote>
    <br>
    That&#39;s what I&#39;m asking: Is this for some tool or to make some d=
river
    decision based on it?<br>
    <br>
    If you just want the numbers for over displaying then I think it
    would be better to put this into fdinfo together with the other
    existing stuff there.<br></div></blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div>
    <br>
    If you want to make allocation decisions based on this then we
    should have that as IOCTL or even better as mmap() page between
    kernel and userspace. But in this case I would also calculation the
    numbers completely different as well.<br>
    <br>
    See we have at least the following things in the kernel:<br>
    1. The eviction list in the VM.<br>
    =C2=A0=C2=A0=C2=A0 Those are the BOs which are currently evicted and tr=
ied to moved
    back in on the next CS.<br>
    <br>
    2. The VRAM over commit value.<br>
    =C2=A0=C2=A0=C2=A0 In other words how much more VRAM than available has=
 the
    application tried to allocate?<br>
    <br>
    3. The visible VRAM usage by this application.<br>
    <br>
    The end goal is that the eviction list will go away, e.g. we will
    always have stable allocations based on allocations of other
    applications and not constantly swap things in and out.<br>
    <br>
    When you now expose the eviction list to userspace we will be stuck
    with this interface forever.<br></div></blockquote><div><br></div><div>=
It&#39;s for the GALLIUM HUD.</div><div><br></div><div>The only missing thi=
ng is the size of all evicted VRAM allocations, and the size of all evicted=
 visible VRAM allocations.<br></div><div><br></div><div>1. No list is expos=
ed. Only sums of buffer sizes are exposed. Also, the eviction list has no m=
eaning here. All lists are treated equally, and mem_type is compared with p=
referred_domains to determine where buffers are and where they should be.<b=
r></div><div><br></div><div>2. I&#39;m not interested in the overcommit val=
ue. I&#39;m only interested in knowing the number of bytes of evicted VRAM =
right now. It can be as variable as the CPU load, but in practice it should=
n&#39;t be because PCIe doesn&#39;t have the bandwidth to move things quick=
ly.<br></div><div><br></div><div>3. Yes, that&#39;s true.</div><div><br></d=
iv><div>Marek</div><br></div></div>
</blockquote></div>

--000000000000d957f105f2bb7c3b--
