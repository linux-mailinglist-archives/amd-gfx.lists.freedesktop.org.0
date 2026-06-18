Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sl9fHlbsNGrRkAYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 09:14:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685D6A4467
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 09:14:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A856A10F471;
	Fri, 19 Jun 2026 07:14:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 3863 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jun 2026 15:00:31 UTC
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [185.226.149.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3E810E7CA
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2026 15:00:31 +0000 (UTC)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <martin.roukala@mupuf.org>)
 id 1waDDy-006Jqm-5h; Thu, 18 Jun 2026 15:56:06 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.roukala@mupuf.org>)
 id 1waDDx-0004vS-Kz; Thu, 18 Jun 2026 15:56:05 +0200
Received: by submission03.runbox with esmtpsa [Authenticated ID (1057822)]
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) id 1waDDm-004UAW-Uz; Thu, 18 Jun 2026 15:55:55 +0200
Message-ID: <09dbd11f-a793-4224-a6e4-628e7f87bd22@mupuf.org>
Date: Thu, 18 Jun 2026 16:55:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] drm/amdgpu: Rework IP block soft reset on GFX8
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOh?=
 =?UTF-8?Q?k?= <maraeo@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Lazar Lijo <lijo.lazar@amd.com>
References: <20260617191428.1784083-1-timur.kristof@gmail.com>
Content-Language: en-US
From: Martin Roukala <martin.roukala@mupuf.org>
In-Reply-To: <20260617191428.1784083-1-timur.kristof@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Jun 2026 07:14:26 +0000
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[mupuf.org: no valid DMARC record];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:natalie.vock@gmx.de,m:mario.limonciello@amd.com,m:maraeo@gmail.com,m:tvrtko.ursulin@igalia.com,m:lijo.lazar@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de,igalia.com];
	FORGED_SENDER(0.00)[martin.roukala@mupuf.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.roukala@mupuf.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,mupuf.org:email,mupuf.org:mid,mupuf.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2685D6A4467

On 6/17/26 22:14, Timur Kristóf wrote:
[...]
> 
> Tested on the following chips:
> 
> Polaris 10 (Radeon RX 570)

Tested-by: Martin Roukala <martin.roukala@mupuf.org>

It survived a 1000 hangs coming from a 1000 contexts started all at 
once... and even went through suspend/resume right after!

This is a massively-better experience than a loud reset taking 10+ 
seconds (fan spinning at 100%), a corrupted framebuffer, and needing to 
restart my graphical session every time.

Congrats :)

> Polaris 11 (Radeon RX 560)
> Polaris 12 (Radeon RX 550)
> Fiji (Radeon R9 Nano)
> Tonga (Radeon R9 380X)
> Carrizo (A8-9600)

[...]
