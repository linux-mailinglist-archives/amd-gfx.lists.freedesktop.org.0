Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A72141E
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 09:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048738986D;
	Fri, 17 May 2019 07:21:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5488986D
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 07:21:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j187so8639063wma.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 00:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=O3fGGL36hsGFgbxjCBH2zXTMPsDL1gynjjFmGmaajCk=;
 b=tyIBWeD0bsD6gFwKoCXClHp/tsdeysXh8roSbS2gkbJDjbHbx6jDual88VGEt45aAd
 oXKCtShrrDVeMcv654R4EJRtPpEEzhHcnN/ze/su4C5yMVVjliKJ88VAsNvPJkxgpTBE
 vxrF0yLduhSTjRVuzJ9hlcib+N7t9P979tYaXE2SURLN8Pf1VAeGPr5jdM9vpz/F2iiy
 HFi31xgXhY/nXsqA2t5wA0cns7c4cGkudGvH2BVdXTG0WQ2/y/xlmpM6/UR0zHFTGI1U
 x0hnrbdbCTLYhRd8wr+WT6Y+Racxt0+2ezk+gC5v8DI5F5k0Tgn/6MyAnbwLR657rqhK
 d0LQ==
X-Gm-Message-State: APjAAAWUq4LHegrdOCFYc/KSAmyDkcITV2KnQo9isDEs2BnGQAJutfYV
 rJeTuRSeDILFtdqFmNZzKTgEH3K2
X-Google-Smtp-Source: APXvYqw5NF/dxg73GyAmebdW3/58YpcS78E2+obT6DoYyLSebGYXpFD2jHK0ZPDV4uKQhAd0SJbBEw==
X-Received: by 2002:a1c:6206:: with SMTP id w6mr1096084wmb.56.1558077662665;
 Fri, 17 May 2019 00:21:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w13sm11098283wmk.0.2019.05.17.00.21.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 00:21:02 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSBkcm0vYW1kZ3B1OiBza2lwIGZ3IHBy?=
 =?UTF-8?Q?i_bo_alloc_for_SRIOV?=
To: "Tao, Yintian" <Yintian.Tao@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <1558007618-24482-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039EAC37D6BB17BD3582D77E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
 <f77131be-9a53-789d-0f1e-c743c80dc11a@amd.com>
 <MN2PR12MB30390AB5467D6A7080AD45C6E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0f307e3d-3f5f-3766-6db8-e51ab6c2562e@gmail.com>
Date: Fri, 17 May 2019 09:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB30390AB5467D6A7080AD45C6E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=O3fGGL36hsGFgbxjCBH2zXTMPsDL1gynjjFmGmaajCk=;
 b=fBGHtVMSguq15BzAIoQZvurmKMZsNgZsB0i1X7DVE+V0QSsNJiWw2+TAYoIglzaejU
 VkUTIorkNX8vyN20sTcj6YrxyueZyoTuo3A7laxR22egZtTd2LCNqmpc+Is4i49fC8Z3
 Dk8Qv8mirf9AnevewU+DL6NuYw0N1mhTrlPVvvQmHhyqFqHEA9D83xcmacK8YHOMJ1F0
 2EyelBug/8FtqUh+OzaBJJalVqK/QfXNU6eL3MDWWIOdRqWO1ExFI9E1doIV+C613wC3
 tSkL1neTUbLO0QEZSw9ERak4IXpt2LFwVtWKWH8F0RcnrFGo14VN3tfNT2XUKfkYmAOE
 IlXQ==
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1388032840=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1388032840==
Content-Type: multipart/alternative;
 boundary="------------963F868BC249EFA50224614C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------963F868BC249EFA50224614C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yintian,

please add this as a code comment to the patch.

Christian.

Am 17.05.19 um 09:17 schrieb Tao, Yintian:
>
> Hi  Christian
>
>
> Many thanks for your review.
>
>
> The background is that this bo is to let psp load sos and sysdrv but 
> under sriov, sos and sysdrv is loaded by VBIOS or hypervisor driver.
>
>
> The reason why not let guest driver to load it under SRIOV is that it 
> is not safe.
>
>
>
> Best Regards
>
> Yintian Tao
>
> ------------------------------------------------------------------------
> *发件人:* Koenig, Christian
> *发送时间:* 2019年5月17日 14:53:35
> *收件人:* Tao, Yintian
> *抄送:* Liu, Monk; amd-gfx@lists.freedesktop.org
> *主题:* Re: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
> Looks good to me now, but I don't know the technical background why this
> BO is not needed under SRIOV.
>
> So this patch is Acked-by: Christian König <christian.koenig@amd.com>.
>
> Regards,
> Christian.
>
> Am 17.05.19 um 04:41 schrieb Tao, Yintian:
> > Hi Christian
> >
> >
> > I have modified it according to your suggestion. Can you help review 
> this again? Thanks in advance.
> >
> >
> > Best Regards
> > Yintian Tao
> >
> > -----Original Message-----
> > From: Yintian Tao <yttao@amd.com>
> > Sent: Thursday, May 16, 2019 7:54 PM
> > To: amd-gfx@lists.freedesktop.org
> > Cc: Tao, Yintian <Yintian.Tao@amd.com>; Liu, Monk <Monk.Liu@amd.com>
> > Subject: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
> >
> > PSP fw primary buffer is not used under SRIOV.
> > Therefore, we don't need to allocate memory for it.
> >
> > v2: remove superfluous check for amdgpu_bo_free_kernel().
> >
> > Signed-off-by: Yintian Tao <yttao@amd.com>
> > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 17 ++++++++++-------
> >   1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > index c567a55..af9835c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > @@ -905,13 +905,16 @@ static int psp_load_fw(struct amdgpu_device *adev)
> >        if (!psp->cmd)
> >                return -ENOMEM;
> >
> > -     ret = amdgpu_bo_create_kernel(adev, PSP_1_MEG, PSP_1_MEG,
> > - AMDGPU_GEM_DOMAIN_GTT,
> > - &psp->fw_pri_bo,
> > - &psp->fw_pri_mc_addr,
> > - &psp->fw_pri_buf);
> > -     if (ret)
> > -             goto failed;
> > +     /* this fw pri bo is not used under SRIOV */
> > +     if (!amdgpu_sriov_vf(psp->adev)) {
> > +             ret = amdgpu_bo_create_kernel(adev, PSP_1_MEG, PSP_1_MEG,
> > + AMDGPU_GEM_DOMAIN_GTT,
> > + &psp->fw_pri_bo,
> > + &psp->fw_pri_mc_addr,
> > + &psp->fw_pri_buf);
> > +             if (ret)
> > +                     goto failed;
> > +     }
> >
> >        ret = amdgpu_bo_create_kernel(adev, PSP_FENCE_BUFFER_SIZE, 
> PAGE_SIZE,
> > AMDGPU_GEM_DOMAIN_VRAM,
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------963F868BC249EFA50224614C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hi Yintian,<br>
      <br>
      please add this as a code comment to the patch.<br>
      <br>
      Christian.<br>
      <br>
      Am 17.05.19 um 09:17 schrieb Tao, Yintian:<br>
    </div>
    <blockquote type="cite"
cite="mid:MN2PR12MB30390AB5467D6A7080AD45C6E50B0@MN2PR12MB3039.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>
      <div id="divtagdefaultwrapper"
style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;"
        dir="ltr">
        <p style="margin-top:0;margin-bottom:0">Hi  Christian</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">Many thanks for your
          review.</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">The background is that
          this bo is to let psp load sos and sysdrv but under sriov, sos
          and sysdrv is loaded by VBIOS or hypervisor driver.</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">The reason why not let
          guest driver to load it under SRIOV is that it is not safe.</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">Best Regards</p>
        <p style="margin-top:0;margin-bottom:0">Yintian Tao</p>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>发件人:</b> Koenig,
          Christian<br>
          <b>发送时间:</b> 2019年5月17日 14:53:35<br>
          <b>收件人:</b> Tao, Yintian<br>
          <b>抄送:</b> Liu, Monk; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
          <b>主题:</b> Re: [PATCH] drm/amdgpu: skip fw pri bo alloc for
          SRIOV</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">Looks good to me now, but I don't
              know the technical background why this
              <br>
              BO is not needed under SRIOV.<br>
              <br>
              So this patch is Acked-by: Christian König
              <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>.<br>
              <br>
              Regards,<br>
              Christian.<br>
              <br>
              Am 17.05.19 um 04:41 schrieb Tao, Yintian:<br>
              &gt; Hi Christian<br>
              &gt;<br>
              &gt;<br>
              &gt; I have modified it according to your suggestion. Can
              you help review this again? Thanks in advance.<br>
              &gt;<br>
              &gt;<br>
              &gt; Best Regards<br>
              &gt; Yintian Tao<br>
              &gt;<br>
              &gt; -----Original Message-----<br>
              &gt; From: Yintian Tao <a class="moz-txt-link-rfc2396E" href="mailto:yttao@amd.com">&lt;yttao@amd.com&gt;</a><br>
              &gt; Sent: Thursday, May 16, 2019 7:54 PM<br>
              &gt; To: <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
              &gt; Cc: Tao, Yintian <a class="moz-txt-link-rfc2396E" href="mailto:Yintian.Tao@amd.com">&lt;Yintian.Tao@amd.com&gt;</a>; Liu,
              Monk <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a><br>
              &gt; Subject: [PATCH] drm/amdgpu: skip fw pri bo alloc for
              SRIOV<br>
              &gt;<br>
              &gt; PSP fw primary buffer is not used under SRIOV.<br>
              &gt; Therefore, we don't need to allocate memory for it.<br>
              &gt;<br>
              &gt; v2: remove superfluous check for
              amdgpu_bo_free_kernel().<br>
              &gt;<br>
              &gt; Signed-off-by: Yintian Tao <a class="moz-txt-link-rfc2396E" href="mailto:yttao@amd.com">&lt;yttao@amd.com&gt;</a><br>
              &gt; Signed-off-by: Monk Liu <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a><br>
              &gt; ---<br>
              &gt;   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 17
              ++++++++++-------<br>
              &gt;   1 file changed, 10 insertions(+), 7 deletions(-)<br>
              &gt;<br>
              &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
              &gt; index c567a55..af9835c 100644<br>
              &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
              &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
              &gt; @@ -905,13 +905,16 @@ static int psp_load_fw(struct
              amdgpu_device *adev)<br>
              &gt;        if (!psp-&gt;cmd)<br>
              &gt;                return -ENOMEM;<br>
              &gt;   <br>
              &gt; -     ret = amdgpu_bo_create_kernel(adev, PSP_1_MEG,
              PSP_1_MEG,<br>
              &gt; -                                    
              AMDGPU_GEM_DOMAIN_GTT,<br>
              &gt; -                                    
              &amp;psp-&gt;fw_pri_bo,<br>
              &gt; -                                    
              &amp;psp-&gt;fw_pri_mc_addr,<br>
              &gt; -                                    
              &amp;psp-&gt;fw_pri_buf);<br>
              &gt; -     if (ret)<br>
              &gt; -             goto failed;<br>
              &gt; +     /* this fw pri bo is not used under SRIOV */<br>
              &gt; +     if (!amdgpu_sriov_vf(psp-&gt;adev)) {<br>
              &gt; +             ret = amdgpu_bo_create_kernel(adev,
              PSP_1_MEG, PSP_1_MEG,<br>
              &gt; +                                          
              AMDGPU_GEM_DOMAIN_GTT,<br>
              &gt; +                                          
              &amp;psp-&gt;fw_pri_bo,<br>
              &gt; +                                          
              &amp;psp-&gt;fw_pri_mc_addr,<br>
              &gt; +                                          
              &amp;psp-&gt;fw_pri_buf);<br>
              &gt; +             if (ret)<br>
              &gt; +                     goto failed;<br>
              &gt; +     }<br>
              &gt;   <br>
              &gt;        ret = amdgpu_bo_create_kernel(adev,
              PSP_FENCE_BUFFER_SIZE, PAGE_SIZE,<br>
              &gt;                                       
              AMDGPU_GEM_DOMAIN_VRAM,<br>
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

--------------963F868BC249EFA50224614C--

--===============1388032840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1388032840==--
