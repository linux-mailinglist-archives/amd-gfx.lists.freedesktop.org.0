Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OtH7J2m2L2r3EwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 10:23:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C068480C
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 10:23:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=infradead.org header.s=bombadil.20210309 header.b=N5a7M3j7;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B619910E2A6;
	Mon, 15 Jun 2026 08:23:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813EF10E67B
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 23:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=jPer+Mbx310H041oVdkkI+/IqWEc6K36RNwWTPh0eNE=; b=N5a7M3j7Qnz0vF1abXjW5jC4En
 C4gpzfETavd1hGDl8ryh/o5os0AcNFpxnTGN1jL0ztHsExwSL2fmnZKkzjLkzirC859mvE4kX4wQP
 mqWF7eWMSIJi9C62HgFiUH+xlFiehF0ZrjIVvG/3A72uC+e44Fie7kzB1doeTg+WoCnFguT+SnO99
 DkyJoh6H5SV0fX8e6qabHnuOOZMFR1rOplEuZStVWCX1tzWLaKWcmBAbfG9/IYl9EH8ZhR/pAa/TY
 OZ4/CId/Rz8jtN5CDLYdt2/mNnKE6b7X1qBv8UQ9TqX0cGJR4gHxNIQvAHW6VFX0lwmj/nB2cXbyI
 pDf40sUw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wYBOO-0000000Ble6-3GEh; Fri, 12 Jun 2026 23:34:28 +0000
Message-ID: <d6d0b833-cfef-4d82-9da6-e2c128b9f9c1@infradead.org>
Date: Fri, 12 Jun 2026 16:34:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kdoc: xforms: ignore special static/inline macros
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20260602031214.2817411-1-rdunlap@infradead.org>
 <87ldcj5z9i.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ldcj5z9i.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Jun 2026 08:22:58 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	DATE_IN_PAST(1.00)[56];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,m:harry.wentland@amd.com,m:alex.hung@amd.com,m:ivan.lipski@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,amd.com:email,infradead.org:email,infradead.org:mid,infradead.org:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linuxfoundation.org:email,lwn.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C1C068480C



On 6/12/26 12:34 PM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c contains 7 (for
>> now) functions that use STATIC_IFN_KUNIT or INLINE_IFN_KUNIT macros for
>> function qualifiers (static or not, inline or not).
>>
>> These cause parse warnings from kernel-doc:
>> Invalid C declaration: Expected identifier in nested name, got keyword:
>>   struct [error at 29]
>> STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const
>>   struct drm_property_blob *blob, uint32_t *size)
>>
>> Handle these in kernel-doc to prevent multiple warnings.
>>
>> Fixes: 647d1fd04652 ("drm/amd/display: Add KUnit test for color helpers")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Ivan Lipski <ivan.lipski@amd.com>
>> Cc: Dan Wheeler <daniel.wheeler@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>>
>>  tools/lib/python/kdoc/xforms_lists.py |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- linux-next-20260601.orig/tools/lib/python/kdoc/xforms_lists.py
>> +++ linux-next-20260601/tools/lib/python/kdoc/xforms_lists.py
>> @@ -104,6 +104,8 @@ class CTransforms:
>>          (CMatch("__context_unsafe"), ""),
>>          (CMatch("__attribute_const__"), ""),
>>          (CMatch("__attribute__"), ""),
>> +        (CMatch("STATIC_IFN_KUNIT"), ""),
>> +        (CMatch("INLINE_IFN_KUNIT"), ""),
> 
> So I can't get this one to apply; which tree did you patch here?

Ah. My quilt patches. There is one there that I haven't submitted.
I'll drop it and resubmit the patch.

thanks.
-- 
~Randy

