Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB7679315
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Jan 2023 09:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220F610E62C;
	Tue, 24 Jan 2023 08:27:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4969A10E62C
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Jan 2023 08:27:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id hw16so36866490ejc.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Jan 2023 00:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UUgjZN0rYxY2lB2BGb/XAk6rpThkSEYcaxKpWLFV8a4=;
 b=bQDW3GxJPLePCUDEBMQPOqipNBlTEpobOR3Mmyn+5NlfAM8G1VMZwaMxFnmbpSN4f1
 ZWYBqtnBahmzKvQ/bEmqLCfDKMFOaVbYugNEKtZYTOsFWzaHmDPRypGRG/TCMiwSLKGg
 hMmcBunAG24196DLea5gCB8HsSl4IkrfJ40nEfgtChphwAGzJALxLugG3da0q3mQyyll
 omnQ0EqYnymqP4kr0Ouxy6oceZBCWPoEuMM02fRNtFipZI1aaZY1XLHqbjstkvfOg/lY
 8zXN5oZi4aG5c5CMeMPv+xbGtcJRlnvdRpzJJCn03XqQ5iDBwcdmVX1TkQQ7UdS9cW1+
 0IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUgjZN0rYxY2lB2BGb/XAk6rpThkSEYcaxKpWLFV8a4=;
 b=VBX40t2z1MOnm4x09yMExqKxzLo8J/Anszf4mZrhhstdztcp548Sw644fzTRZbPlkN
 AbIu+TbvOOp4B5f60Vz7Ia0DhrJ/WPXVfUxHwEiUIqWch8oxh3b5WkiHDgYsWvDA/Bns
 cKgdkxxxJSLx+2dz6/yCLtfWiWTLNn22bSpGZTWVJRJu3syN7CBnBf0/IMdnC+CC6t2u
 j93+9H5ozPxnL/4WKYXy1SV/74WwWvaY6BbTIwgEQ97WvfGGoLqmpvsYL9v4ZFmb39dJ
 HwrwfTo3t/eM4Nf64tvRvrnNdeTv78w0ahydZpiuiy8OaJDVlsvvTFgvi7O4ZlHtQSVK
 ldhg==
X-Gm-Message-State: AFqh2koN4JbcACP0mbaZ/bdhcBPByW7vY5EPEX/XvbfKY8W+obw/f50a
 XdVwKOr/RH8WS1Co+xvi8HKJImuCY7UlCZnzXihIqSXn
X-Google-Smtp-Source: AMrXdXujnsU1/M3IdKA7e/QIgbUrKpYnyXhCypyOUmYTOC+UhP9BtTRllrVNdCcpuPZz2KAryNyIW3JaXuYr4Mx8mZg=
X-Received: by 2002:a17:906:9e95:b0:7c1:98f:c16a with SMTP id
 fx21-20020a1709069e9500b007c1098fc16amr2222010ejc.215.1674548861738; Tue, 24
 Jan 2023 00:27:41 -0800 (PST)
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
 <CAAxE2A6JcREmKKmh1n0xSgkOZq77kpnzC-27-srunLKduyAwiw@mail.gmail.com>
 <4992933e-ad45-5f7a-b7af-39c6d0948321@gmail.com>
 <CAAxE2A4rxdVqYp5qvN4DyV-=9TxE6EgeXPu++=7f1BEEhOs+Bw@mail.gmail.com>
 <a11b75da-9008-411d-66ed-6dc3c21f73ea@gmail.com>
 <CAAxE2A686+RMwmUkN=dLRptKaHKEQemXDfMoidQbw55JrVWQWA@mail.gmail.com>
In-Reply-To: <CAAxE2A686+RMwmUkN=dLRptKaHKEQemXDfMoidQbw55JrVWQWA@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 24 Jan 2023 03:27:05 -0500
Message-ID: <CAAxE2A4zRPr5fJdQdAoBw8=OMrm9BjJHgnzLrXoomq0o-29UBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: add AMDGPU_INFO_VM_STAT to return GPU VM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000010202f05f2fe4abf"
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

--00000000000010202f05f2fe4abf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A new Gallium HUD "value producer" could be added that reads fdinfo without
calling the driver. I still think there is merit in having this in
amdgpu_drm.h too.

Marek

On Tue, Jan 24, 2023 at 3:13 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:

> The table of exposed driver-specific counters:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/drivers/=
radeonsi/si_query.c#L1751
>
> Counter enums. They use the same interface as e.g. occlusion queries,
> except that begin_query and end_query save the results in the driver/CPU.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/drivers/=
radeonsi/si_query.h#L45
>
> Counters exposed by the winsys:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/include/=
winsys/radeon_winsys.h#L126
>
> I just need to query the counters in the winsys and return them.
>
> Marek
>
> On Tue, Jan 24, 2023 at 2:58 AM Christian K=C3=B6nig <
> ckoenig.leichtzumerken@gmail.com> wrote:
>
>> How are the counters which the HUD consumes declared?
>>
>> See what I want to avoid is a) to nail down the interface with the kerne=
l
>> on specific values and b) make it possible to easily expose new values.
>>
>> In other words what we could do with fdinfo is to have something like
>> this:
>>
>> GALLIUM_FDINFO_HUD=3Ddrm-memory-vram,amd-evicted-vram,amd-mclk glxgears
>>
>> And the HUD just displays the values the kernel provides without the nee=
d
>> to re-compile mesa when we want to add some more values nor have the val=
ues
>> as part of the UAPI.
>>
>> Christian.
>>
>> Am 24.01.23 um 08:37 schrieb Marek Ol=C5=A1=C3=A1k:
>>
>> The Gallium HUD doesn't consume strings. It only consumes values that ar=
e
>> exposed as counters from the driver. In this case, we need the driver to
>> expose evicted stats as counters. Each counter can set whether the value=
 is
>> absolute (e.g. memory usage) or monotonic (e.g. perf counter). Parsing
>> fdinfo to get the values is undesirable.
>>
>> Marek
>>
>> On Mon, Jan 23, 2023 at 4:31 AM Christian K=C3=B6nig <
>> ckoenig.leichtzumerken@gmail.com> wrote:
>>
>>> Let's do this as valid in fdinfo.
>>>
>>> This way we can easily extend whatever the kernel wants to display as
>>> statistics in the userspace HUD.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 21.01.23 um 01:45 schrieb Marek Ol=C5=A1=C3=A1k:
>>>
>>> We badly need a way to query evicted memory usage. It's essential for
>>> investigating performance problems and it uncovered the buddy allocator
>>> disaster. Please either suggest an alternative, suggest changes, or rev=
iew.
>>> We need it ASAP.
>>>
>>> Thanks,
>>> Marek
>>>
>>> On Tue, Jan 10, 2023 at 11:55 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.co=
m> wrote:
>>>
>>>> On Tue, Jan 10, 2023 at 11:23 AM Christian K=C3=B6nig <
>>>> ckoenig.leichtzumerken@gmail.com> wrote:
>>>>
>>>>> Am 10.01.23 um 16:28 schrieb Marek Ol=C5=A1=C3=A1k:
>>>>>
>>>>> On Wed, Jan 4, 2023 at 9:51 AM Christian K=C3=B6nig <
>>>>> ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>
>>>>>> Am 04.01.23 um 00:08 schrieb Marek Ol=C5=A1=C3=A1k:
>>>>>>
>>>>>> I see about the access now, but did you even look at the patch?
>>>>>>
>>>>>>
>>>>>> I did look at the patch, but I haven't fully understood yet what you
>>>>>> are trying to do here.
>>>>>>
>>>>>
>>>>> First and foremost, it returns the evicted size of VRAM and visible
>>>>> VRAM, and returns visible VRAM usage. It should be obvious which stat
>>>>> includes the size of another.
>>>>>
>>>>>
>>>>>> Because what the patch does isn't even exposed to common drm code,
>>>>>> such as the preferred domain and visible VRAM placement, so it can't=
 be in
>>>>>> fdinfo right now.
>>>>>>
>>>>>> Or do you even know what fdinfo contains? Because it contains nothin=
g
>>>>>> useful. It only has VRAM and GTT usage, which we already have in the=
 INFO
>>>>>> ioctl, so it has nothing that we need. We mainly need the eviction
>>>>>> information and visible VRAM information now. Everything else is a b=
onus.
>>>>>>
>>>>>>
>>>>>> Well the main question is what are you trying to get from that
>>>>>> information? The eviction list for example is completely meaningless=
 to
>>>>>> userspace, that stuff is only temporary and will be cleared on the n=
ext CS
>>>>>> again.
>>>>>>
>>>>>
>>>>> I don't know what you mean. The returned eviction stats look correct
>>>>> and are stable (they don't change much). You can suggest changes if y=
ou
>>>>> think some numbers are not reported correctly.
>>>>>
>>>>>
>>>>>>
>>>>>> What we could expose is the VRAM over-commit value, e.g. how much BO=
s
>>>>>> which where supposed to be in VRAM are in GTT now. I think that's wh=
at you
>>>>>> are looking for here, right?
>>>>>>
>>>>>
>>>>> The VRAM overcommit value is "evicted_vram".
>>>>>
>>>>>
>>>>>>
>>>>>> Also, it's undesirable to open and parse a text file if we can just
>>>>>> call an ioctl.
>>>>>>
>>>>>>
>>>>>> Well I see the reasoning for that, but I also see why other drivers
>>>>>> do a lot of the stuff we have as IOCTL as separate files in sysfs, f=
dinfo
>>>>>> or debugfs.
>>>>>>
>>>>>> Especially repeating all the static information which were already
>>>>>> available under sysfs in the INFO IOCTL was a design mistake as far =
as I
>>>>>> can see. Just compare what AMDGPU and the KFD code is doing to what =
for
>>>>>> example i915 is doing.
>>>>>>
>>>>>> Same for things like debug information about a process. The fdinfo
>>>>>> stuff can be queried from external tools (gdb, gputop, umr etc...) a=
s well
>>>>>> which makes that interface more preferred.
>>>>>>
>>>>>
>>>>> Nothing uses fdinfo in Mesa. No driver uses sysfs in Mesa except drm
>>>>> shims, noop drivers, and Intel for perf metrics. sysfs itself is an
>>>>> unusable mess for the PCIe query and is missing information.
>>>>>
>>>>> I'm not against exposing more stuff through sysfs and fdinfo for
>>>>> tools, but I don't see any reason why drivers should use it (other th=
an for
>>>>> slowing down queries and initialization).
>>>>>
>>>>>
>>>>> That's what I'm asking: Is this for some tool or to make some driver
>>>>> decision based on it?
>>>>>
>>>>> If you just want the numbers for over displaying then I think it woul=
d
>>>>> be better to put this into fdinfo together with the other existing st=
uff
>>>>> there.
>>>>>
>>>>
>>>>> If you want to make allocation decisions based on this then we should
>>>>> have that as IOCTL or even better as mmap() page between kernel and
>>>>> userspace. But in this case I would also calculation the numbers comp=
letely
>>>>> different as well.
>>>>>
>>>>> See we have at least the following things in the kernel:
>>>>> 1. The eviction list in the VM.
>>>>>     Those are the BOs which are currently evicted and tried to moved
>>>>> back in on the next CS.
>>>>>
>>>>> 2. The VRAM over commit value.
>>>>>     In other words how much more VRAM than available has the
>>>>> application tried to allocate?
>>>>>
>>>>> 3. The visible VRAM usage by this application.
>>>>>
>>>>> The end goal is that the eviction list will go away, e.g. we will
>>>>> always have stable allocations based on allocations of other applicat=
ions
>>>>> and not constantly swap things in and out.
>>>>>
>>>>> When you now expose the eviction list to userspace we will be stuck
>>>>> with this interface forever.
>>>>>
>>>>
>>>> It's for the GALLIUM HUD.
>>>>
>>>> The only missing thing is the size of all evicted VRAM allocations, an=
d
>>>> the size of all evicted visible VRAM allocations.
>>>>
>>>> 1. No list is exposed. Only sums of buffer sizes are exposed. Also, th=
e
>>>> eviction list has no meaning here. All lists are treated equally, and
>>>> mem_type is compared with preferred_domains to determine where buffers=
 are
>>>> and where they should be.
>>>>
>>>> 2. I'm not interested in the overcommit value. I'm only interested in
>>>> knowing the number of bytes of evicted VRAM right now. It can be as
>>>> variable as the CPU load, but in practice it shouldn't be because PCIe
>>>> doesn't have the bandwidth to move things quickly.
>>>>
>>>> 3. Yes, that's true.
>>>>
>>>> Marek
>>>>
>>>>
>>>
>>

--00000000000010202f05f2fe4abf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A new Gallium HUD &quot;value producer&quot; could be=
 added that reads fdinfo without calling the driver. I still think there is=
 merit in having this in amdgpu_drm.h too.</div><div><br></div><div>Marek<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jan 24, 2023 at 3:13 AM Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div>The table of exposed driver-specific counters:<br></div><div></di=
v><div><a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/=
gallium/drivers/radeonsi/si_query.c#L1751" target=3D"_blank">https://gitlab=
.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/drivers/radeonsi/si_quer=
y.c#L1751</a></div><div><br></div><div>Counter enums. They use the same int=
erface as e.g. occlusion queries, except that begin_query and end_query sav=
e the results in the driver/CPU.<br></div><div><a href=3D"https://gitlab.fr=
eedesktop.org/mesa/mesa/-/blob/main/src/gallium/drivers/radeonsi/si_query.h=
#L45" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/blob/mai=
n/src/gallium/drivers/radeonsi/si_query.h#L45</a></div><div><br></div><div>=
Counters exposed by the winsys:</div><div><a href=3D"https://gitlab.freedes=
ktop.org/mesa/mesa/-/blob/main/src/gallium/include/winsys/radeon_winsys.h#L=
126" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/blob/main=
/src/gallium/include/winsys/radeon_winsys.h#L126</a></div><div><br></div><d=
iv>I just need to query the counters in the winsys and return them.<br></di=
v><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 2:58 AM Christ=
ian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" targ=
et=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    How are the counters which the HUD consumes declared?<br>
    <br>
    See what I want to avoid is a) to nail down the interface with the
    kernel on specific values and b) make it possible to easily expose
    new values.<br>
    <br>
    In other words what we could do with fdinfo is to have something
    like this:<br>
    <br>
    GALLIUM_FDINFO_HUD=3Ddrm-memory-vram,amd-evicted-vram,amd-mclk
    glxgears<br>
    <br>
    And the HUD just displays the values the kernel provides without the
    need to re-compile mesa when we want to add some more values nor
    have the values as part of the UAPI.<br>
    <br>
    Christian.<br>
    <br>
    <div>Am 24.01.23 um 08:37 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>The Gallium HUD doesn&#39;t consume strings. It only consumes
          values that are exposed as counters from the driver. In this
          case, we need the driver to expose evicted stats as counters.
          Each counter can set whether the value is absolute (e.g.
          memory usage) or monotonic (e.g. perf counter). Parsing fdinfo
          to get the values is undesirable.<br>
        </div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 23, 2023 at 4:31
          AM Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumer=
ken@gmail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div> Let&#39;s do this as valid in fdinfo.<br>
            <br>
            This way we can easily extend whatever the kernel wants to
            display as statistics in the userspace HUD.<br>
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            <div>Am 21.01.23 um 01:45 schrieb Marek Ol=C5=A1=C3=A1k:<br>
            </div>
            <blockquote type=3D"cite">
              <div dir=3D"ltr">
                <div>We badly need a way to query evicted memory usage.
                  It&#39;s essential for investigating performance problems
                  and it uncovered the buddy allocator disaster. Please
                  either suggest an alternative, suggest changes, or
                  review. We need it ASAP.<br>
                </div>
                <div><br>
                </div>
                <div>Thanks,</div>
                <div>Marek<br>
                </div>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023
                  at 11:55 AM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:m=
araeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div dir=3D"ltr">
                    <div class=3D"gmail_quote">
                      <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10,
                        2023 at 11:23 AM Christian K=C3=B6nig &lt;<a href=
=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">ckoenig.leic=
htzumerken@gmail.com</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div> Am 10.01.23 um 16:28 schrieb Marek Ol=C5=A1=
=C3=A1k:<br>
                          <blockquote type=3D"cite">
                            <div dir=3D"ltr">
                              <div class=3D"gmail_quote">
                                <div dir=3D"ltr" class=3D"gmail_attr">On
                                  Wed, Jan 4, 2023 at 9:51 AM Christian
                                  K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.=
leichtzumerken@gmail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.co=
m</a>&gt;
                                  wrote:<br>
                                </div>
                                <blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
                                  <div> Am 04.01.23 um 00:08 schrieb
                                    Marek Ol=C5=A1=C3=A1k:<br>
                                    <blockquote type=3D"cite">
                                      <div dir=3D"ltr">
                                        <div>I see about the access now,
                                          but did you even look at the
                                          patch?</div>
                                      </div>
                                    </blockquote>
                                    <br>
                                    I did look at the patch, but I
                                    haven&#39;t fully understood yet what
                                    you are trying to do here.<br>
                                  </div>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>First and foremost, it returns the
                                  evicted size of VRAM and visible VRAM,
                                  and returns visible VRAM usage. It
                                  should be obvious which stat includes
                                  the size of another.<br>
                                </div>
                                <div><br>
                                </div>
                                <blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
                                  <div> <br>
                                    <blockquote type=3D"cite">
                                      <div dir=3D"ltr">
                                        <div> Because what the patch
                                          does isn&#39;t even exposed to
                                          common drm code, such as the
                                          preferred domain and visible
                                          VRAM placement, so it can&#39;t b=
e
                                          in fdinfo right now.<br>
                                        </div>
                                        <div><br>
                                        </div>
                                        <div>Or do you even know what
                                          fdinfo contains? Because it
                                          contains nothing useful. It
                                          only has VRAM and GTT usage,
                                          which we already have in the
                                          INFO ioctl, so it has nothing
                                          that we need. We mainly need
                                          the eviction information and
                                          visible VRAM information now.
                                          Everything else is a bonus.<br>
                                        </div>
                                      </div>
                                    </blockquote>
                                    <br>
                                    Well the main question is what are
                                    you trying to get from that
                                    information? The eviction list for
                                    example is completely meaningless to
                                    userspace, that stuff is only
                                    temporary and will be cleared on the
                                    next CS again.<br>
                                  </div>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>I don&#39;t know what you mean. The
                                  returned eviction stats look correct
                                  and are stable (they don&#39;t change
                                  much). You can suggest changes if you
                                  think some numbers are not reported
                                  correctly.<br>
                                </div>
                                <div>=C2=A0</div>
                                <blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
                                  <div> <br>
                                    What we could expose is the VRAM
                                    over-commit value, e.g. how much BOs
                                    which where supposed to be in VRAM
                                    are in GTT now. I think that&#39;s what
                                    you are looking for here, right?<br>
                                  </div>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>The VRAM overcommit value is
                                  &quot;evicted_vram&quot;.<br>
                                </div>
                                <div>=C2=A0</div>
                                <blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
                                  <div> <br>
                                    <blockquote type=3D"cite">
                                      <div dir=3D"ltr">
                                        <div>
                                          <div>Also, it&#39;s undesirable t=
o
                                            open and parse a text file
                                            if we can just call an
                                            ioctl.</div>
                                        </div>
                                      </div>
                                    </blockquote>
                                    <br>
                                    Well I see the reasoning for that,
                                    but I also see why other drivers do
                                    a lot of the stuff we have as IOCTL
                                    as separate files in sysfs, fdinfo
                                    or debugfs.<br>
                                    <br>
                                    Especially repeating all the static
                                    information which were already
                                    available under sysfs in the INFO
                                    IOCTL was a design mistake as far as
                                    I can see. Just compare what AMDGPU
                                    and the KFD code is doing to what
                                    for example i915 is doing.<br>
                                    <br>
                                    Same for things like debug
                                    information about a process. The
                                    fdinfo stuff can be queried from
                                    external tools (gdb, gputop, umr
                                    etc...) as well which makes that
                                    interface more preferred.<br>
                                  </div>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>Nothing uses fdinfo in Mesa. No
                                  driver uses sysfs in Mesa except drm
                                  shims, noop drivers, and Intel for
                                  perf metrics. sysfs itself is an
                                  unusable mess for the PCIe query and
                                  is missing information.</div>
                                <div><br>
                                </div>
                                <div>I&#39;m not against exposing more stuf=
f
                                  through sysfs and fdinfo for tools,
                                  but I don&#39;t see any reason why driver=
s
                                  should use it (other than for slowing
                                  down queries and initialization).</div>
                              </div>
                            </div>
                          </blockquote>
                          <br>
                          That&#39;s what I&#39;m asking: Is this for some =
tool
                          or to make some driver decision based on it?<br>
                          <br>
                          If you just want the numbers for over
                          displaying then I think it would be better to
                          put this into fdinfo together with the other
                          existing stuff there.<br>
                        </div>
                      </blockquote>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div> <br>
                          If you want to make allocation decisions based
                          on this then we should have that as IOCTL or
                          even better as mmap() page between kernel and
                          userspace. But in this case I would also
                          calculation the numbers completely different
                          as well.<br>
                          <br>
                          See we have at least the following things in
                          the kernel:<br>
                          1. The eviction list in the VM.<br>
                          =C2=A0=C2=A0=C2=A0 Those are the BOs which are cu=
rrently
                          evicted and tried to moved back in on the next
                          CS.<br>
                          <br>
                          2. The VRAM over commit value.<br>
                          =C2=A0=C2=A0=C2=A0 In other words how much more V=
RAM than
                          available has the application tried to
                          allocate?<br>
                          <br>
                          3. The visible VRAM usage by this application.<br=
>
                          <br>
                          The end goal is that the eviction list will go
                          away, e.g. we will always have stable
                          allocations based on allocations of other
                          applications and not constantly swap things in
                          and out.<br>
                          <br>
                          When you now expose the eviction list to
                          userspace we will be stuck with this interface
                          forever.<br>
                        </div>
                      </blockquote>
                      <div><br>
                      </div>
                      <div>It&#39;s for the GALLIUM HUD.</div>
                      <div><br>
                      </div>
                      <div>The only missing thing is the size of all
                        evicted VRAM allocations, and the size of all
                        evicted visible VRAM allocations.<br>
                      </div>
                      <div><br>
                      </div>
                      <div>1. No list is exposed. Only sums of buffer
                        sizes are exposed. Also, the eviction list has
                        no meaning here. All lists are treated equally,
                        and mem_type is compared with preferred_domains
                        to determine where buffers are and where they
                        should be.<br>
                      </div>
                      <div><br>
                      </div>
                      <div>2. I&#39;m not interested in the overcommit
                        value. I&#39;m only interested in knowing the numbe=
r
                        of bytes of evicted VRAM right now. It can be as
                        variable as the CPU load, but in practice it
                        shouldn&#39;t be because PCIe doesn&#39;t have the
                        bandwidth to move things quickly.<br>
                      </div>
                      <div><br>
                      </div>
                      <div>3. Yes, that&#39;s true.</div>
                      <div><br>
                      </div>
                      <div>Marek</div>
                      <br>
                    </div>
                  </div>
                </blockquote>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>
</blockquote></div>

--00000000000010202f05f2fe4abf--
