Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GQJQB5fsH2rnsQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 10:57:59 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45D2635EBC
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 10:57:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=d05zKxK4;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=proton.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B99B10FAED;
	Wed,  3 Jun 2026 08:57:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F087810EF82
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1780399442; x=1780658642;
 bh=a9fgN7nmhBc6vLl3TBFAXIuSjCzaskI50tzfoiuYcAQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=d05zKxK4I6mNSuKZe5/9uDirCkpaxM+npMK7dGREn0n2wIRn1cXCk9XgK7fPSCRty
 uejEtqudYvCl6R34paU5naihVnqGNAyBoJbfaUzkHHuXSkNNiPYm7G5iC2M/3ShEtc
 MbYsOosEDt0DSC03PgYA3C4eft9Nxk6M7xgV/PQT7DBouQV5g4SATcRCVleWTEDCHQ
 qStpqHvIf5JnFZMUYQRFGhcvoCOZxUZUdHXugzJaUtfkquW4BkFKR8QBqXX6dqEM7L
 jZ4rw6HFY7jlzNvR5lplsLdfHYFzk169tUhZtCQLV0lu+83yycLxmXtMq+SvrXlv36
 FZMDJR+d/zl3w==
Date: Tue, 02 Jun 2026 11:23:57 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev
From: Tj <tj.iam.tj@proton.me>
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [REGRESSION] RIP: 0010:vce_v1_0_set_powergating_state+0x5b8/0x600
 [amdgpu]
Message-ID: <43123501-2119-4ac6-b1cd-e59dfe6dca89@proton.me>
In-Reply-To: <59f38ae7-2d5a-4dcf-bff9-7e58c36f36d4@leemhuis.info>
References: <ah6q-k5wvRbW6k6e@mail.iam.tj>
 <59f38ae7-2d5a-4dcf-bff9-7e58c36f36d4@leemhuis.info>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 39e7211d699ec92de7dbeb1ae2dd89066f898786
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Jun 2026 08:57:50 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:regressions@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tj.iam.tj@proton.me,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[proton.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C45D2635EBC

v7.1-rc6 +=C2=A0 "drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on a=
ll=20
SI" and confirmed resolves this issue. Thank-you.
On 02/06/2026 10:22, Thorsten Leemhuis wrote:
> On 6/2/26 12:06, Tj wrote:
>> Repeatedly hit this with 7.1-rc6. I haven't yet got time to do a bisect.
>>
>> $ lspci -nnk -d ::0300
>> 0a:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [=
AMD/ATI] Cape Verde GL [FirePro W4100] [1002:682c]
>>          Subsystem: Dell Device [1028:2b1e]
>>          Kernel driver in use: amdgpu
>>          Kernel modules: radeon, amdgpu
>>
>> $ journalctl --boot 5e39a2d49af2432c8f14f2a866a6b275 --priority=3Dwarnin=
g
>> ...
>> Jun 02 09:25:11 sunny kernel: Linux version 7.1.0-rc6+debian+tj (linux@i=
am.tj) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.4=
4) #446 SMP PREEMPT_DYNAMIC Mon Jun  1 07:32:2>
>> ...
>> Jun 02 09:25:11 sunny kernel: WARNING: drivers/gpu/drm/amd/amdgpu/vce_v1=
_0.c:329 at vce_v1_0_set_powergating_state+0x5b8/0x600 [amdgpu], CPU#8: (ud=
ev-worker)/251
> Thx for reporting this. This is not my area of expertise, but from a
> very quick look that seems to be the issue
> https://gitlab.freedesktop.org/drm/amd/-/work_items/5336
> for which Timur sent a fix:
>
> drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on all SI
> https://lore.kernel.org/all/20260525112204.12604-1-timur.kristof@gmail.co=
m/
>
> According to Alex it's making it's way through the ranks. Consider
> testing it to ensure it really is the same problem.

