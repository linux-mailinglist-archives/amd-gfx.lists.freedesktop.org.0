Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4215282D0
	for <lists+amd-gfx@lfdr.de>; Mon, 16 May 2022 13:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5C10F5A8;
	Mon, 16 May 2022 11:06:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424210F4BF
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 May 2022 11:06:50 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 pt3-20020a17090b3d0300b001df448c8d79so2893099pjb.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 May 2022 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KWntT/JeQL4ObpsTc2bdgCsaTy1HUZmSd2xBWudjg8=;
 b=ZNtQpJ2baR4IGo618VqA9ADE7yE5I5oD0UQbqsZCbqzlzwC9xMvFlXIsssDljKUVkd
 wbVbWqDs3IXugS+fMUjaMqNk7QDncvm4VcBQ/1mkibCnlMb5Q1wWZ4rej1C0QT3qDFo4
 groG+CxqCCprlHb/M5vQP520o43j9zuwSCEc9NHysyWutQKyV+7SFJxVP1dluGsEN9g4
 xDUrgQyBBsKZXkRYg54nMUcY3SLyIQ25DdafhNN5DTuuNHTlvcGcvL35OOeNPcOEqXwg
 HbRN/iX9A2kFQEJXj0lR33R4LObp9gVtrgs/Zquw33EFFAFQn0oBmc6euoHAf+IA3BXK
 GmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KWntT/JeQL4ObpsTc2bdgCsaTy1HUZmSd2xBWudjg8=;
 b=acjw1dD+PE6UefumOKWMo9MUSUZW2BGUypWjgvrjlw39RLK79PvxhofyR60T37JR8c
 MOklcEmq+ekwZdGqhCx6JL+ZeDJ7CfbVbNI2yf8a1k4XJoME4IRI5JUQozQqJ2c07qW4
 LMgd/ZoG9RwXQSehxF2/BANplEGRrgH7cIgJ3hi19QhicSoWNAqp7G6/mHvZsytHOakP
 OWoeFrVlw1y9Mg9IIo9bDBV2rVmCvWpagALyMTaOD3cvIcI1Hv24JO6tLOGfT1pDJIJZ
 SxPYj77+P6o0+swh8OV9UjcJfMBWxjGa/Xz803DwP54r05uAX9kHKMsXvnq/uIq4Xu4P
 sIug==
X-Gm-Message-State: AOAM533vbxxQW0BM82Xs2rhTim9kY5/XtSd5zgLaSJjFfFWOZM820Rwn
 wFKfmd6VAQLC3DWVvp+NnC6kknH6jFtUsYQIkLU=
X-Google-Smtp-Source: ABdhPJy8ap9qphE+1RS+Xipfo+TISwsQQ6edVvQXm5X3VUuLlfI1WyfbhEEFk8nLnN9hdaK1bqkNQbhI0vS8NMBPzGQ=
X-Received: by 2002:a17:90a:e617:b0:1df:47ee:9eb7 with SMTP id
 j23-20020a17090ae61700b001df47ee9eb7mr6230196pjy.164.1652699209553; Mon, 16
 May 2022 04:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220506112312.347519-1-christian.koenig@amd.com>
 <20220506112312.347519-2-christian.koenig@amd.com>
 <CAAxE2A7+-MKrh1BoXhGNBY38_7PkvrmZvn-tg4-4CFNXBvdKqw@mail.gmail.com>
 <8695802e-6835-a717-c0ee-83b76d8a8875@gmail.com>
 <5941d83c-6d2b-6e3b-bd5c-b22779929d5e@amd.com>
 <CAAxE2A7-crNh7oTTzgm7W7J412_ijrmoiN9ip9iiS1MJmmaB4A@mail.gmail.com>
 <e3de3d01-25fb-8839-c793-bde9188ba77a@gmail.com>
 <CAAxE2A4P1avEwz0cniZupD9ZkXfnxKJY+1OzAOPRQqnOUcE5OQ@mail.gmail.com>
In-Reply-To: <CAAxE2A4P1avEwz0cniZupD9ZkXfnxKJY+1OzAOPRQqnOUcE5OQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 16 May 2022 07:06:13 -0400
Message-ID: <CAAxE2A5yVDo-6HW9Jt_pO-VwnBFQXQJP9-r0kNThP5XO1KWkFw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: add AMDGPU_VM_NOALLOC
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004e606205df1f05a6"
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
Cc: "Lazar, Lijo" <lijo.lazar@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--0000000000004e606205df1f05a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI, I think it's time to merge this because the Mesa commits are going to
be merged in ~30 minutes if Gitlab CI is green, and that includes updated
amdgpu_drm.h.

Marek

On Wed, May 11, 2022 at 2:55 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:

> Ok sounds good.
>
> Marek
>
> On Wed., May 11, 2022, 03:43 Christian K=C3=B6nig, <
> ckoenig.leichtzumerken@gmail.com> wrote:
>
>> It really *is* a NOALLOC feature. In other words there is no latency
>> improvement on reads because the cache is always checked, even with the
>> noalloc flag set.
>>
>> The only thing it affects is that misses not enter the cache and so don'=
t
>> cause any additional pressure on evicting cache lines.
>>
>> You might want to double check with the hardware guys, but I'm something
>> like 95% sure that it works this way.
>>
>> Christian.
>>
>> Am 11.05.22 um 09:22 schrieb Marek Ol=C5=A1=C3=A1k:
>>
>> Bypass means that the contents of the cache are ignored, which decreases
>> latency at the cost of no coherency between bypassed and normal memory
>> requests. NOA (noalloc) means that the cache is checked and can give you
>> cache hits, but misses are not cached and the overall latency is higher.=
 I
>> don't know what the hw does, but I hope it was misnamed and it really me=
ans
>> bypass because there is no point in doing cache lookups on every memory
>> request if the driver wants to disable caching to *decrease* latency in =
the
>> situations when the cache isn't helping.
>>
>> Marek
>>
>> On Wed, May 11, 2022 at 2:15 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>>
>>>
>>>
>>> On 5/11/2022 11:36 AM, Christian K=C3=B6nig wrote:
>>> > Mhm, it doesn't really bypass MALL. It just doesn't allocate any MALL
>>> > entries on write.
>>> >
>>> > How about AMDGPU_VM_PAGE_NO_MALL ?
>>>
>>> One more - AMDGPU_VM_PAGE_LLC_* [ LLC =3D last level cache, * =3D some =
sort
>>> of attribute which decides LLC behaviour]
>>>
>>> Thanks,
>>> Lijo
>>>
>>> >
>>> > Christian.
>>> >
>>> > Am 10.05.22 um 23:21 schrieb Marek Ol=C5=A1=C3=A1k:
>>> >> A better name would be:
>>> >> AMDGPU_VM_PAGE_BYPASS_MALL
>>> >>
>>> >> Marek
>>> >>
>>> >> On Fri, May 6, 2022 at 7:23 AM Christian K=C3=B6nig
>>> >> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> >>
>>> >>     Add the AMDGPU_VM_NOALLOC flag to let userspace control MALL
>>> >>     allocation.
>>> >>
>>> >>     Only compile tested!
>>> >>
>>> >>     Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> >>     ---
>>> >>      drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 ++
>>> >>      drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 3 +++
>>> >>      drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c  | 3 +++
>>> >>      include/uapi/drm/amdgpu_drm.h           | 2 ++
>>> >>      4 files changed, 10 insertions(+)
>>> >>
>>> >>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> >>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> >>     index bf97d8f07f57..d8129626581f 100644
>>> >>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> >>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> >>     @@ -650,6 +650,8 @@ uint64_t amdgpu_gem_va_map_flags(struct
>>> >>     amdgpu_device *adev, uint32_t flags)
>>> >>                     pte_flag |=3D AMDGPU_PTE_WRITEABLE;
>>> >>             if (flags & AMDGPU_VM_PAGE_PRT)
>>> >>                     pte_flag |=3D AMDGPU_PTE_PRT;
>>> >>     +       if (flags & AMDGPU_VM_PAGE_NOALLOC)
>>> >>     +               pte_flag |=3D AMDGPU_PTE_NOALLOC;
>>> >>
>>> >>             if (adev->gmc.gmc_funcs->map_mtype)
>>> >>                     pte_flag |=3D amdgpu_gmc_map_mtype(adev,
>>> >>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> >>     b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> >>     index b8c79789e1e4..9077dfccaf3c 100644
>>> >>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> >>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> >>     @@ -613,6 +613,9 @@ static void gmc_v10_0_get_vm_pte(struct
>>> >>     amdgpu_device *adev,
>>> >>             *flags &=3D ~AMDGPU_PTE_MTYPE_NV10_MASK;
>>> >>             *flags |=3D (mapping->flags & AMDGPU_PTE_MTYPE_NV10_MASK=
);
>>> >>
>>> >>     +       *flags &=3D ~AMDGPU_PTE_NOALLOC;
>>> >>     +       *flags |=3D (mapping->flags & AMDGPU_PTE_NOALLOC);
>>> >>     +
>>> >>             if (mapping->flags & AMDGPU_PTE_PRT) {
>>> >>                     *flags |=3D AMDGPU_PTE_PRT;
>>> >>                     *flags |=3D AMDGPU_PTE_SNOOPED;
>>> >>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> >>     b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> >>     index 8d733eeac556..32ee56adb602 100644
>>> >>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> >>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> >>     @@ -508,6 +508,9 @@ static void gmc_v11_0_get_vm_pte(struct
>>> >>     amdgpu_device *adev,
>>> >>             *flags &=3D ~AMDGPU_PTE_MTYPE_NV10_MASK;
>>> >>             *flags |=3D (mapping->flags & AMDGPU_PTE_MTYPE_NV10_MASK=
);
>>> >>
>>> >>     +       *flags &=3D ~AMDGPU_PTE_NOALLOC;
>>> >>     +       *flags |=3D (mapping->flags & AMDGPU_PTE_NOALLOC);
>>> >>     +
>>> >>             if (mapping->flags & AMDGPU_PTE_PRT) {
>>> >>                     *flags |=3D AMDGPU_PTE_PRT;
>>> >>                     *flags |=3D AMDGPU_PTE_SNOOPED;
>>> >>     diff --git a/include/uapi/drm/amdgpu_drm.h
>>> >>     b/include/uapi/drm/amdgpu_drm.h
>>> >>     index 57b9d8f0133a..9d71d6330687 100644
>>> >>     --- a/include/uapi/drm/amdgpu_drm.h
>>> >>     +++ b/include/uapi/drm/amdgpu_drm.h
>>> >>     @@ -533,6 +533,8 @@ struct drm_amdgpu_gem_op {
>>> >>      #define AMDGPU_VM_MTYPE_UC             (4 << 5)
>>> >>      /* Use Read Write MTYPE instead of default MTYPE */
>>> >>      #define AMDGPU_VM_MTYPE_RW             (5 << 5)
>>> >>     +/* don't allocate MALL */
>>> >>     +#define AMDGPU_VM_PAGE_NOALLOC         (1 << 9)
>>> >>
>>> >>      struct drm_amdgpu_gem_va {
>>> >>             /** GEM object handle */
>>> >>     --
>>> >>     2.25.1
>>> >>
>>> >
>>>
>>
>>

--0000000000004e606205df1f05a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FYI, I think it&#39;s time to merge this because the =
Mesa commits are going to be merged in ~30 minutes if Gitlab CI is green, a=
nd that includes updated amdgpu_drm.h.</div><div><br></div><div>Marek<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, May 11, 2022 at 2:55 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"ma=
ilto:maraeo@gmail.com">maraeo@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Ok sounds good.<di=
v dir=3D"auto"><br></div><div dir=3D"auto">Marek</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed., May 11, 202=
2, 03:43 Christian K=C3=B6nig, &lt;<a href=3D"mailto:ckoenig.leichtzumerken=
@gmail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    It really *is* a NOALLOC feature. In other words there is no latency
    improvement on reads because the cache is always checked, even with
    the noalloc flag set.<br>
    <br>
    The only thing it affects is that misses not enter the cache and so
    don&#39;t cause any additional pressure on evicting cache lines.<br>
    <br>
    You might want to double check with the hardware guys, but I&#39;m
    something like 95% sure that it works this way.<br>
    <br>
    Christian.<br>
    <br>
    <div>Am 11.05.22 um 09:22 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">Bypass means that the contents of the cache are
          ignored, which decreases latency at the cost of no coherency
          between bypassed and normal memory requests. NOA (noalloc)
          means that the cache is checked and can give you cache hits,
          but misses are not cached and the overall latency is higher. I
          don&#39;t know what the hw does, but I hope it was misnamed and i=
t
          really means bypass because there is no point in doing cache
          lookups on every memory request if the driver wants to disable
          caching to *decrease* latency in the situations when the cache
          isn&#39;t helping.<br>
        </div>
        <div dir=3D"ltr"><br>
        </div>
        <div>Marek<br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 11, 2022 at 2:1=
5
            AM Lazar, Lijo &lt;<a href=3D"mailto:lijo.lazar@amd.com" rel=3D=
"noreferrer" target=3D"_blank">lijo.lazar@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
            <br>
            On 5/11/2022 11:36 AM, Christian K=C3=B6nig wrote:<br>
            &gt; Mhm, it doesn&#39;t really bypass MALL. It just doesn&#39;=
t
            allocate any MALL <br>
            &gt; entries on write.<br>
            &gt; <br>
            &gt; How about AMDGPU_VM_PAGE_NO_MALL ?<br>
            <br>
            One more - AMDGPU_VM_PAGE_LLC_* [ LLC =3D last level cache, *
            =3D some sort <br>
            of attribute which decides LLC behaviour]<br>
            <br>
            Thanks,<br>
            Lijo<br>
            <br>
            &gt; <br>
            &gt; Christian.<br>
            &gt; <br>
            &gt; Am 10.05.22 um 23:21 schrieb Marek Ol=C5=A1=C3=A1k:<br>
            &gt;&gt; A better name would be:<br>
            &gt;&gt; AMDGPU_VM_PAGE_BYPASS_MALL<br>
            &gt;&gt;<br>
            &gt;&gt; Marek<br>
            &gt;&gt;<br>
            &gt;&gt; On Fri, May 6, 2022 at 7:23 AM Christian K=C3=B6nig <b=
r>
            &gt;&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com=
" rel=3D"noreferrer" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>=
&gt;
            wrote:<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0Add the AMDGPU_VM_NOALLOC flag to l=
et userspace
            control MALL<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0allocation.<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0Only compile tested!<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Christian K=C3=B6nig=
 &lt;<a href=3D"mailto:christian.koenig@amd.com" rel=3D"noreferrer" target=
=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0---<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/am=
dgpu_gem.c | 2 ++<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/gm=
c_v10_0.c=C2=A0 | 3
            +++<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/gm=
c_v11_0.c=C2=A0 | 3
            +++<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/uapi/drm/amdgpu_drm.h=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A04 files changed, 10 insertion=
s(+)<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0diff --git
            a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/amdgpu/amdgpu=
_gem.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0index bf97d8f07f57..d8129626581f 10=
0644<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0--- a/drivers/gpu/drm/amd/amdgpu/am=
dgpu_gem.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+++ b/drivers/gpu/drm/amd/amdgpu/am=
dgpu_gem.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0@@ -650,6 +650,8 @@ uint64_t
            amdgpu_gem_va_map_flags(struct<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0amdgpu_device *adev, uint32_t flags=
)<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pte_flag |=3D
            AMDGPU_PTE_WRITEABLE;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fla=
gs &amp; AMDGPU_VM_PAGE_PRT)<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pte_flag |=3D AMDGPU_PTE_PRT;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fla=
gs &amp; AMDGPU_VM_PAGE_NOALLOC)<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0pte_flag |=3D AMDGPU_PTE_NOALLOC;<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 if
            (adev-&gt;gmc.gmc_funcs-&gt;map_mtype)<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pte_flag |=3D
            amdgpu_gmc_map_mtype(adev,<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0diff --git
            a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/amdgpu/gmc_v1=
0_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0index b8c79789e1e4..9077dfccaf3c 10=
0644<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0--- a/drivers/gpu/drm/amd/amdgpu/gm=
c_v10_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+++ b/drivers/gpu/drm/amd/amdgpu/gm=
c_v10_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0@@ -613,6 +613,9 @@ static void
            gmc_v10_0_get_vm_pte(struct<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0amdgpu_device *adev,<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 *flags =
&amp;=3D
            ~AMDGPU_PTE_MTYPE_NV10_MASK;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 *flags =
|=3D (mapping-&gt;flags &amp;
            AMDGPU_PTE_MTYPE_NV10_MASK);<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0*flags =
&amp;=3D ~AMDGPU_PTE_NOALLOC;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0*flags =
|=3D (mapping-&gt;flags &amp;
            AMDGPU_PTE_NOALLOC);<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (map=
ping-&gt;flags &amp;
            AMDGPU_PTE_PRT) {<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 *flags |=3D AMDGPU_PTE_PRT;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 *flags |=3D AMDGPU_PTE_SNOOPED;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0diff --git
            a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/amdgpu/gmc_v1=
1_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0index 8d733eeac556..32ee56adb602 10=
0644<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0--- a/drivers/gpu/drm/amd/amdgpu/gm=
c_v11_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+++ b/drivers/gpu/drm/amd/amdgpu/gm=
c_v11_0.c<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0@@ -508,6 +508,9 @@ static void
            gmc_v11_0_get_vm_pte(struct<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0amdgpu_device *adev,<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 *flags =
&amp;=3D
            ~AMDGPU_PTE_MTYPE_NV10_MASK;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 *flags =
|=3D (mapping-&gt;flags &amp;
            AMDGPU_PTE_MTYPE_NV10_MASK);<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0*flags =
&amp;=3D ~AMDGPU_PTE_NOALLOC;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0*flags =
|=3D (mapping-&gt;flags &amp;
            AMDGPU_PTE_NOALLOC);<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (map=
ping-&gt;flags &amp;
            AMDGPU_PTE_PRT) {<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 *flags |=3D AMDGPU_PTE_PRT;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 *flags |=3D AMDGPU_PTE_SNOOPED;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/uapi/drm/amdgp=
u_drm.h<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0b/include/uapi/drm/amdgpu_drm.h<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0index 57b9d8f0133a..9d71d6330687 10=
0644<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0--- a/include/uapi/drm/amdgpu_drm.h=
<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/uapi/drm/amdgpu_drm.h=
<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0@@ -533,6 +533,8 @@ struct drm_amdg=
pu_gem_op {<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#define AMDGPU_VM_MTYPE_UC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(4
            &lt;&lt; 5)<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/* Use Read Write MTYPE inste=
ad of default
            MTYPE */<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#define AMDGPU_VM_MTYPE_RW=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(5
            &lt;&lt; 5)<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+/* don&#39;t allocate MALL */<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0+#define AMDGPU_VM_PAGE_NOALLOC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1
            &lt;&lt; 9)<br>
            &gt;&gt;<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0struct drm_amdgpu_gem_va {<br=
>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** GEM=
 object handle */<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A02.25.1<br>
            &gt;&gt;<br>
            &gt; <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>
</blockquote></div>

--0000000000004e606205df1f05a6--
