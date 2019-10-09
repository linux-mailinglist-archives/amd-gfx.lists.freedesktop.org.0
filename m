Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D02AED0DCE
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D47D6E2EC;
	Wed,  9 Oct 2019 11:40:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950B6E2EC
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:40:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m18so2220918wmc.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Oct 2019 04:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=Qdk8i/PWMA1GrzCqGoA0Pf7JT3j1/Cwv9WvLZnu03BM=;
 b=Y9JF9dP3PvabxlgzFVXj9IG3fIaxhCodywEa+SXB+Sctq7dzk/xS4t6O7dtK3GskzP
 kr3m8iGaFpRHgzINHhmM8LMpHvKIc7kU+Hpq2ooYyNhx3tT5LbCI5LYh2nCm52wQk+YS
 kTuEM/lXfLibyyj8i8t3nHHK9kZLNzh0rxJ3vbuMBt3wYJdr7UUQ+7Nkb/u6CJZnY7I4
 QR+75DccHtDGYimsfR9AQ6f1nhJvgCdzmKBxB53I9wkV4lEcpAa6ISvvRBj4KPb4+P6q
 niq3jeEf6D9W8LdZPoLSOmzI7G8peMxSjBhD00Msc2WU33JEhULG2pZSjseoRJhsRKKN
 KvOw==
X-Gm-Message-State: APjAAAXyMpfDfsBSY6H0UwHYGew1aFtlNwLqWYrGMBbFEU9OvI0Qk8sn
 SpOmId4iyk76b1Iw9XhhThE=
X-Google-Smtp-Source: APXvYqxHKxJSFLoLPYgLICUB/nMzdLXOAYn2jEkLeNplPamLPsUNwl6pl6//91dZif5X1q8STCD1PQ==
X-Received: by 2002:a1c:f401:: with SMTP id z1mr2214719wma.66.1570621235858;
 Wed, 09 Oct 2019 04:40:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n8sm2435229wma.7.2019.10.09.04.40.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 04:40:34 -0700 (PDT)
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>,
 "Tuikov, Luben" <Luben.Tuikov@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-8-alexander.deucher@amd.com>
 <a9d04519-0ec0-41f6-289f-be156caccf76@amd.com>
 <SN1PR12MB2544F1BE7D37DEC4721AF95D95950@SN1PR12MB2544.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <045b7cfd-989f-7cff-310f-92d9780e73fe@gmail.com>
Date: Wed, 9 Oct 2019 13:40:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <SN1PR12MB2544F1BE7D37DEC4721AF95D95950@SN1PR12MB2544.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Qdk8i/PWMA1GrzCqGoA0Pf7JT3j1/Cwv9WvLZnu03BM=;
 b=AZk2q4UdMQAq8YlT0TJZF68bkkpqM54wAyoGhmlZHsJ+Ng84eHVND7gjeP8YuQDx6A
 aCkMw/RwCvHX0k0gFkWUCzxrYMM3Ji6vRMTvvsP1awEbhcHsxV6RrU0Ghadeote0mwCf
 XLxHhI3TiQTNpkZCR5FpsHrT80h4JZVqDO8ck4eFwynNJK58GgYM/hzsIe3BgAC9jI4C
 UeB2UOUBGXvDsmwrJ5YEbSjb8sx7DceclaZiZgweXoSKif7rWE0MX8Hd2SiNnSviVO0t
 O/vCGk3fQ7fIQ3jOdr+NgWhq4qBfhC6cp5yf3FTYWNfceerUeULzqGcDGqmmvyvKjCkf
 hPcw==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1693187088=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1693187088==
Content-Type: multipart/alternative;
 boundary="------------4B0E7261945FCFA47FAA3ADA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4B0E7261945FCFA47FAA3ADA
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.10.19 um 13:12 schrieb Yin, Tianci (Rico):
> Here is where you definitively set "ret" so DO NOT preinitialize it to 0,
> just to avoid "pesky compiler unininitialized variable warnings"--those
> are helpful to make the code more secure: a variable should be 
> intentionally
> initialized in all paths.
>
> Rico: Still in confusion, pre-initialization can avoid "uninitialized 
> variable", why should we can't pre-initialize?

Because it avoids the uninitialized variable warning :)

See we really want the warning because it means that we have a bug in 
the code somewhere.

Regards,
Christian.

> ------------------------------------------------------------------------
> *From:* Tuikov, Luben <Luben.Tuikov@amd.com>
> *Sent:* Wednesday, October 9, 2019 11:44
> *To:* Alex Deucher <alexdeucher@gmail.com>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; Yin, Tianci 
> (Rico) <Tianci.Yin@amd.com>
> *Subject:* Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
> On 2019-10-08 3:29 p.m., Alex Deucher wrote:
> > From: "Tianci.Yin" <tianci.yin@amd.com>
> >
> > memory training using specific fixed vram segment, reserve these
> > segments before anyone may allocate it.
> >
> > Change-Id: I1436755813a565608a2857a683f535377620a637
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 96 +++++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > index 74a9bd94f10c..0819721af16e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1667,6 +1667,93 @@ static int 
> amdgpu_ttm_fw_reserve_vram_init(struct amdgpu_device *adev)
> > &adev->fw_vram_usage.va);
> >  }
> >
> > +/*
> > + * Memoy training reservation functions
> > + */
>
> Include an empty line between the two comments, just as you would
> a paragraph in written text.
>
> > +/**
> > + * amdgpu_ttm_training_reserve_vram_fini - free memory training 
> reserved vram
> > + *
> > + * @adev: amdgpu_device pointer
> > + *
> > + * free memory training reserved vram if it has been reserved.
> > + */
> > +static int amdgpu_ttm_training_reserve_vram_fini(struct 
> amdgpu_device *adev)
> > +{
> > +     int ret = 0;
> > +     struct psp_memory_training_context *ctx = 
> &adev->psp.mem_train_ctx;
> > +
> > +     ctx->init = PSP_MEM_TRAIN_NOT_SUPPORT;
> > +     if(ctx->c2p_bo) {
>
> Space after keywords, according to LKCS:
> if (...)
>
> > + amdgpu_bo_free_kernel(&ctx->c2p_bo, NULL, NULL);
> > +             ctx->c2p_bo = NULL;
> > +     }
> > +     if(ctx->p2c_bo) {
>
> Space after keywords, according to LKCS:
> if (...)
>
> > + amdgpu_bo_free_kernel(&ctx->p2c_bo, NULL, NULL);
> > +             ctx->p2c_bo = NULL;
> > +     }
> > +
> > +     return ret;
> > +}
>
> Get rid of "ret" variable altogether as it is not used in this function.
>
> > +
> > +/**
> > + * amdgpu_ttm_training_reserve_vram_init - create bo vram 
> reservation from memory training
> > + *
> > + * @adev: amdgpu_device pointer
> > + *
> > + * create bo vram reservation from memory training.
> > + */
> > +static int amdgpu_ttm_training_reserve_vram_init(struct 
> amdgpu_device *adev)
> > +{
> > +     int ret = 0;
>
> DO NOT preinitialize ret.
>
> > +     struct psp_memory_training_context *ctx = 
> &adev->psp.mem_train_ctx;
> > +
> > +     memset(ctx, 0, sizeof(*ctx));
> > +     if(!adev->fw_vram_usage.mem_train_support) {
>
> Space after keywords: "if (".
>
> > +             DRM_DEBUG("memory training does not support!\n");
> > +             return 0;
> > +     }
> > +
> > +     ctx->c2p_train_data_offset = adev->fw_vram_usage.mem_train_fb_loc;
> > +     ctx->p2c_train_data_offset = (adev->gmc.mc_vram_size - 
> GDDR6_MEM_TRAINING_OFFSET);
> > +     ctx->train_data_size = GDDR6_MEM_TRAINING_DATA_SIZE_IN_BYTES;
> > +
> > + 
> DRM_DEBUG("train_data_size:%llx,p2c_train_data_offset:%llx,c2p_train_data_offset:%llx.\n",
> > +               ctx->train_data_size,
> > +               ctx->p2c_train_data_offset,
> > +               ctx->c2p_train_data_offset);
> > +
> > +     ret = amdgpu_bo_create_kernel_at(adev,
>
> Here is where you definitively set "ret" so DO NOT preinitialize it to 0,
> just to avoid "pesky compiler unininitialized variable warnings"--those
> are helpful to make the code more secure: a variable should be 
> intentionally
> initialized in all paths.
>
> > + ctx->p2c_train_data_offset,
> > + ctx->train_data_size,
> > + AMDGPU_GEM_DOMAIN_VRAM,
> > + &ctx->p2c_bo,
> > +                                      NULL);
> > +     if(ret) {
>
> Space after keywords "if (".
>
> > +             DRM_ERROR("alloc p2c_bo failed(%d)!\n", ret);
> > +             ret = -ENOMEM;
> > +             goto err_out;
> > +     }
> > +
> > +     ret = amdgpu_bo_create_kernel_at(adev,
> > + ctx->c2p_train_data_offset,
> > + ctx->train_data_size,
> > + AMDGPU_GEM_DOMAIN_VRAM,
> > + &ctx->c2p_bo,
> > +                                      NULL);
> > +     if(ret) {
>
> Space after keywords: "if (", according to LKCS.
>
> Regards,
> Luben
>
> > +             DRM_ERROR("alloc c2p_bo failed(%d)!\n", ret);
> > +             ret = -ENOMEM;
> > +             goto err_out;
> > +     }
> > +
> > +     ctx->init = PSP_MEM_TRAIN_RESERVE_SUCCESS;
> > +     return 0;
> > +
> > +err_out:
> > +     amdgpu_ttm_training_reserve_vram_fini(adev);
> > +     return ret;
> > +}
> > +
> >  /**
> >   * amdgpu_ttm_init - Init the memory management (ttm) as well as 
> various
> >   * gtt/vram related fields.
> > @@ -1740,6 +1827,14 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
> >                return r;
> >        }
> >
> > +     /*
> > +      *The reserved vram for memory training must be pinned to the 
> specified
> > +      *place on the VRAM, so reserve it early.
> > +      */
> > +     r = amdgpu_ttm_training_reserve_vram_init(adev);
> > +     if (r)
> > +             return r;
> > +
> >        /* allocate memory as required for VGA
> >         * This is used for VGA emulation and pre-OS scanout buffers to
> >         * avoid display artifacts while transitioning between pre-OS
> > @@ -1825,6 +1920,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
> >                return;
> >
> >        amdgpu_ttm_debugfs_fini(adev);
> > +     amdgpu_ttm_training_reserve_vram_fini(adev);
> >        amdgpu_ttm_fw_reserve_vram_fini(adev);
> >        if (adev->mman.aper_base_kaddr)
> > iounmap(adev->mman.aper_base_kaddr);
> >
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------4B0E7261945FCFA47FAA3ADA
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 09.10.19 um 13:12 schrieb Yin,
      Tianci (Rico):<br>
    </div>
    <blockquote type="cite"
cite="mid:SN1PR12MB2544F1BE7D37DEC4721AF95D95950@SN1PR12MB2544.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <font size="2"><span style="font-size:11pt">Here is where you
            definitively set "ret" so DO NOT preinitialize it to 0,<br>
          </span></font></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <font size="2"><span style="font-size:11pt">just to avoid "pesky
            compiler unininitialized variable warnings"--those<br>
            are helpful to make the code more secure: a variable should
            be intentionally<br>
            initialized in all paths.</span></font></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="color: rgb(12, 100, 192);">Rico: Still in
          confusion, pre-initialization can avoid "uninitialized
          variable", why should we can't pre-initialize?
        </span><br>
      </div>
    </blockquote>
    <br>
    Because it avoids the uninitialized variable warning :)<br>
    <br>
    See we really want the warning because it means that we have a bug
    in the code somewhere.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:SN1PR12MB2544F1BE7D37DEC4721AF95D95950@SN1PR12MB2544.namprd12.prod.outlook.com">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          Tuikov, Luben <a class="moz-txt-link-rfc2396E" href="mailto:Luben.Tuikov@amd.com">&lt;Luben.Tuikov@amd.com&gt;</a><br>
          <b>Sent:</b> Wednesday, October 9, 2019 11:44<br>
          <b>To:</b> Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
          <b>Cc:</b> Deucher, Alexander
          <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Yin, Tianci (Rico)
          <a class="moz-txt-link-rfc2396E" href="mailto:Tianci.Yin@amd.com">&lt;Tianci.Yin@amd.com&gt;</a><br>
          <b>Subject:</b> Re: [PATCH 7/8] drm/amdgpu: reserve vram for
          memory training</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">On 2019-10-08 3:29 p.m., Alex Deucher
              wrote:<br>
              &gt; From: "Tianci.Yin" <a class="moz-txt-link-rfc2396E" href="mailto:tianci.yin@amd.com">&lt;tianci.yin@amd.com&gt;</a><br>
              &gt; <br>
              &gt; memory training using specific fixed vram segment,
              reserve these<br>
              &gt; segments before anyone may allocate it.<br>
              &gt; <br>
              &gt; Change-Id: I1436755813a565608a2857a683f535377620a637<br>
              &gt; Reviewed-by: Alex Deucher
              <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a><br>
              &gt; Signed-off-by: Tianci.Yin <a class="moz-txt-link-rfc2396E" href="mailto:tianci.yin@amd.com">&lt;tianci.yin@amd.com&gt;</a><br>
              &gt; ---<br>
              &gt;  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 96
              +++++++++++++++++++++++++<br>
              &gt;  1 file changed, 96 insertions(+)<br>
              &gt; <br>
              &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
              &gt; index 74a9bd94f10c..0819721af16e 100644<br>
              &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
              &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
              &gt; @@ -1667,6 +1667,93 @@ static int
              amdgpu_ttm_fw_reserve_vram_init(struct amdgpu_device
              *adev)<br>
              &gt;                                         
              &amp;adev-&gt;fw_vram_usage.va);<br>
              &gt;  }<br>
              &gt;  <br>
              &gt; +/*<br>
              &gt; + * Memoy training reservation functions<br>
              &gt; + */<br>
              <br>
              Include an empty line between the two comments, just as
              you would<br>
              a paragraph in written text.<br>
              <br>
              &gt; +/**<br>
              &gt; + * amdgpu_ttm_training_reserve_vram_fini - free
              memory training reserved vram<br>
              &gt; + *<br>
              &gt; + * @adev: amdgpu_device pointer<br>
              &gt; + *<br>
              &gt; + * free memory training reserved vram if it has been
              reserved.<br>
              &gt; + */<br>
              &gt; +static int
              amdgpu_ttm_training_reserve_vram_fini(struct amdgpu_device
              *adev)<br>
              &gt; +{<br>
              &gt; +     int ret = 0;<br>
              &gt; +     struct psp_memory_training_context *ctx =
              &amp;adev-&gt;psp.mem_train_ctx;<br>
              &gt; +<br>
              &gt; +     ctx-&gt;init = PSP_MEM_TRAIN_NOT_SUPPORT;<br>
              &gt; +     if(ctx-&gt;c2p_bo) {<br>
              <br>
              Space after keywords, according to LKCS:<br>
              if (...)<br>
              <br>
              &gt; +            
              amdgpu_bo_free_kernel(&amp;ctx-&gt;c2p_bo, NULL, NULL);<br>
              &gt; +             ctx-&gt;c2p_bo = NULL;<br>
              &gt; +     }<br>
              &gt; +     if(ctx-&gt;p2c_bo) {<br>
              <br>
              Space after keywords, according to LKCS:<br>
              if (...)<br>
              <br>
              &gt; +            
              amdgpu_bo_free_kernel(&amp;ctx-&gt;p2c_bo, NULL, NULL);<br>
              &gt; +             ctx-&gt;p2c_bo = NULL;<br>
              &gt; +     }<br>
              &gt; +<br>
              &gt; +     return ret;<br>
              &gt; +}<br>
              <br>
              Get rid of "ret" variable altogether as it is not used in
              this function.<br>
              <br>
              &gt; +<br>
              &gt; +/**<br>
              &gt; + * amdgpu_ttm_training_reserve_vram_init - create bo
              vram reservation from memory training<br>
              &gt; + *<br>
              &gt; + * @adev: amdgpu_device pointer<br>
              &gt; + *<br>
              &gt; + * create bo vram reservation from memory training.<br>
              &gt; + */<br>
              &gt; +static int
              amdgpu_ttm_training_reserve_vram_init(struct amdgpu_device
              *adev)<br>
              &gt; +{<br>
              &gt; +     int ret = 0;<br>
              <br>
              DO NOT preinitialize ret.<br>
              <br>
              &gt; +     struct psp_memory_training_context *ctx =
              &amp;adev-&gt;psp.mem_train_ctx;<br>
              &gt; +<br>
              &gt; +     memset(ctx, 0, sizeof(*ctx));<br>
              &gt; +     if(!adev-&gt;fw_vram_usage.mem_train_support) {<br>
              <br>
              Space after keywords: "if (".<br>
              <br>
              &gt; +             DRM_DEBUG("memory training does not
              support!\n");<br>
              &gt; +             return 0;<br>
              &gt; +     }<br>
              &gt; +<br>
              &gt; +     ctx-&gt;c2p_train_data_offset =
              adev-&gt;fw_vram_usage.mem_train_fb_loc;<br>
              &gt; +     ctx-&gt;p2c_train_data_offset =
              (adev-&gt;gmc.mc_vram_size - GDDR6_MEM_TRAINING_OFFSET);<br>
              &gt; +     ctx-&gt;train_data_size =
              GDDR6_MEM_TRAINING_DATA_SIZE_IN_BYTES;<br>
              &gt; +<br>
              &gt; +    
DRM_DEBUG("train_data_size:%llx,p2c_train_data_offset:%llx,c2p_train_data_offset:%llx.\n",<br>
              &gt; +               ctx-&gt;train_data_size,<br>
              &gt; +               ctx-&gt;p2c_train_data_offset,<br>
              &gt; +               ctx-&gt;c2p_train_data_offset);<br>
              &gt; +<br>
              &gt; +     ret = amdgpu_bo_create_kernel_at(adev,<br>
              <br>
              Here is where you definitively set "ret" so DO NOT
              preinitialize it to 0,<br>
              just to avoid "pesky compiler unininitialized variable
              warnings"--those<br>
              are helpful to make the code more secure: a variable
              should be intentionally<br>
              initialized in all paths.<br>
              <br>
              &gt; +                                     
              ctx-&gt;p2c_train_data_offset,<br>
              &gt; +                                     
              ctx-&gt;train_data_size,<br>
              &gt; +                                     
              AMDGPU_GEM_DOMAIN_VRAM,<br>
              &gt; +                                     
              &amp;ctx-&gt;p2c_bo,<br>
              &gt; +                                      NULL);<br>
              &gt; +     if(ret) {<br>
              <br>
              Space after keywords "if (".<br>
              <br>
              &gt; +             DRM_ERROR("alloc p2c_bo failed(%d)!\n",
              ret);<br>
              &gt; +             ret = -ENOMEM;<br>
              &gt; +             goto err_out;<br>
              &gt; +     }<br>
              &gt; +<br>
              &gt; +     ret = amdgpu_bo_create_kernel_at(adev,<br>
              &gt; +                                     
              ctx-&gt;c2p_train_data_offset,<br>
              &gt; +                                     
              ctx-&gt;train_data_size,<br>
              &gt; +                                     
              AMDGPU_GEM_DOMAIN_VRAM,<br>
              &gt; +                                     
              &amp;ctx-&gt;c2p_bo,<br>
              &gt; +                                      NULL);<br>
              &gt; +     if(ret) {<br>
              <br>
              Space after keywords: "if (", according to LKCS.<br>
              <br>
              Regards,<br>
              Luben<br>
              <br>
              &gt; +             DRM_ERROR("alloc c2p_bo failed(%d)!\n",
              ret);<br>
              &gt; +             ret = -ENOMEM;<br>
              &gt; +             goto err_out;<br>
              &gt; +     }<br>
              &gt; +<br>
              &gt; +     ctx-&gt;init = PSP_MEM_TRAIN_RESERVE_SUCCESS;<br>
              &gt; +     return 0;<br>
              &gt; +<br>
              &gt; +err_out:<br>
              &gt; +     amdgpu_ttm_training_reserve_vram_fini(adev);<br>
              &gt; +     return ret;<br>
              &gt; +}<br>
              &gt; +<br>
              &gt;  /**<br>
              &gt;   * amdgpu_ttm_init - Init the memory management
              (ttm) as well as various<br>
              &gt;   * gtt/vram related fields.<br>
              &gt; @@ -1740,6 +1827,14 @@ int amdgpu_ttm_init(struct
              amdgpu_device *adev)<br>
              &gt;                return r;<br>
              &gt;        }<br>
              &gt;  <br>
              &gt; +     /*<br>
              &gt; +      *The reserved vram for memory training must be
              pinned to the specified<br>
              &gt; +      *place on the VRAM, so reserve it early.<br>
              &gt; +      */<br>
              &gt; +     r =
              amdgpu_ttm_training_reserve_vram_init(adev);<br>
              &gt; +     if (r)<br>
              &gt; +             return r;<br>
              &gt; +<br>
              &gt;        /* allocate memory as required for VGA<br>
              &gt;         * This is used for VGA emulation and pre-OS
              scanout buffers to<br>
              &gt;         * avoid display artifacts while transitioning
              between pre-OS<br>
              &gt; @@ -1825,6 +1920,7 @@ void amdgpu_ttm_fini(struct
              amdgpu_device *adev)<br>
              &gt;                return;<br>
              &gt;  <br>
              &gt;        amdgpu_ttm_debugfs_fini(adev);<br>
              &gt; +     amdgpu_ttm_training_reserve_vram_fini(adev);<br>
              &gt;        amdgpu_ttm_fw_reserve_vram_fini(adev);<br>
              &gt;        if (adev-&gt;mman.aper_base_kaddr)<br>
              &gt;               
              iounmap(adev-&gt;mman.aper_base_kaddr);<br>
              &gt; <br>
              <br>
            </div>
          </span></font></div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4B0E7261945FCFA47FAA3ADA--

--===============1693187088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1693187088==--
