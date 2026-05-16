Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNSZEfHcCmpV8wQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 11:33:37 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0B569CCE
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 11:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAA810E081;
	Mon, 18 May 2026 09:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="ZrEe2af6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 46328 seconds by postgrey-1.36 at gabe;
 Sat, 16 May 2026 23:13:58 UTC
Received: from outbound.mr.icloud.com (mr-2002l-snip4-2.eps.apple.com
 [57.103.68.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C55710E1E3
 for <amd-gfx@lists.freedesktop.org>; Sat, 16 May 2026 23:13:58 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-2a-60-percent-5 (Postfix) with ESMTPS id
 1EE231800133; Sat, 16 May 2026 23:13:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEG1sIUhhXE1gTVl8OXQIwUBtfAkIPHBNWFRMLU1ZRGFwdQAhUClkVC0EFXXcCURxWDVdDVARfUEsbDlwES1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKAlEcVg1XQ1QEX1BUEVdQCwoAFlpAClRVRgJEDEkeWQNYBF1YTldfGlJTFAAaCw4FXQZAXDhaDlsERxQXG1wACUtGCUkdDgRUB10FXQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai;
 t=1778973238; x=1781565238; bh=2B8kh88BmMcREPsTrqppXb4O6KSA0MQb13JMTQ3AyrA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
 b=ZrEe2af6nbuQLUs+52pG0Ub0MTF8KtiuYVacoOn6dz74pLF+6/Pl4gQ/MhNLkWHOL10lbfP5CRrbRLsR2qJp6nu9drE+xzNdYKEA4omdExVP7gHB6FJB2XU0gGIOdvKGERWr592TYXSJ9SATX/SJvvBE8fsKEz0KlcpPyfPzSOCNL3pkV3pJBbDy+SLb9qgv5YYrH7SWZLLPRntrGad2Kd1VrJ3f8g6UgF98Xz3Vjm8gkluC1b9DSh1YA3/IZnApksUo+PEBkMqNDz3Ypu7BkjT9PrKIEowCFRp3/2pdUe9C5UC/Xn6s6GR2zLvJ5mS5zrL29HrzXRYeDAhP/WYkbA==
Received: from [192.168.1.34] (unknown [17.57.152.38])
 by p00-icloudmta-asmtp-us-west-2a-60-percent-5 (Postfix) with ESMTPSA id
 B13AC1800134; Sat, 16 May 2026 23:13:51 +0000 (UTC)
Message-ID: <a2fc899b-0451-4436-a6d2-9ad9b8c2640e@icloud.com>
Date: Sun, 17 May 2026 08:13:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typo in mpo-overview.rst
To: Jonathan Corbet <corbet@lwn.net>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516100406.21070-1-cheesecake2960@icloud.com>
 <87se7rmont.fsf@trenco.lwn.net>
Content-Language: en-US
From: Cheesecake <cheesecake2960@icloud.com>
In-Reply-To: <87se7rmont.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDIzNyBTYWx0ZWRfX9afkiO/+L68K
 3sxyBWtZdDUI1yDvHkh0b4UTlPgwsu3RwLa8Mo3ujYiTphvnV/uUmoBYx1JP3i46lv0BV0UHJHF
 OLxJeYT3im3fTXJzdbZNyKzNv6D0tFSpdJUYqZysp3xOX4Wfb+wh02QbDzaE7TEPBX6OkkwAXKS
 fzVl02OvH/xfwgCQ7DJdhq8BCZmJgPh+DhGBaIrHoZnDVXERXTjI3RWbc9FvKFnyv0DJEJtYqAZ
 nGhVlDYV0DwdjhFJ6stHN5JDZz6vrXufPbhatQnBBl9r6PT8S0RoDOLqh4RomCamLMWx6wUiyPA
 t0KpAcfFhJ4BaypM5VZktEloHnBOHMvYP3xs3jAAuaXVic5FwnyfBj2S4TVMvQ=
X-Authority-Info-Out: v=2.4 cv=BquQAIX5 c=1 sm=1 tr=0 ts=6a08fa34
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=sIGCgqHK338A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=U4lEO9gh2w5_OOAwJnoA:9 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10
 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-GUID: FockY6_NoY58eSZNn8CMSw7qhlzHuBrL
X-Proofpoint-ORIG-GUID: FockY6_NoY58eSZNn8CMSw7qhlzHuBrL
X-Mailman-Approved-At: Mon, 18 May 2026 09:33:27 +0000
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
X-Rspamd-Queue-Id: 19C0B569CCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[34];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:skhan@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cheesecake2960@icloud.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[icloud.com];
	FREEMAIL_TO(0.00)[lwn.net,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[icloud.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cheesecake2960@icloud.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icloud.com:email,icloud.com:mid,icloud.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

On 2026/05/16 23:09, Jonathan Corbet wrote:

> Cheesecake <cheesecake2960@icloud.com> writes:
>
>> Replace "transparant" with "transparent"
>>
>> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
> Patches need a proper signoff with a real name, please.
>
> Thanks,
>
> jo


Thanks for pointing that out.

I accidentally sent this patch using an anonymous address/name.
I'll resend it properly later.

Thank you for your time.

