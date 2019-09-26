Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C28BF2FE
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 14:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CBA6ED03;
	Thu, 26 Sep 2019 12:29:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECC6ED03
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 12:29:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r5so2226604wrm.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 05:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=9HFZeMQ0ndKlutPjxP2Qoukew+Y4UsrZqi51PeixGBc=;
 b=ZwQW0YvVESIH8mkwmu0ZPkTtOoGRmupMSWv+sdXndeRbjcQE0s14VGzUfOijhs8tdw
 EPlwlBOuqNMAZXhhd1nZlE6jiAxGtjRdh1j3jt9N51G3wbBtAAxMqw2lPcFX5SZcWe9b
 Q+9pNnXOng06jpt9B2cPVJYGxKVY3lYVm8cIYixhJodDm20sGUu0SjYoK7pJ98EricIW
 ZUrwBZDOt9zyIclCkNezs5AxvaqCFrO7CEHBkReQwU31t6EsOKEz8z1OcxdeKHsJ3kgP
 BU2l0TM6xJVcWzBdQ1cb+Uh0u/ghvRmUg1q7RfPehB21b8olg0aRlDQsvp52nbUX31kh
 d6Bw==
X-Gm-Message-State: APjAAAXunu508ZsaiYd5ZNMPosys1NEIUcTKZNIStcM0Qb8pe1SwbY0i
 sl4WUAaa+xBJj9V5FWNwP5g=
X-Google-Smtp-Source: APXvYqx4O5joSDSNrKvBVYUrB82ZMUi3wy1mUdr4nswuPKS8D7I4mK4UQfHnvxaOCmktxFtPW1qE3A==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr2728125wrr.159.1569500968332; 
 Thu, 26 Sep 2019 05:29:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d9sm3978552wrc.44.2019.09.26.05.29.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 05:29:27 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190926080746.20765-1-xiaojie.yuan@amd.com>
 <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
 <BN6PR12MB1809591CB4102B70BEC82E93F7860@BN6PR12MB1809.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <608f4e8a-ef35-6fbc-cda6-51c3803af014@gmail.com>
Date: Thu, 26 Sep 2019 14:29:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR12MB1809591CB4102B70BEC82E93F7860@BN6PR12MB1809.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=9HFZeMQ0ndKlutPjxP2Qoukew+Y4UsrZqi51PeixGBc=;
 b=MLCWpPiUAYWIHbykJgmcKWRaFBcqvUDGspuLzHfShcqk8uki6DTXJ+n/IdDfCnmach
 3GYrb0zhVXy0myIdNp4+X/2CffxraiV9sIuYbQa2i9zvbBzcN6dNfAT4YhnX9+VqAKB+
 1juoKYmNJV/UgZ7HE/5ST93qROCRFxSVtsp0HIwIw8jF3L6dXdW4EqmAjhoe1UBkw/iV
 MqTHUyzc+MlQjH6ootpe7s8vISJ5MOLwJBFffYSbIA58jlE0rULeHNgWzFtqknkCbndo
 U0vEgw0o5FbYwvB4hlWode7gWdfp2ExJCDJZiqAXrcikwvIqI8oqKmKASuL0Tcw/vLet
 BMRg==
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="===============1169247151=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1169247151==
Content-Type: multipart/alternative;
 boundary="------------F7EF14EA4E76D9D44665EAA8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F7EF14EA4E76D9D44665EAA8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Stop, wait a second guys!

This will disable the workaround for Navi10 and that is certainly not 
correct:
> !(adev->asic_type >= CHIP_NAVI10 && adev->asic_type <= CHIP_NAVI12)

Christian.


Am 26.09.19 um 14:26 schrieb Deucher, Alexander:
> Please add a patch description.  With that fixed:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
> *Sent:* Thursday, September 26, 2019 4:09 AM
> *To:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Cc:* alexdeucher@gmail.com <alexdeucher@gmail.com>
> *Subject:* Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from 
> sdma' workaround for navi
> Hi Alex,
>
> This patch is to add the asic_type check which is missing after 
> drm-next branch rebase.
>
> BR,
> Xiaojie
> ------------------------------------------------------------------------
> *From:* Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
> *Sent:* Thursday, September 26, 2019 4:08 PM
> *To:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Cc:* alexdeucher@gmail.com <alexdeucher@gmail.com>; Yuan, Xiaojie 
> <Xiaojie.Yuan@amd.com>
> *Subject:* [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from 
> sdma' workaround for navi
> Fixes: 767acabdac81 ("drm/amd/powerplay: add baco smu reset function 
> for smu11")
> Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c 
> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index cb3f61873baa..dc2e68e019eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -292,6 +292,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct 
> amdgpu_device *adev, uint32_t vmid,
>
>          if (!adev->mman.buffer_funcs_enabled ||
>              !adev->ib_pool_ready ||
> +           !(adev->asic_type >= CHIP_NAVI10 && adev->asic_type <= 
> CHIP_NAVI12) ||
>              adev->in_gpu_reset) {
>                  gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0);
> mutex_unlock(&adev->mman.gtt_window_lock);
> -- 
> 2.20.1
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------F7EF14EA4E76D9D44665EAA8
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Stop, wait a second guys!<br>
      <br>
      This will disable the workaround for Navi10 and that is certainly
      not correct:<br>
      <blockquote type="cite"><font size="2"><span
            style="font-size:11pt">
            !(adev-&gt;asic_type &gt;= CHIP_NAVI10 &amp;&amp;
            adev-&gt;asic_type &lt;= CHIP_NAVI12)</span></font></blockquote>
      <br>
      Christian.<br>
      <br>
      <br>
      Am 26.09.19 um 14:26 schrieb Deucher, Alexander:<br>
    </div>
    <blockquote type="cite"
cite="mid:BN6PR12MB1809591CB4102B70BEC82E93F7860@BN6PR12MB1809.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Please add a patch description.  With that fixed:<br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Reviewed-by: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a><br>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
          behalf of Yuan, Xiaojie <a class="moz-txt-link-rfc2396E" href="mailto:Xiaojie.Yuan@amd.com">&lt;Xiaojie.Yuan@amd.com&gt;</a><br>
          <b>Sent:</b> Thursday, September 26, 2019 4:09 AM<br>
          <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
          <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a> <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a><br>
          <b>Subject:</b> Re: [PATCH] drm/amdgpu/gmc10: apply the
          'invalidation from sdma' workaround for navi</font>
        <div> </div>
      </div>
      <style type="text/css" style="display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
      <div dir="ltr">
        <div style="font-family:Calibri,Helvetica,sans-serif;
          font-size:11pt; color:rgb(0,0,0)">
          Hi Alex,</div>
        <div style="font-family:Calibri,Helvetica,sans-serif;
          font-size:11pt; color:rgb(0,0,0)">
          <br>
        </div>
        <div style="font-family:Calibri,Helvetica,sans-serif;
          font-size:11pt; color:rgb(0,0,0)">
          This patch is to add the asic_type check which is missing
          after drm-next branch rebase.</div>
        <div style="font-family:Calibri,Helvetica,sans-serif;
          font-size:11pt; color:rgb(0,0,0)">
          <br>
        </div>
        <div style="font-family:Calibri,Helvetica,sans-serif;
          font-size:11pt; color:rgb(0,0,0)">
          BR,</div>
        <div style="font-family:Calibri,Helvetica,sans-serif;
          font-size:11pt; color:rgb(0,0,0)">
          Xiaojie<br>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Yuan, Xiaojie <a class="moz-txt-link-rfc2396E" href="mailto:Xiaojie.Yuan@amd.com">&lt;Xiaojie.Yuan@amd.com&gt;</a><br>
            <b>Sent:</b> Thursday, September 26, 2019 4:08 PM<br>
            <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a>; Yuan, Xiaojie
            <a class="moz-txt-link-rfc2396E" href="mailto:Xiaojie.Yuan@amd.com">&lt;Xiaojie.Yuan@amd.com&gt;</a><br>
            <b>Subject:</b> [PATCH] drm/amdgpu/gmc10: apply the
            'invalidation from sdma' workaround for navi</font>
          <div> </div>
        </div>
        <div class="x_BodyFragment"><font size="2"><span
              style="font-size:11pt">
              <div class="x_PlainText">Fixes: 767acabdac81
                ("drm/amd/powerplay: add baco smu reset function for
                smu11")<br>
                Signed-off-by: Xiaojie Yuan <a class="moz-txt-link-rfc2396E" href="mailto:xiaojie.yuan@amd.com">&lt;xiaojie.yuan@amd.com&gt;</a><br>
                ---<br>
                 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 +<br>
                 1 file changed, 1 insertion(+)<br>
                <br>
                diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
                b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                index cb3f61873baa..dc2e68e019eb 100644<br>
                --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
                @@ -292,6 +292,7 @@ static void
                gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev,
                uint32_t vmid,<br>
                 <br>
                         if (!adev-&gt;mman.buffer_funcs_enabled ||<br>
                             !adev-&gt;ib_pool_ready ||<br>
                +           !(adev-&gt;asic_type &gt;= CHIP_NAVI10
                &amp;&amp; adev-&gt;asic_type &lt;= CHIP_NAVI12) ||<br>
                             adev-&gt;in_gpu_reset) {<br>
                                 gmc_v10_0_flush_vm_hub(adev, vmid,
                AMDGPU_GFXHUB_0, 0);<br>
                                
                mutex_unlock(&amp;adev-&gt;mman.gtt_window_lock);<br>
                -- <br>
                2.20.1<br>
                <br>
              </div>
            </span></font></div>
      </div>
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

--------------F7EF14EA4E76D9D44665EAA8--

--===============1169247151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1169247151==--
