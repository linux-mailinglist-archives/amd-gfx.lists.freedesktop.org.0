Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980365289FE
	for <lists+amd-gfx@lfdr.de>; Mon, 16 May 2022 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BAF10E28C;
	Mon, 16 May 2022 16:13:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C8710E03E
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 May 2022 16:13:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dk23so29632615ejb.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 May 2022 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=Qj39RGncsv7hbhPVnOr+rW3RmMjpS4K0uMoGPP7uVPw=;
 b=J5Vbnk0oIY/1l7xbyqmop4LYADH7v7vXaiYriKxGrgBEtelEZEZmpo8bCB77Xz1lgD
 myw3xSaRUZ8G7T7Wshl4jtcmVF38mFpQ/ey/GUkZJNJMkUMeGGM+9DQv6pn7kONx9Uwx
 0jliANJOqvvsZ84PGgWkN7hxjUGdhbZrm36aKu6dA4HY4WzMJvexIc1PsRv/z4LJiOfZ
 vwOeHQyDUY0MCTC0psf+eB9EJxovMVG6Yhg0hu4MHa1hD68q7JRJFljHzEIkU0VVM3Jj
 Qw1VzBr0qJeN+oCDv4tLw6vJPBELPpdU0EOzeLO7jipXTSbOm+A36CkMuqXT18yagch6
 ZjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=Qj39RGncsv7hbhPVnOr+rW3RmMjpS4K0uMoGPP7uVPw=;
 b=NV3fJp/0PHOdhzRe1OVB1bqCmHu23tpTlfYMEuDGAVMitqn4/mqV4npn+dWj/PoHaw
 if6lWBeiFgOKw8eQc8F0XYo6vlPE+x8Y8EF0O0msbrANIstUrKlxZ7KEy85BXgkX5Nb6
 I6ps3ZZjovHUnVmGVNtETpim3Rru6RMTZS3oTMPoptZMXsEGWxGz3O+hLdKB1Kj3CCpV
 Oz/j9+fSTA4T0e5r2acLbWLdW0CFOiUMpqSeTqF7VCW6cEYs6p8XmTgDyNxkzp9mSONN
 vhrihzpL/MVHVOT3cOscCYaBKbekbG7k8RBhngmoBXBi1TkKSTKGgEfiGsoNP20TIHSD
 Dq7Q==
X-Gm-Message-State: AOAM532SYy7cTDfJh0r5HwIVdFbFvui5uqNN8Ue1tUmxmr6cll05yHT1
 DpA+jk9YPsTRhMUx4tNvFqc=
X-Google-Smtp-Source: ABdhPJwrYrX585XXN5lX7hUwtSr2UA7ySzi6eXmMM6faLty1yCGy91cqaYk/VqQGtQ3AyAiYARNvhg==
X-Received: by 2002:a17:907:97d5:b0:6f5:405:ef01 with SMTP id
 js21-20020a17090797d500b006f50405ef01mr15707941ejc.551.1652717617331; 
 Mon, 16 May 2022 09:13:37 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:94fe:854e:ccf6:68c4?
 ([2a02:908:1256:79a0:94fe:854e:ccf6:68c4])
 by smtp.gmail.com with ESMTPSA id
 gv32-20020a1709072be000b006f3ef214dfcsm58659ejc.98.2022.05.16.09.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 09:13:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------nTauQ3o7VDlUp04XTlUsAlNR"
Message-ID: <c0eb4a43-95b3-9db9-b095-685e900819cb@gmail.com>
Date: Mon, 16 May 2022 18:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] drm/amdgpu: add AMDGPU_VM_NOALLOC
Content-Language: en-US
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20220506112312.347519-1-christian.koenig@amd.com>
 <20220506112312.347519-2-christian.koenig@amd.com>
 <CAAxE2A7+-MKrh1BoXhGNBY38_7PkvrmZvn-tg4-4CFNXBvdKqw@mail.gmail.com>
 <8695802e-6835-a717-c0ee-83b76d8a8875@gmail.com>
 <5941d83c-6d2b-6e3b-bd5c-b22779929d5e@amd.com>
 <CAAxE2A7-crNh7oTTzgm7W7J412_ijrmoiN9ip9iiS1MJmmaB4A@mail.gmail.com>
 <e3de3d01-25fb-8839-c793-bde9188ba77a@gmail.com>
 <CAAxE2A4P1avEwz0cniZupD9ZkXfnxKJY+1OzAOPRQqnOUcE5OQ@mail.gmail.com>
 <CAAxE2A5yVDo-6HW9Jt_pO-VwnBFQXQJP9-r0kNThP5XO1KWkFw@mail.gmail.com>
 <CAAxE2A7TPhshFx7EJir9iS580XO7-1N1hJCpeoKXRvMH7au1gQ@mail.gmail.com>
 <e33d0e1a-8992-142d-5084-a8667110c172@gmail.com>
 <CAAxE2A6-1znDCdZ-3WUbqjQw_B=Sr4qpXz3Hw4o8VA8EAPuVDg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAAxE2A6-1znDCdZ-3WUbqjQw_B=Sr4qpXz3Hw4o8VA8EAPuVDg@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------nTauQ3o7VDlUp04XTlUsAlNR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I don't have access to any gfx10 hardware.

Can you give me a dmesg and/or backtrace, etc..?

I can't push this unless it's working properly.

Christian.

Am 16.05.22 um 14:56 schrieb Marek Olšák:
> Reproduction steps:
> - use mesa/main on gfx10.3 (not sure what other GPUs do)
> - run: radeonsi_mall_noalloc=true glxgears
>
> Marek
>
> On Mon, May 16, 2022 at 7:53 AM Christian König 
> <ckoenig.leichtzumerken@gmail.com> wrote:
>
>     Crap, do you have a link to the failure?
>
>     Am 16.05.22 um 13:10 schrieb Marek Olšák:
>>     I forgot to say: The NOALLOC flag causes an allocation failure,
>>     so there is a kernel bug somewhere.
>>
>>     Marek
>>
>>     On Mon, May 16, 2022 at 7:06 AM Marek Olšák <maraeo@gmail.com> wrote:
>>
>>         FYI, I think it's time to merge this because the Mesa commits
>>         are going to be merged in ~30 minutes if Gitlab CI is green,
>>         and that includes updated amdgpu_drm.h.
>>
>>         Marek
>>
>>         On Wed, May 11, 2022 at 2:55 PM Marek Olšák
>>         <maraeo@gmail.com> wrote:
>>
>>             Ok sounds good.
>>
>>             Marek
>>
>>             On Wed., May 11, 2022, 03:43 Christian König,
>>             <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>>                 It really *is* a NOALLOC feature. In other words
>>                 there is no latency improvement on reads because the
>>                 cache is always checked, even with the noalloc flag set.
>>
>>                 The only thing it affects is that misses not enter
>>                 the cache and so don't cause any additional pressure
>>                 on evicting cache lines.
>>
>>                 You might want to double check with the hardware
>>                 guys, but I'm something like 95% sure that it works
>>                 this way.
>>
>>                 Christian.
>>
>>                 Am 11.05.22 um 09:22 schrieb Marek Olšák:
>>>                 Bypass means that the contents of the cache are
>>>                 ignored, which decreases latency at the cost of no
>>>                 coherency between bypassed and normal memory
>>>                 requests. NOA (noalloc) means that the cache is
>>>                 checked and can give you cache hits, but misses are
>>>                 not cached and the overall latency is higher. I
>>>                 don't know what the hw does, but I hope it was
>>>                 misnamed and it really means bypass because there is
>>>                 no point in doing cache lookups on every memory
>>>                 request if the driver wants to disable caching to
>>>                 *decrease* latency in the situations when the cache
>>>                 isn't helping.
>>>
>>>                 Marek
>>>
>>>                 On Wed, May 11, 2022 at 2:15 AM Lazar, Lijo
>>>                 <lijo.lazar@amd.com> wrote:
>>>
>>>
>>>
>>>                     On 5/11/2022 11:36 AM, Christian König wrote:
>>>                     > Mhm, it doesn't really bypass MALL. It just
>>>                     doesn't allocate any MALL
>>>                     > entries on write.
>>>                     >
>>>                     > How about AMDGPU_VM_PAGE_NO_MALL ?
>>>
>>>                     One more - AMDGPU_VM_PAGE_LLC_* [ LLC = last
>>>                     level cache, * = some sort
>>>                     of attribute which decides LLC behaviour]
>>>
>>>                     Thanks,
>>>                     Lijo
>>>
>>>                     >
>>>                     > Christian.
>>>                     >
>>>                     > Am 10.05.22 um 23:21 schrieb Marek Olšák:
>>>                     >> A better name would be:
>>>                     >> AMDGPU_VM_PAGE_BYPASS_MALL
>>>                     >>
>>>                     >> Marek
>>>                     >>
>>>                     >> On Fri, May 6, 2022 at 7:23 AM Christian König
>>>                     >> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>                     >>
>>>                     >>     Add the AMDGPU_VM_NOALLOC flag to let
>>>                     userspace control MALL
>>>                     >>     allocation.
>>>                     >>
>>>                     >>     Only compile tested!
>>>                     >>
>>>                     >>     Signed-off-by: Christian König
>>>                     <christian.koenig@amd.com>
>>>                     >>     ---
>>>                     >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 ++
>>>                     >>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 3 +++
>>>                     >>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 3 +++
>>>                     >>   include/uapi/drm/amdgpu_drm.h        | 2 ++
>>>                     >>      4 files changed, 10 insertions(+)
>>>                     >>
>>>                     >>     diff --git
>>>                     a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>                     >>  b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>                     >>     index bf97d8f07f57..d8129626581f 100644
>>>                     >>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>                     >>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>                     >>     @@ -650,6 +650,8 @@ uint64_t
>>>                     amdgpu_gem_va_map_flags(struct
>>>                     >>     amdgpu_device *adev, uint32_t flags)
>>>                     >> pte_flag |= AMDGPU_PTE_WRITEABLE;
>>>                     >>             if (flags & AMDGPU_VM_PAGE_PRT)
>>>                     >> pte_flag |= AMDGPU_PTE_PRT;
>>>                     >>     +       if (flags & AMDGPU_VM_PAGE_NOALLOC)
>>>                     >>     +  pte_flag |= AMDGPU_PTE_NOALLOC;
>>>                     >>
>>>                     >>             if (adev->gmc.gmc_funcs->map_mtype)
>>>                     >> pte_flag |= amdgpu_gmc_map_mtype(adev,
>>>                     >>     diff --git
>>>                     a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>                     >>  b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>                     >>     index b8c79789e1e4..9077dfccaf3c 100644
>>>                     >>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>                     >>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>                     >>     @@ -613,6 +613,9 @@ static void
>>>                     gmc_v10_0_get_vm_pte(struct
>>>                     >>     amdgpu_device *adev,
>>>                     >>             *flags &=
>>>                     ~AMDGPU_PTE_MTYPE_NV10_MASK;
>>>                     >>             *flags |= (mapping->flags &
>>>                     AMDGPU_PTE_MTYPE_NV10_MASK);
>>>                     >>
>>>                     >>     +       *flags &= ~AMDGPU_PTE_NOALLOC;
>>>                     >>     +       *flags |= (mapping->flags &
>>>                     AMDGPU_PTE_NOALLOC);
>>>                     >>     +
>>>                     >>             if (mapping->flags &
>>>                     AMDGPU_PTE_PRT) {
>>>                     >> *flags |= AMDGPU_PTE_PRT;
>>>                     >> *flags |= AMDGPU_PTE_SNOOPED;
>>>                     >>     diff --git
>>>                     a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>                     >>  b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>                     >>     index 8d733eeac556..32ee56adb602 100644
>>>                     >>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>                     >>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>                     >>     @@ -508,6 +508,9 @@ static void
>>>                     gmc_v11_0_get_vm_pte(struct
>>>                     >>     amdgpu_device *adev,
>>>                     >>             *flags &=
>>>                     ~AMDGPU_PTE_MTYPE_NV10_MASK;
>>>                     >>             *flags |= (mapping->flags &
>>>                     AMDGPU_PTE_MTYPE_NV10_MASK);
>>>                     >>
>>>                     >>     +       *flags &= ~AMDGPU_PTE_NOALLOC;
>>>                     >>     +       *flags |= (mapping->flags &
>>>                     AMDGPU_PTE_NOALLOC);
>>>                     >>     +
>>>                     >>             if (mapping->flags &
>>>                     AMDGPU_PTE_PRT) {
>>>                     >> *flags |= AMDGPU_PTE_PRT;
>>>                     >> *flags |= AMDGPU_PTE_SNOOPED;
>>>                     >>     diff --git a/include/uapi/drm/amdgpu_drm.h
>>>                     >>  b/include/uapi/drm/amdgpu_drm.h
>>>                     >>     index 57b9d8f0133a..9d71d6330687 100644
>>>                     >>     --- a/include/uapi/drm/amdgpu_drm.h
>>>                     >>     +++ b/include/uapi/drm/amdgpu_drm.h
>>>                     >>     @@ -533,6 +533,8 @@ struct
>>>                     drm_amdgpu_gem_op {
>>>                     >>      #define AMDGPU_VM_MTYPE_UC           
>>>                      (4 << 5)
>>>                     >>      /* Use Read Write MTYPE instead of
>>>                     default MTYPE */
>>>                     >>      #define AMDGPU_VM_MTYPE_RW           
>>>                      (5 << 5)
>>>                     >>     +/* don't allocate MALL */
>>>                     >>     +#define AMDGPU_VM_PAGE_NOALLOC       
>>>                      (1 << 9)
>>>                     >>
>>>                     >>      struct drm_amdgpu_gem_va {
>>>                     >>             /** GEM object handle */
>>>                     >>     --
>>>                     >>     2.25.1
>>>                     >>
>>>                     >
>>>
>>
>

--------------nTauQ3o7VDlUp04XTlUsAlNR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    I don't have access to any gfx10 hardware.<br>
    <br>
    Can you give me a dmesg and/or backtrace, etc..?<br>
    <br>
    I can't push this unless it's working properly.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 16.05.22 um 14:56 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A6-1znDCdZ-3WUbqjQw_B=Sr4qpXz3Hw4o8VA8EAPuVDg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Reproduction steps:</div>
        <div>- use mesa/main on gfx10.3 (not sure what other GPUs do)<br>
        </div>
        <div>- run: radeonsi_mall_noalloc=true glxgears</div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, May 16, 2022 at 7:53
            AM Christian König &lt;<a
              href="mailto:ckoenig.leichtzumerken@gmail.com"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">ckoenig.leichtzumerken@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div> Crap, do you have a link to the failure?<br>
              <br>
              <div>Am 16.05.22 um 13:10 schrieb Marek Olšák:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div>I forgot to say: The NOALLOC flag causes an
                    allocation failure, so there is a kernel bug
                    somewhere.</div>
                  <div><br>
                  </div>
                  <div>Marek<br>
                  </div>
                </div>
                <br>
                <div class="gmail_quote">
                  <div dir="ltr" class="gmail_attr">On Mon, May 16, 2022
                    at 7:06 AM Marek Olšák &lt;<a
                      href="mailto:maraeo@gmail.com" target="_blank"
                      moz-do-not-send="true"
                      class="moz-txt-link-freetext">maraeo@gmail.com</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class="gmail_quote" style="margin:0px 0px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">
                    <div dir="ltr">
                      <div>FYI, I think it's time to merge this because
                        the Mesa commits are going to be merged in ~30
                        minutes if Gitlab CI is green, and that includes
                        updated amdgpu_drm.h.</div>
                      <div><br>
                      </div>
                      <div>Marek<br>
                      </div>
                    </div>
                    <br>
                    <div class="gmail_quote">
                      <div dir="ltr" class="gmail_attr">On Wed, May 11,
                        2022 at 2:55 PM Marek Olšák &lt;<a
                          href="mailto:maraeo@gmail.com" target="_blank"
                          moz-do-not-send="true"
                          class="moz-txt-link-freetext">maraeo@gmail.com</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class="gmail_quote" style="margin:0px
                        0px 0px 0.8ex;border-left:1px solid
                        rgb(204,204,204);padding-left:1ex">
                        <div dir="auto">Ok sounds good.
                          <div dir="auto"><br>
                          </div>
                          <div dir="auto">Marek</div>
                        </div>
                        <br>
                        <div class="gmail_quote">
                          <div dir="ltr" class="gmail_attr">On Wed., May
                            11, 2022, 03:43 Christian König, &lt;<a
                              href="mailto:ckoenig.leichtzumerken@gmail.com"
                              target="_blank" moz-do-not-send="true"
                              class="moz-txt-link-freetext">ckoenig.leichtzumerken@gmail.com</a>&gt;
                            wrote:<br>
                          </div>
                          <blockquote class="gmail_quote"
                            style="margin:0px 0px 0px
                            0.8ex;border-left:1px solid
                            rgb(204,204,204);padding-left:1ex">
                            <div> It really *is* a NOALLOC feature. In
                              other words there is no latency
                              improvement on reads because the cache is
                              always checked, even with the noalloc flag
                              set.<br>
                              <br>
                              The only thing it affects is that misses
                              not enter the cache and so don't cause any
                              additional pressure on evicting cache
                              lines.<br>
                              <br>
                              You might want to double check with the
                              hardware guys, but I'm something like 95%
                              sure that it works this way.<br>
                              <br>
                              Christian.<br>
                              <br>
                              <div>Am 11.05.22 um 09:22 schrieb Marek
                                Olšák:<br>
                              </div>
                              <blockquote type="cite">
                                <div dir="ltr">
                                  <div dir="ltr">Bypass means that the
                                    contents of the cache are ignored,
                                    which decreases latency at the cost
                                    of no coherency between bypassed and
                                    normal memory requests. NOA
                                    (noalloc) means that the cache is
                                    checked and can give you cache hits,
                                    but misses are not cached and the
                                    overall latency is higher. I don't
                                    know what the hw does, but I hope it
                                    was misnamed and it really means
                                    bypass because there is no point in
                                    doing cache lookups on every memory
                                    request if the driver wants to
                                    disable caching to *decrease*
                                    latency in the situations when the
                                    cache isn't helping.<br>
                                  </div>
                                  <div dir="ltr"><br>
                                  </div>
                                  <div>Marek<br>
                                  </div>
                                  <br>
                                  <div class="gmail_quote">
                                    <div dir="ltr" class="gmail_attr">On
                                      Wed, May 11, 2022 at 2:15 AM
                                      Lazar, Lijo &lt;<a
                                        href="mailto:lijo.lazar@amd.com"
                                        rel="noreferrer" target="_blank"
                                        moz-do-not-send="true"
                                        class="moz-txt-link-freetext">lijo.lazar@amd.com</a>&gt;
                                      wrote:<br>
                                    </div>
                                    <blockquote class="gmail_quote"
                                      style="margin:0px 0px 0px
                                      0.8ex;border-left:1px solid
                                      rgb(204,204,204);padding-left:1ex"><br>
                                      <br>
                                      On 5/11/2022 11:36 AM, Christian
                                      König wrote:<br>
                                      &gt; Mhm, it doesn't really bypass
                                      MALL. It just doesn't allocate any
                                      MALL <br>
                                      &gt; entries on write.<br>
                                      &gt; <br>
                                      &gt; How about
                                      AMDGPU_VM_PAGE_NO_MALL ?<br>
                                      <br>
                                      One more - AMDGPU_VM_PAGE_LLC_* [
                                      LLC = last level cache, * = some
                                      sort <br>
                                      of attribute which decides LLC
                                      behaviour]<br>
                                      <br>
                                      Thanks,<br>
                                      Lijo<br>
                                      <br>
                                      &gt; <br>
                                      &gt; Christian.<br>
                                      &gt; <br>
                                      &gt; Am 10.05.22 um 23:21 schrieb
                                      Marek Olšák:<br>
                                      &gt;&gt; A better name would be:<br>
                                      &gt;&gt;
                                      AMDGPU_VM_PAGE_BYPASS_MALL<br>
                                      &gt;&gt;<br>
                                      &gt;&gt; Marek<br>
                                      &gt;&gt;<br>
                                      &gt;&gt; On Fri, May 6, 2022 at
                                      7:23 AM Christian König <br>
                                      &gt;&gt; &lt;<a
                                        href="mailto:ckoenig.leichtzumerken@gmail.com"
                                        rel="noreferrer" target="_blank"
                                        moz-do-not-send="true"
                                        class="moz-txt-link-freetext">ckoenig.leichtzumerken@gmail.com</a>&gt;
                                      wrote:<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;     Add the
                                      AMDGPU_VM_NOALLOC flag to let
                                      userspace control MALL<br>
                                      &gt;&gt;     allocation.<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;     Only compile tested!<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;     Signed-off-by:
                                      Christian König &lt;<a
                                        href="mailto:christian.koenig@amd.com"
                                        rel="noreferrer" target="_blank"
                                        moz-do-not-send="true"
                                        class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
                                      &gt;&gt;     ---<br>
                                      &gt;&gt;   
                                        drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
                                      | 2 ++<br>
                                      &gt;&gt;   
                                        drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c 
                                      | 3 +++<br>
                                      &gt;&gt;   
                                        drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c 
                                      | 3 +++<br>
                                      &gt;&gt;   
                                        include/uapi/drm/amdgpu_drm.h   
                                             | 2 ++<br>
                                      &gt;&gt;      4 files changed, 10
                                      insertions(+)<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;     diff --git
                                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                                      &gt;&gt;   
                                       b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                                      &gt;&gt;     index
                                      bf97d8f07f57..d8129626581f 100644<br>
                                      &gt;&gt;     ---
                                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                                      &gt;&gt;     +++
                                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                                      &gt;&gt;     @@ -650,6 +650,8 @@
                                      uint64_t
                                      amdgpu_gem_va_map_flags(struct<br>
                                      &gt;&gt;     amdgpu_device *adev,
                                      uint32_t flags)<br>
                                      &gt;&gt;                    
                                      pte_flag |= AMDGPU_PTE_WRITEABLE;<br>
                                      &gt;&gt;             if (flags
                                      &amp; AMDGPU_VM_PAGE_PRT)<br>
                                      &gt;&gt;                    
                                      pte_flag |= AMDGPU_PTE_PRT;<br>
                                      &gt;&gt;     +       if (flags
                                      &amp; AMDGPU_VM_PAGE_NOALLOC)<br>
                                      &gt;&gt;     +             
                                       pte_flag |= AMDGPU_PTE_NOALLOC;<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;             if
                                      (adev-&gt;gmc.gmc_funcs-&gt;map_mtype)<br>
                                      &gt;&gt;                    
                                      pte_flag |=
                                      amdgpu_gmc_map_mtype(adev,<br>
                                      &gt;&gt;     diff --git
                                      a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                                      &gt;&gt;   
                                       b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                                      &gt;&gt;     index
                                      b8c79789e1e4..9077dfccaf3c 100644<br>
                                      &gt;&gt;     ---
                                      a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                                      &gt;&gt;     +++
                                      b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                                      &gt;&gt;     @@ -613,6 +613,9 @@
                                      static void
                                      gmc_v10_0_get_vm_pte(struct<br>
                                      &gt;&gt;     amdgpu_device *adev,<br>
                                      &gt;&gt;             *flags &amp;=
                                      ~AMDGPU_PTE_MTYPE_NV10_MASK;<br>
                                      &gt;&gt;             *flags |=
                                      (mapping-&gt;flags &amp;
                                      AMDGPU_PTE_MTYPE_NV10_MASK);<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;     +       *flags &amp;=
                                      ~AMDGPU_PTE_NOALLOC;<br>
                                      &gt;&gt;     +       *flags |=
                                      (mapping-&gt;flags &amp;
                                      AMDGPU_PTE_NOALLOC);<br>
                                      &gt;&gt;     +<br>
                                      &gt;&gt;             if
                                      (mapping-&gt;flags &amp;
                                      AMDGPU_PTE_PRT) {<br>
                                      &gt;&gt;                    
                                      *flags |= AMDGPU_PTE_PRT;<br>
                                      &gt;&gt;                    
                                      *flags |= AMDGPU_PTE_SNOOPED;<br>
                                      &gt;&gt;     diff --git
                                      a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c<br>
                                      &gt;&gt;   
                                       b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c<br>
                                      &gt;&gt;     index
                                      8d733eeac556..32ee56adb602 100644<br>
                                      &gt;&gt;     ---
                                      a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c<br>
                                      &gt;&gt;     +++
                                      b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c<br>
                                      &gt;&gt;     @@ -508,6 +508,9 @@
                                      static void
                                      gmc_v11_0_get_vm_pte(struct<br>
                                      &gt;&gt;     amdgpu_device *adev,<br>
                                      &gt;&gt;             *flags &amp;=
                                      ~AMDGPU_PTE_MTYPE_NV10_MASK;<br>
                                      &gt;&gt;             *flags |=
                                      (mapping-&gt;flags &amp;
                                      AMDGPU_PTE_MTYPE_NV10_MASK);<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;     +       *flags &amp;=
                                      ~AMDGPU_PTE_NOALLOC;<br>
                                      &gt;&gt;     +       *flags |=
                                      (mapping-&gt;flags &amp;
                                      AMDGPU_PTE_NOALLOC);<br>
                                      &gt;&gt;     +<br>
                                      &gt;&gt;             if
                                      (mapping-&gt;flags &amp;
                                      AMDGPU_PTE_PRT) {<br>
                                      &gt;&gt;                    
                                      *flags |= AMDGPU_PTE_PRT;<br>
                                      &gt;&gt;                    
                                      *flags |= AMDGPU_PTE_SNOOPED;<br>
                                      &gt;&gt;     diff --git
                                      a/include/uapi/drm/amdgpu_drm.h<br>
                                      &gt;&gt;   
                                       b/include/uapi/drm/amdgpu_drm.h<br>
                                      &gt;&gt;     index
                                      57b9d8f0133a..9d71d6330687 100644<br>
                                      &gt;&gt;     ---
                                      a/include/uapi/drm/amdgpu_drm.h<br>
                                      &gt;&gt;     +++
                                      b/include/uapi/drm/amdgpu_drm.h<br>
                                      &gt;&gt;     @@ -533,6 +533,8 @@
                                      struct drm_amdgpu_gem_op {<br>
                                      &gt;&gt;      #define
                                      AMDGPU_VM_MTYPE_UC             (4
                                      &lt;&lt; 5)<br>
                                      &gt;&gt;      /* Use Read Write
                                      MTYPE instead of default MTYPE */<br>
                                      &gt;&gt;      #define
                                      AMDGPU_VM_MTYPE_RW             (5
                                      &lt;&lt; 5)<br>
                                      &gt;&gt;     +/* don't allocate
                                      MALL */<br>
                                      &gt;&gt;     +#define
                                      AMDGPU_VM_PAGE_NOALLOC         (1
                                      &lt;&lt; 9)<br>
                                      &gt;&gt;<br>
                                      &gt;&gt;      struct
                                      drm_amdgpu_gem_va {<br>
                                      &gt;&gt;             /** GEM
                                      object handle */<br>
                                      &gt;&gt;     -- <br>
                                      &gt;&gt;     2.25.1<br>
                                      &gt;&gt;<br>
                                      &gt; <br>
                                    </blockquote>
                                  </div>
                                </div>
                              </blockquote>
                              <br>
                            </div>
                          </blockquote>
                        </div>
                      </blockquote>
                    </div>
                  </blockquote>
                </div>
              </blockquote>
              <br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------nTauQ3o7VDlUp04XTlUsAlNR--
