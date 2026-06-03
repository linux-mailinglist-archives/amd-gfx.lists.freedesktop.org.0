Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MYkTFbbBH2oOpgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 07:55:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB736346DC
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 07:55:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=QKj1fGz1;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=pm.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B36910F88D;
	Wed,  3 Jun 2026 05:55:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 167966 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jun 2026 05:54:57 UTC
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com
 [57.129.93.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D7910F88C
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 05:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1780466092; x=1780725292;
 bh=42GDx+EcOLAVCCoS9tmCFsH8/PBiWa8gmqrFleBsEVw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QKj1fGz1puRCyp/3DX5HtlQxnL1vaYAapigHAdWDeRkqSSh47vd3TdbUAZW5QAH1F
 l49COOfXjsH1aLn58t2W8HawjPV1AhhIHsqEGLrt7tJc1u/Uyr10tahS2snhFF9i1m
 mq5wzV2onq9v7Zc9t9P6MUCVa+X6jOxRZfX+9C+rdvFr3Bx/hVdYP0PqpVPL35Cdb6
 ctSESCxyL9CtmC3ARnpk7uK8cU/TC1Ia1vLsO/wJTNum58pJCxpzK0GhWzlgpIGFBA
 u+fGZJF92OsYhEmkaCnqie9GEPEIkub3n3ZoeB5ooKEPOlaSzxFGiSWxzXswmHGFCH
 JD9jKn3kt50wQ==
Date: Wed, 03 Jun 2026 05:54:47 +0000
To: "Chen, Xiaogang" <xiaogang.chen@amd.com>, regressions@lists.linux.dev
From: Gerhard Schwanzer <geschw@pm.me>
Cc: amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 alexander.deucher@amd.com, Philip.Yang@amd.com
Subject: Re: [REGRESSION] drm/amdkfd: SVM split-tail remap regression causes
 SDMA0 permission fault on RX 7600 XT
Message-ID: <2145b14f-00e7-4565-b1da-9e08d2c89a49@pm.me>
In-Reply-To: <53c2ad43-091d-46e9-b825-9aaa1d7114e8@amd.com>
References: <2bfa2f1b-567a-429b-aee2-a8dcf7efd5aa@pm.me>
 <53c2ad43-091d-46e9-b825-9aaa1d7114e8@amd.com>
Feedback-ID: 110185885:user:proton
X-Pm-Message-ID: 0adb7ef1f3a71170ad3d50b79d44d548ca87f578
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaogang.chen@amd.com,m:regressions@lists.linux.dev,m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:Philip.Yang@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geschw@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[geschw@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,lists.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,trace_history_replay.inc:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EB736346DC

Hi Xiaogang,

Sorry, you are right. The source I uploaded was not self-contained, it stil=
l
referenced trace_history_replay.inc from an older local replay mode.

I uploaded a self-contained v2 source to the GitLab report:

https://gitlab.freedesktop.org/-/project/4522/uploads/7395b8985ecd7c54183a7=
615d479c02c/kfd_svm_split_hsa_copy-v2.c

The --upstream-ab path does not use that replay table, but the missing=20
include
obviously broke fresh builds. The v2 source embeds the table and otherwise
preserves the same source.

I re-tested this v2 source before uploading:

 =C2=A0 - clean build from only kfd_svm_split_hsa_copy-v2.c: OK
 =C2=A0 - ./kfd_svm_split_hsa_copy --help: OK
 =C2=A0 - good/workaround kernel: --upstream-ab completed 10/10 runs, no ne=
w
 =C2=A0 =C2=A0 GCVM/SDMA0/protection-fault messages in the test window
 =C2=A0 - broken kernel: --upstream-ab reproduced the SDMA0 permission faul=
t;
 =C2=A0 =C2=A0 the first kernel fault address matched the planned split-tai=
l page

Validation summaries:

https://gitlab.freedesktop.org/-/project/4522/uploads/e6d0f31c0fda0df2c9994=
39411f29dca/good-kernel-validation-summary.md
https://gitlab.freedesktop.org/-/project/4522/uploads/bdf8a3ac6786ddb88dd42=
6b59edb32a9/broken-kernel-validation-summary.md

The intended triage command remains:

 =C2=A0 ./kfd_svm_split_hsa_copy --upstream-ab

Generic build shape is:

 =C2=A0 cc -O2 -g -Wall -Wextra -pthread \
 =C2=A0 =C2=A0 -I/path/to/rocm/include -L/path/to/rocm/lib \
 =C2=A0 =C2=A0 -o kfd_svm_split_hsa_copy kfd_svm_split_hsa_copy-v2.c \
 =C2=A0 =C2=A0 -lhsa-runtime64

If you still prefer a binary, please tell me the target runtime/distro. A
binary built on my NixOS system is Nix-store linked and likely not=20
portable to
your test system.

One more thing that would help me test any replacement fix: do you know wha=
t
specific failure or workload 448ee453 was intended to fix? I would like to
avoid validating only the revert side while accidentally losing the origina=
l
fix.

Thanks for catching this, and thanks for taking a look.

Regards,
Gerhard


On 06/03/2026 Chen, Xiaogang wrote:

> I cannot compile kfd_svm_split_hsa_copy.c, there is no
> "trace_history_replay.inc".
>
> Or can you=C2=A0 send the test binary?=C2=A0 That should be enough to tri=
age the
> issue since it is a regression as you mentioned.
>
> Regards
>
> Xiaogang
>
> On 6/2/2026 5:04 AM, Gerhard Schwanzer wrote:
>> Hi,
>>
>> I would like to make sure this AMDKFD SVM regression is tracked by the
>> Linux regression process.
>>
>> GitLab report:
>>
>>  =C2=A0 https://gitlab.freedesktop.org/drm/amd/-/work_items/4914
>>
>> The regression was originally reported on 2026-01-27. It was bisected
>> to the
>> same functional change that Alex Deucher's revert patch later targeted:
>>
>>  =C2=A0 448ee45353ef9fb1a34f5f26eb3f48923c6f0898
>>  =C2=A0 drm/amdkfd: Use huge page size to check split svm range alignmen=
t
>>
>> The affected kernel line I tested identifies the same change as:
>>
>>  =C2=A0 bf2084a7b1d75d093b6a79df4c10142d49fbaa0e
>>
>> Alex's revert patch:
>>
>> https://lists.freedesktop.org/archives/amd-gfx/2026-February/138824.html
>>
>> A small C/HSA reproducer is now available in the GitLab report. It
>> does not
>> require PyTorch, ComfyUI, Docker, model files, or the original
>> workload. It
>> uses ROCr/HSA, an anonymous THP-advised host mapping, explicit KFD SVM
>> SET_ATTR ioctls, and an HSA SDMA D2H copy.
>>
>> Single reproducer command, same binary on both kernels:
>>
>>  =C2=A0 ./kfd_svm_split_hsa_copy --upstream-ab
>>
>> Same-machine A/B result on an RX 7600 XT:
>>
>>  =C2=A0 448ee453/bf2084a7 active:
>>  =C2=A0 =C2=A0 1/1 run faults with SDMA0 permission fault
>>  =C2=A0 =C2=A0 GCVM_L2_PROTECTION_FAULT_STATUS=3D0x00841A51
>>
>>  =C2=A0 448ee453/bf2084a7 locally reverted:
>>  =C2=A0 =C2=A0 10/10 runs complete
>>  =C2=A0 =C2=A0 no ROCr memory access fault
>>  =C2=A0 =C2=A0 no new GCVM/SDMA0 permission fault in dmesg
>>
>> The bad fault page is inside the split tail and inside the SDMA copy
>> range:
>>
>>  =C2=A0 critical tail: [0x722429d61..0x722429dff]
>>  =C2=A0 copy pages:=C2=A0 =C2=A0 [0x722429b30..0x722429d70]
>>  =C2=A0 fault page:=C2=A0 =C2=A0 0x722429d65
>>
>> A full ftrace/PTE run with the same C reproducer/SVM sequence also shows=
:
>>
>>  =C2=A0 split_tail ... current_remap=3D0 old_remap=3D1 missed=3D1
>>  =C2=A0 MISSED_REMAP_CANDIDATE split=3Dtail
>>  =C2=A0 no amdgpu_vm_update_ptes covering the fault page after the marke=
r
>> before
>>  =C2=A0 the fault-side GET_ATTR
>>
>> The suspected code issue is that the split-tail/head remap predicate
>> introduced
>> by 448ee453/bf2084a7 can miss tails inside the final 512-page block.
>> Since
>> prange->last is inclusive, ALIGN_DOWN(prange->last, 512) is the start
>> of the
>> final block, not an exclusive upper bound.
>>
>> I also sent a short follow-up to amd-gfx with the reproducer/A-B
>> summary and
>> asked what original failure or workload 448ee453/bf2084a7 was intended
>> to fix:
>>
>> https://lists.freedesktop.org/archives/amd-gfx/2026-June/145800.html
>>
>> I can resend the reproducer source and summaries directly on-list if
>> preferred.
>>
>> #regzbot introduced: 448ee45353ef9fb1a34f5f26eb3f48923c6f0898
>> #regzbot monitor:
>> https://gitlab.freedesktop.org/drm/amd/-/work_items/4914
>>
>> Thanks,
>> Gerhard Schwanzer

