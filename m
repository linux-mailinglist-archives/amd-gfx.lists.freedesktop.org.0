Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90E2D709
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 09:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51B86E260;
	Wed, 29 May 2019 07:53:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BF66E260
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 07:53:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u78so871514wmu.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 00:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=XnWSQNgR8CU588rctpO76llW2L2RzFoLf/c1MYzKcm8=;
 b=mJbEue+fGE2qotVSVhcazw+mYa3+/A3ObvMOOBgowtuZ+nXALTSWK2HW5eVWs9PttQ
 SsdMLn4XeKUOLqUm6FXWQsP/yNF+V/yz7aMpdytkCh/Sdcd6+WEnXSVetrsbCP7IWCGO
 SuZ/9JFqATvUr9M37drA8iNtXgcJ1TLq3S6T8rYmt946n0amVWRxJFPGB7O6WBybd8WQ
 8b45DgpWmY5bgnsEC+IIKw98uJAJIi8BlmKeUChpLex0xqXbom32T36pT9TmGST7sqoP
 ZrIesLPK4ALuIJOycDuw6QLExtDNiXaHjYCI5fxNsKjnOlWKmCzx9S1/X4Bqzq91Kr8G
 VXiw==
X-Gm-Message-State: APjAAAXrKs5RvC0Khk8AVMro17P66615uT2pJ81nkK66eqcHGw1qSy/f
 mxi7E81yQDSlJYzIf+zlNZ28LCJL
X-Google-Smtp-Source: APXvYqzswAQ0XNbOnFWYMkfk9TgsCjeAMiLw6eicOFbCs5/R6csZ5rGjE8Y4lGotpoD9RIzWDU0iHQ==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr5653022wmh.132.1559116435539; 
 Wed, 29 May 2019 00:53:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n10sm21460044wrr.11.2019.05.29.00.53.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 00:53:54 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
To: "Deng, Emily" <Emily.Deng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>
References: <1559030775-19612-1-git-send-email-Emily.Deng@amd.com>
 <MWHPR12MB1326361E2C7ADE7523E3E7D48F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
 <MWHPR12MB1326C5856A40BB52D1BC34508F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
 <MWHPR12MB132656C894105F239387AE948F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9a23918d-e301-a102-733f-31198495edc9@gmail.com>
Date: Wed, 29 May 2019 09:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <MWHPR12MB132656C894105F239387AE948F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=XnWSQNgR8CU588rctpO76llW2L2RzFoLf/c1MYzKcm8=;
 b=fwFtAUmmI7FM3Xnke/zXGizPszqLYugD3BdHgyHBE7raZXKDHnkkFa2mSfq+YfX+e5
 3eg2YFRRMRkIFI/dq38cVggAFG3x+sZ79q2032tAmVkBhXd8dALpn6zuMoOrx4QkRxbg
 lEoujvoRQ5QKlilGtFcjQRl9SEbFWwyK10qxX5gw8ThQHVPQ/D+H+NeVmJrQ8gRqAX69
 VtKR4HD0A7oS8oLOfSpEsVkgLuXPXK6BsgtMZfWS8PJHcevXGcsaXQWH5uzcct45KXjw
 LkFR9h6QparZ6akgNRboBvEHE1K+SiF+Q5FfC1f50PM5V0OFE3Jd93bXWvKqlcLdQtf1
 lEug==
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
Content-Type: multipart/mixed; boundary="===============0356001149=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0356001149==
Content-Type: multipart/alternative;
 boundary="------------43F55E95D4AB901E9A34429D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------43F55E95D4AB901E9A34429D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for the delay, your patch simply got stuck in the daily wave of mails.

Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

Am 29.05.19 um 05:07 schrieb Deng, Emily:
> Hi Christian,
>       I have reverted the before change as your suggestion, and sent this new patch, could you help to review this?
>
> Best wishes
> Emily Deng
>
>
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Deng,
>> Emily
>> Sent: Wednesday, May 29, 2019 10:52 AM
>> To: amd-gfx@lists.freedesktop.org
>> Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
>>
>> Ping......
>>
>> Best wishes
>> Emily Deng
>>
>>
>>
>>> -----Original Message-----
>>> From: Deng, Emily <Emily.Deng@amd.com>
>>> Sent: Tuesday, May 28, 2019 6:14 PM
>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-gfx@lists.freedesktop.org
>>> Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
>>>
>>> Ping ......
>>>
>>> Best wishes
>>> Emily Deng
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>>> Emily Deng
>>>> Sent: Tuesday, May 28, 2019 4:06 PM
>>>> To: amd-gfx@lists.freedesktop.org
>>>> Cc: Deng, Emily <Emily.Deng@amd.com>
>>>> Subject: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
>>>>
>>>> As it will destroy clear_state_obj, and also will unpin it in the
>>>> gfx_v9_0_sw_fini, so don't need to call amdgpu_bo_free_kernel in
>>>> gfx_v9_0_sw_fini, or it will have unpin warning.
>>>>
>>>> Signed-off-by: Emily Deng <Emily.Deng@amd.com>
>>>> ---
>>>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 4 +---
>>>> 1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>> index c763733..cc5a382 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>> @@ -1794,9 +1794,7 @@ static int gfx_v9_0_sw_fini(void *handle)
>>>>
>>>> 	gfx_v9_0_mec_fini(adev);
>>>> 	gfx_v9_0_ngg_fini(adev);
>>>> -	amdgpu_bo_free_kernel(&adev->gfx.rlc.clear_state_obj,
>>>> -				&adev->gfx.rlc.clear_state_gpu_addr,
>>>> -				(void **)&adev->gfx.rlc.cs_ptr);
>>>> +	amdgpu_bo_unref(&adev->gfx.rlc.clear_state_obj);
>>>> 	if (adev->asic_type == CHIP_RAVEN) {
>>>> 		amdgpu_bo_free_kernel(&adev->gfx.rlc.cp_table_obj,
>>>> 				&adev->gfx.rlc.cp_table_gpu_addr,
>>>> --
>>>> 2.7.4
>>>>
>>>> _______________________________________________
>>>> amd-gfx mailing list
>>>> amd-gfx@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------43F55E95D4AB901E9A34429D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Sorry for the delay, your patch simply
      got stuck in the daily wave of mails.<br>
      <br>
      Reviewed-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 29.05.19 um 05:07 schrieb Deng, Emily:<br>
    </div>
    <blockquote type="cite"
cite="mid:MWHPR12MB132656C894105F239387AE948F1F0@MWHPR12MB1326.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">Hi Christian,
     I have reverted the before change as your suggestion, and sent this new patch, could you help to review this?

Best wishes
Emily Deng



</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> On Behalf Of Deng,
Emily
Sent: Wednesday, May 29, 2019 10:52 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer

Ping......

Best wishes
Emily Deng



</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>
Sent: Tuesday, May 28, 2019 6:14 PM
To: Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer

Ping ......

Best wishes
Emily Deng



</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> On Behalf Of
Emily Deng
Sent: Tuesday, May 28, 2019 4:06 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
Cc: Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>
Subject: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer

As it will destroy clear_state_obj, and also will unpin it in the
gfx_v9_0_sw_fini, so don't need to call amdgpu_bo_free_kernel in
gfx_v9_0_sw_fini, or it will have unpin warning.

Signed-off-by: Emily Deng <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>
---
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 4 +---
1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index c763733..cc5a382 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1794,9 +1794,7 @@ static int gfx_v9_0_sw_fini(void *handle)

	gfx_v9_0_mec_fini(adev);
	gfx_v9_0_ngg_fini(adev);
-	amdgpu_bo_free_kernel(&amp;adev-&gt;gfx.rlc.clear_state_obj,
-				&amp;adev-&gt;gfx.rlc.clear_state_gpu_addr,
-				(void **)&amp;adev-&gt;gfx.rlc.cs_ptr);
+	amdgpu_bo_unref(&amp;adev-&gt;gfx.rlc.clear_state_obj);
	if (adev-&gt;asic_type == CHIP_RAVEN) {
		amdgpu_bo_free_kernel(&amp;adev-&gt;gfx.rlc.cp_table_obj,
				&amp;adev-&gt;gfx.rlc.cp_table_gpu_addr,
--
2.7.4

_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------43F55E95D4AB901E9A34429D--

--===============0356001149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0356001149==--
