Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWSyMlM5KGrKAQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 18:03:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E606C6621BA
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 18:03:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aC8wuJL6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83B710E350;
	Tue,  9 Jun 2026 16:03:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6B910E350;
 Tue,  9 Jun 2026 16:03:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 526EC6020B;
 Tue,  9 Jun 2026 16:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3C41F00893;
 Tue,  9 Jun 2026 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781021005;
 bh=4ebGrgngEkzamxgfnK/0XoDfIZTS3CWDxeVGgGrUT/E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aC8wuJL6YMCMtrTSIZBSXZspSCOUwrB9WeVbxc5DLEkVudEvi5wKxFtaUjMwCJkLG
 HJwgosuvtHW54CJTecsMPHJhUinbtHzfwihA2OdfxEFJsUqYydxpXGGYf1p6jXtdBH
 I2Xc6ZQqZimGVeft+UGn52jmdET0IGrlskte+blKVdwog8RpKz2T2C3XBn0jrLEijl
 uy2621lvjIGCCdg8Vx3qEVcGSOsV9mEYGf5jBwCrGymQRrFl9WHSpiX/GRFNkXApMt
 b4p7AASGJsoDGS2as9GTPkjQVp3KF/7AkI+/aAb1PkhPjVUAtoxYzJBQ2pqJqyWz2u
 t6qagrSxlf7gg==
Message-ID: <4df73005-ac4f-4636-b18b-0c2f03004c2a@kernel.org>
Date: Tue, 9 Jun 2026 11:03:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Don't use UTS_RELEASE directly
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Kees Cook <kees@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260428144704.1114562-2-u.kleine-koenig@baylibre.com>
 <aigx2xn-59FmGw63@monoceros>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aigx2xn-59FmGw63@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,kernel.org,igalia.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,baylibre.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E606C6621BA

On 6/9/26 10:32, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> On Tue, Apr 28, 2026 at 04:47:03PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
>> UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
>> uncommitted changes in the source tree or new commits). So when checking
>> if a patch introduces changes to the resulting binary each usage of
>> UTS_RELEASE is source of annoyance.
>>
>> Instead of using UTS_RELEASE directly use init_utsname()->release which
>> evaluates to the same string but with that a change of UTS_RELEASE
>> doesn't affect amdgpu_dev_coredump.o.
>>
>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
> Is this patch still on someone's radar?
> 
> Best regards
> Uwe

Sorry it looks like it got missed.  Thanks for pinging.
I'll pick it up.
