Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B5D3BAB
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 10:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B5B6EBE9;
	Fri, 11 Oct 2019 08:53:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508F86EBE5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 08:53:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a6so9540431wma.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=PJZTuQFiE9xpWrX6PrTxJxbTeu8QFJSTdoUdr2Navsw=;
 b=rKBuDPLhYhLt++fL3HJBeZDNk/5AQT7hMropccbs03Khf0dcBsqAAdcbMJpDUvikgb
 x1uJn41Rs8LuK5Pw4W2+Hm5NzTZ7EjUuEy09X8cmHp9KwEXiad/YMwr/xVdFbeJvLdg7
 aAcXHaAao4cZeb8TUa+M1YaXKBwvI0jVE2fFkXk5Ee1+XUX/oOa6F9vY3l4ClC8C1cVL
 RkbN+p/wx/4z0hk0oTll2/gACcgtD+QeseEBMJs0ON9FgRIDNKLIczOh+SHYPc5RWKnv
 PmDA5PIM2C/+EtwNw+grFWKLUXGLpoms2s7DSrU/zsevBwQy++hmV80w0+SYk1PUF5k5
 xT3A==
X-Gm-Message-State: APjAAAVe0ERtskjdIuPDpyl5LNeHCEZqcjSylYHfH1zcG0b7albcDXtK
 Z3JnLIyl87/Iekw+AoeSsfc=
X-Google-Smtp-Source: APXvYqxk7e3SRnv2ILXu0oLpZt8KIPi+vd99aehVWqoeHEIoyE5sCqXazpVFwLTg1JY9K91yPQ+nQw==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr2291453wmj.102.1570784030894; 
 Fri, 11 Oct 2019 01:53:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z125sm10174469wme.37.2019.10.11.01.53.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Oct 2019 01:53:50 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet
 for pipe sync
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191009170923.15479-1-xiaojie.yuan@amd.com>
 <DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950@DM5PR12MB1820.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03836bb7-cfdd-b966-d46a-c09dd5eefe9e@gmail.com>
Date: Fri, 11 Oct 2019 10:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950@DM5PR12MB1820.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=PJZTuQFiE9xpWrX6PrTxJxbTeu8QFJSTdoUdr2Navsw=;
 b=jCMhhKYl1gGpbOQ7AITttcviNf3nA2aYddqhG1CumSF7z7e8MDxt4rTXaxWPxdsoEX
 zmWgvFENG0QPBcM7cPMroZSSZOUEY+sDZ9fdr/vEU4xzfd4KySvw5DEJnOFnYPfnZlAh
 F02fHySeJjRlKIocTNyDY0ntpaCRbh54Ay3ITRTeUHXnV+r3YrJ6vrg47YJAvpZmIGTN
 RIuYFOvB8LNrCwMMmwUSDT0qNRnSCMwt167mmG9aMiPWzIrQvdYYQuJr8ONd3ltS5KwA
 0VyngmmZhjSEliIsJ5hC8YxSh4HddiaEygUCmIn9+KYFysdKdbzgLXkmSDFHt5HItbMx
 tlJA==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1805723932=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1805723932==
Content-Type: multipart/alternative;
 boundary="------------41AA3C65EED4B43414EEF479"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------41AA3C65EED4B43414EEF479
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Good catch! Reviewed-by: Christian König <christian.koenig@amd.com>

Am 09.10.19 um 19:11 schrieb Deucher, Alexander:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
> *Sent:* Wednesday, October 9, 2019 1:09 PM
> *To:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Cc:* Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie 
> <Xiaojie.Yuan@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
> *Subject:* [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM 
> packet for pipe sync
> sdma will hang once sequence number to be polled reaches 0x1000_0000
>
> Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c 
> b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index ad5c3566337c..3460c00f3eaa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -1126,7 +1126,7 @@ static void 
> sdma_v5_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
>          amdgpu_ring_write(ring, addr & 0xfffffffc);
>          amdgpu_ring_write(ring, upper_32_bits(addr) & 0xffffffff);
>          amdgpu_ring_write(ring, seq); /* reference */
> -       amdgpu_ring_write(ring, 0xfffffff); /* mask */
> +       amdgpu_ring_write(ring, 0xffffffff); /* mask */
>          amdgpu_ring_write(ring, 
> SDMA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff) |
> SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(4)); /* retry count, poll interval */
>  }
> -- 
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------41AA3C65EED4B43414EEF479
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Good catch! Reviewed-by: Christian
      König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
      <br>
      Am 09.10.19 um 19:11 schrieb Deucher, Alexander:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950@DM5PR12MB1820.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Reviewed-by: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a><br>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
          behalf of Yuan, Xiaojie <a class="moz-txt-link-rfc2396E" href="mailto:Xiaojie.Yuan@amd.com">&lt;Xiaojie.Yuan@amd.com&gt;</a><br>
          <b>Sent:</b> Wednesday, October 9, 2019 1:09 PM<br>
          <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
          <b>Cc:</b> Xiao, Jack <a class="moz-txt-link-rfc2396E" href="mailto:Jack.Xiao@amd.com">&lt;Jack.Xiao@amd.com&gt;</a>; Yuan, Xiaojie
          <a class="moz-txt-link-rfc2396E" href="mailto:Xiaojie.Yuan@amd.com">&lt;Xiaojie.Yuan@amd.com&gt;</a>; Zhang, Hawking
          <a class="moz-txt-link-rfc2396E" href="mailto:Hawking.Zhang@amd.com">&lt;Hawking.Zhang@amd.com&gt;</a><br>
          <b>Subject:</b> [PATCH] drm/amdgpu/sdma5: fix mask value of
          POLL_REGMEM packet for pipe sync</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">sdma will hang once sequence number
              to be polled reaches 0x1000_0000<br>
              <br>
              Signed-off-by: Xiaojie Yuan <a class="moz-txt-link-rfc2396E" href="mailto:xiaojie.yuan@amd.com">&lt;xiaojie.yuan@amd.com&gt;</a><br>
              ---<br>
               drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-<br>
               1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
              b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
              index ad5c3566337c..3460c00f3eaa 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
              @@ -1126,7 +1126,7 @@ static void
              sdma_v5_0_ring_emit_pipeline_sync(struct amdgpu_ring
              *ring)<br>
                       amdgpu_ring_write(ring, addr &amp; 0xfffffffc);<br>
                       amdgpu_ring_write(ring, upper_32_bits(addr) &amp;
              0xffffffff);<br>
                       amdgpu_ring_write(ring, seq); /* reference */<br>
              -       amdgpu_ring_write(ring, 0xfffffff); /* mask */<br>
              +       amdgpu_ring_write(ring, 0xffffffff); /* mask */<br>
                       amdgpu_ring_write(ring,
              SDMA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff) |<br>
                                        
              SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(4)); /* retry count,
              poll interval */<br>
               }<br>
              -- <br>
              2.20.1<br>
              <br>
              _______________________________________________<br>
              amd-gfx mailing list<br>
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
              <a
                href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
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

--------------41AA3C65EED4B43414EEF479--

--===============1805723932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1805723932==--
