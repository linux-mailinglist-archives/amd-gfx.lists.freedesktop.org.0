Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABa5JiJmsWnsugIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2026 13:54:58 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34683263E7F
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2026 13:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC01A10E1C8;
	Wed, 11 Mar 2026 12:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bvOF6uN4";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74EA10E8B7
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 11:52:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4853f2826f7so31019325e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773229924; x=1773834724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V6HzbTr74KcfnoTLlMcxfPo8bn4yDRViVRsJ4L7TL1o=;
 b=bvOF6uN4rxgQxGIJPXRvC4+Uf7XEqw7pgmTywZWnWxnXCQ0kmH9D2FWhjVbwRBGV6E
 u85gBw8hMIN70VAJhEwwwlWNqVhhzEQs1lpX+WiMDZbO9eGEHzkkYQb08WQYcpZtiR1O
 c3Y1YQiTfFtLvIAwKyWeBBlfdKVC0dpwLYcsLM7K2nySppcHwlocXVdmsOlRk54Ix6m0
 I+C71JBHp2NSL7aT1UskeKX6Aqc0eKU47gLq+Cl2jSG4hs51x+9kQ94ApQ9ir2gTgoYz
 fVkVS9YH1dwWxEK/H8KOZoclvsoSEKeLdbtHCIESMUT5E8qmXgVXb8AVJFuNTHHuGlC9
 m5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773229924; x=1773834724;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V6HzbTr74KcfnoTLlMcxfPo8bn4yDRViVRsJ4L7TL1o=;
 b=w99FK/BRgg9g6QEeWZQYDSPyis0rw5o6g/a8SZigy8OnQrayRex4N7LT5nosrfyqY5
 QUaR7wDIfcF17EHvta+rwwwVWDbIvbJARmLD4P4lreSY33mp9UnigiICJ4lKhr2/861m
 jQgs3SBVuV8bTOHhIZxezKGXFp9iSknUN9MJzlEStuKB1c4K2t/vtog9eCXVy+XODAe7
 9Gp/0xUSkbhX9wfjKCBBxAKfRYHk8P1LoxYsbK1qrMHPvY/8p8vLwqzAB29wcjeofO8l
 zU2+teNPeHKdGZpm+ea4HXHWYdg+84cwiB9Bv89IQv+0mR1NDQWvesbzZPhRqacJqbZR
 Bb2A==
X-Gm-Message-State: AOJu0YyRdSGjqPnFS668OMNYy0/GyIeffFzKqMeRmnyoVHupx/3AoJbs
 9HjRbjpdGm697StCwYnFVRfCquKkp/JO6Thxr8Y/Q686V7jQ6wVVjB/x
X-Gm-Gg: ATEYQzxaikpyz641nG7VVws5IAZSKanHQtJMretmOuS1tfHYu9J9PBwfctRY2lIdmfG
 RCu9CNK2KhhQ6pOzKRlUPODWYzHzL04SiLW2Sg9YVt09OGMSQpr7yNuMYz/fPcNeOobrbDdPjhX
 +zopZv/oeGd9vaxpFvZGgTnE0huCyrER3FR5GTDIU9+8d57QVmKbtBW4meTFc6Jxejj7vhPnBU4
 VD5NZYmRm5aKygy59idJwm7ZmXQY2MWVREK7AENihP8f/4JVkgOQvTYcjYr6wR1pUCa3A4KC0iX
 LLbzQJObimjDBl3Sgh8NggBwOQOeQbcNp3GUSW+3G4qa6TU8ee8jqORJJvDKM4R0Dlc207lXMjz
 KnmOy/7fWAa/G5BM0IFTs7BinSCV/Uv27ui4go/8oF6xrx814U7d1qwv3LnbjUaTMpyXz4pBDko
 csFojMfmNqAChDax9B9Z2BRX754P9E5s3pCq1UQMSIMDa9IcuuyqrmNbbx9+4=
X-Received: by 2002:a05:600c:4f89:b0:485:2fd9:3d4a with SMTP id
 5b1f17b1804b1-4854b102656mr37907285e9.22.1773229921984; 
 Wed, 11 Mar 2026 04:52:01 -0700 (PDT)
Received: from [10.247.12.125] ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5e912fsm123205825e9.2.2026.03.11.04.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 04:52:01 -0700 (PDT)
Message-ID: <be86c64d-db3f-447b-92e8-085333c28d11@gmail.com>
Date: Wed, 11 Mar 2026 11:52:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Replace deprecated strcpy() in
 amdgpu_virt_write_vf2pf_data
To: Kees Cook <kees@kernel.org>, airlied@gmail.com, christian.koenig@amd.com, 
 alexander.deucher@amd.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-hardening@vger.kernel.org
References: <20260109162514.308143-1-yiconghui@gmail.com>
 <202601091117.122A9268@keescook>
From: Yicong Hui <yiconghui@gmail.com>
Content-Language: en-US
In-Reply-To: <202601091117.122A9268@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 Mar 2026 12:54:53 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 34683263E7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:airlied@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:linux-hardening@vger.kernel.org,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,amd.com,ffwll.ch];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linuxfoundation.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On 1/9/26 7:18 PM, Kees Cook wrote:
> On Fri, Jan 09, 2026 at 04:25:14PM +0000, Yicong Hui wrote:
>> strcpy() is deprecated as it does not do any bounds checking (as
>> specified in Documentation/process/deprecated.rst).
>>
>> There is a risk of buffer overflow in the case that the value for
>> THIS_MODULE->version exceeds the 64 characters. This is unlikely, but
>> replacing the deprecated function will pre-emptively remove this risk
>> entirely.
>>
>> Replace both instances of strcpy() with the safer strscpy() function.
> 
> This looks correct to me -- dest and src are both fixed-size, so strscpy
> happily checks everything at compile time. :)
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> 
> -Kees
> 

Hello!

Is there any further feedback or progress on this patch?

Thank you!
Yicong
