Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AAE229
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 14:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076D892CD;
	Mon, 29 Apr 2019 12:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10D892CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 12:22:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y5so14521141wma.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 05:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=cOsXRmmQgdJeHZxXAM7gv9i/Mji4Uq5I7/BhZiGunTQ=;
 b=pTyruQ/StCZEaj9uyaeOmyNsmsXsSRhpf97a4qRSkAlMO8QgflHA1S9Vus7wZAr0qK
 LeXahYaDEIAmPFSY3yBT5DpWTTNHgY8P2z3RNRbPHQ1orpzue9kSivVyHAK9B9IDv55X
 l1UXaDKofP8bep/PIw4M6EZHbGVzbz6yqRTu0Mc76182BUJlzUUL4apVS8jBuX+KDJgc
 HMvnUOit9p/3iPxWS6Qqox4LfmHxBVMA2HkIvDZU50l0KdhaHUaeH/2nf7yspy7KGeXT
 KxsAhjpgkm8rTrsNoAZnSFdLkT7P89SZyrRUeU2hd+2yf7fhrSaQiIPRU2es13ETsXnY
 4Oiw==
X-Gm-Message-State: APjAAAW2Jn7eMcRRioBM2L9rGwZg3HIbdRvXdbJfljWpqpYUelh03A18
 U1VbVB22gPcY58rJ6gnFi2uI4U0G
X-Google-Smtp-Source: APXvYqxojuz3mJ68+jF04OSVOVD/gXistgYWcSgEWv7VeOBOhLS2MCcboDyo0iwQRU4bwYw1T+U9cw==
X-Received: by 2002:a1c:9c97:: with SMTP id
 f145mr17798786wme.139.1556540525647; 
 Mon, 29 Apr 2019 05:22:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s16sm5188861wrg.71.2019.04.29.05.22.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 05:22:04 -0700 (PDT)
Subject: Re: print firmware versions on amdgpu sysfs
To: "Russell, Kent" <Kent.Russell@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Lin, Amber" <Amber.Lin@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <355c6cb6-ccf7-ef6f-4f34-0e978b9effe2@amd.com>
 <CY4PR12MB18136C9A3F7719CFD0C50D60F73E0@CY4PR12MB1813.namprd12.prod.outlook.com>
 <BN6PR12MB1618CE8C21ED572094D9BB10853E0@BN6PR12MB1618.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d6c60e91-4311-069b-0612-03337830481d@gmail.com>
Date: Mon, 29 Apr 2019 14:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BN6PR12MB1618CE8C21ED572094D9BB10853E0@BN6PR12MB1618.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=cOsXRmmQgdJeHZxXAM7gv9i/Mji4Uq5I7/BhZiGunTQ=;
 b=k7nRlAXY2WClrEwwCmgGPcANYSwQTrWnpK732Si2aGFhPY8oMlTBOH2+2OP4DlFv1X
 HuIjPE4Hf3cS+CNFnP+QA7epI+4dTSkRP3bhQTLUVFzHeGSKDWXnuDeidhQuKYKn0zCA
 dSImf+VQYK20QXJPEL0G46A8kB030akNPB/sIZ540SSxtsmaDe5l3hqpMbggJ/k5tuxD
 7Kp7pkh3AWP9aBEK7OtMfMT5rVhw2hjCoNUU6TYv7rj39PwfLtAlxOl1Z8Eu5ljPyAmA
 a+aFBtrUACXpX/gH8y95TKHHtQXvSV6vD3199htnFUxqaxdnPQEIzJYLK19xir9BMr+f
 S3DA==
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
Cc: "Freehill, Chris" <Chris.Freehill@amd.com>
Content-Type: multipart/mixed; boundary="===============0456384584=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0456384584==
Content-Type: multipart/alternative;
 boundary="------------56D911CAFF7E38DEC613DAD3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------56D911CAFF7E38DEC613DAD3
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

We just need to keep in mind that sysfs has more restrictions than debugfs.

E.g. one value per file, backward compatibility etc...

Apart from that I don't see any reason to not do it in sysfs.

Christian.

Am 26.04.19 um 20:35 schrieb Russell, Kent:
> The main reasoning and use case for sysfs would be the SMI CLI, since 
> unfortunately there is no ioctl support in there.
>
> Kent
>
> KENT RUSSELL
> Sr. Software Engineer | Linux Compute Kernel
> 1 Commerce Valley Drive East
> Markham, ON L3T 7X6
> O +(1) 289-695-2122 | Ext 72122
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Deucher, Alexander <Alexander.Deucher@amd.com>
> *Sent:* Friday, April 26, 2019 12:18:22 PM
> *To:* Lin, Amber; amd-gfx@lists.freedesktop.org
> *Cc:* Freehill, Chris
> *Subject:* Re: print firmware versions on amdgpu sysfs
> We also expose the firmware versions via ioctl which is what the UMDs 
> uses.  If you'd prefer it in sysfs, we could do that too.
>
> Alex
>
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Lin, Amber <Amber.Lin@amd.com>
> *Sent:* Friday, April 26, 2019 10:14 AM
> *To:* amd-gfx@lists.freedesktop.org
> *Cc:* Freehill, Chris
> *Subject:* print firmware versions on amdgpu sysfs
> Hi Alex,
>
> Currently we retrieve firmware versions from /sys/kernel/debug but this
> requires debugfs being enabled and superuser privilege. Do you see a
> concern we add firmware versions to amdgpu sysfs at
> /sys/class/drm/cardX/device like vbios_version?
>
> Regards,
> Amber
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------56D911CAFF7E38DEC613DAD3
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">We just need to keep in mind that sysfs
      has more restrictions than debugfs.<br>
      <br>
      E.g. one value per file, backward compatibility etc...<br>
      <br>
      Apart from that I don't see any reason to not do it in sysfs.<br>
      <br>
      Christian. <br>
      <br>
      Am 26.04.19 um 20:35 schrieb Russell, Kent:<br>
    </div>
    <blockquote type="cite"
cite="mid:BN6PR12MB1618CE8C21ED572094D9BB10853E0@BN6PR12MB1618.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      The main reasoning and use case for sysfs would be the SMI CLI,
      since unfortunately there is no ioctl support in there.
      <br>
      <br>
      Kent<br>
      <br>
      KENT RUSSELL<br>
      Sr. Software Engineer | Linux Compute Kernel<br>
      1 Commerce Valley Drive East<br>
      Markham, ON L3T 7X6<br>
      O +(1) 289-695-2122 | Ext 72122<br>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
          behalf of Deucher, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a><br>
          <b>Sent:</b> Friday, April 26, 2019 12:18:22 PM<br>
          <b>To:</b> Lin, Amber; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
          <b>Cc:</b> Freehill, Chris<br>
          <b>Subject:</b> Re: print firmware versions on amdgpu sysfs</font>
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
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          We also expose the firmware versions via ioctl which is what
          the UMDs uses.  If you'd prefer it in sysfs, we could do that
          too.<br>
        </div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          <br>
        </div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          Alex</div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          <br>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
            behalf of Lin, Amber <a class="moz-txt-link-rfc2396E" href="mailto:Amber.Lin@amd.com">&lt;Amber.Lin@amd.com&gt;</a><br>
            <b>Sent:</b> Friday, April 26, 2019 10:14 AM<br>
            <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
            <b>Cc:</b> Freehill, Chris<br>
            <b>Subject:</b> print firmware versions on amdgpu sysfs</font>
          <div> </div>
        </div>
        <div class="x_BodyFragment"><font size="2"><span
              style="font-size:11pt">
              <div class="x_PlainText">Hi Alex,<br>
                <br>
                Currently we retrieve firmware versions from
                /sys/kernel/debug but this <br>
                requires debugfs being enabled and superuser privilege.
                Do you see a <br>
                concern we add firmware versions to amdgpu sysfs at <br>
                /sys/class/drm/cardX/device like vbios_version?<br>
                <br>
                Regards,<br>
                Amber<br>
                _______________________________________________<br>
                amd-gfx mailing list<br>
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
                <a
                  href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                  moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
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

--------------56D911CAFF7E38DEC613DAD3--

--===============0456384584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0456384584==--
