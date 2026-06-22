Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MQf0BLc+Omqz4gcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:07:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA96B51DD
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:07:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=rNfN66Pg;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=pm.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269B410E9D1;
	Tue, 23 Jun 2026 08:07:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch
 [109.224.244.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5980110E6C1
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1782134221; x=1782393421;
 bh=kjjZ+rljyGCmhet75Do9R78aEUad2c2jRsV0wyYadL4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=rNfN66PghrClOqMWjF99Ix9M4F7n7wbFgE1yJscGXmsCMeSqkOXE6gFGp4CqsAzLT
 0m033p3/7OBiXyB47TH9NauBl/F1gH77uZ39f5g2YIIdXDPg/aY40Zr4c8hnDRaLmi
 xw/gqMrpt+Oe9gVBBeHduBakcj1Pdc9jTG2PDqKdeBpSIMvUgN7mEARBKlyUOdsktb
 XFnwcHqcPU9v1VmKRYhNYP0MKUMW1B4F9luH5FViPtIwYIwxv5wLWFy5Ai96SHuBDZ
 knuftWvffZOtN+2HGLaqidhb09iG8F2dPKYX1xMYdRpiZEBwGIEXwNCcOoDwcqOf78
 8FNRsWDpLLfsg==
Date: Mon, 22 Jun 2026 13:16:57 +0000
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Matthew Jacob <feralmatt@pm.me>
Cc: Matthew Jacob <mjacob@feralsw.com>, alexdeucher@gmail.com,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] Support some Barco AMD based graphics adapters
Message-ID: <WjTTAN8HEA17ipZahqGCmbkQ2mCLCXSlQ2ugMZ_oal88kOyiTZZQFSUG4zo6IMA8vdnyQfXqyCMxeyCruwX-X4-S9Aq--SUgm-LakbvVN3A=@pm.me>
In-Reply-To: <689a4adf-812f-475e-8e33-c17893a05f1e@amd.com>
References: <1b83ac6f-1018-3dee-c029-1b2ed78a8460@feralsw.com>
 <10397a2a-88cf-4070-aced-291e24785a8d@amd.com>
 <-OvmEF_NM5X1NJ1TKjZKl_nNHJhfQxE-zh4bIGMsBfCfSjyFJFc-sFkaYCXJZD4mhu1KKM0QJ7dbvMkzPJSzvkYhQixNHLNuRbSdNLnhjNU=@pm.me>
 <689a4adf-812f-475e-8e33-c17893a05f1e@amd.com>
Feedback-ID: 169730088:user:proton
X-Pm-Message-ID: 95c72a4ba3328d221957d10112d797bed4f8f5b0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 23 Jun 2026 08:07:15 +0000
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
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:mjacob@feralsw.com,m:alexdeucher@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[feralsw.com,gmail.com,lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[feralmatt@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[feralmatt@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68AA96B51DD

Roger the revert and thanks!


Wizard, 3rd Class

Sent from Proton Mail for Android.

-------- Original Message --------
On Monday, 06/22/26 at 06:14 Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
On 6/22/26 14:34, Matthew Jacob wrote:
> Sorry about the style. Do I need to resubmit?

No, no Alex will probably fix that up.

>
> My experience with the boards so far has been fine. Without the change mu=
ltiple monitors don't work correctly. With the change they do. Boot up in B=
IOS seems to operate correctly. Linux version testing has ranged from 5.15 =
through 6.12 and of course once top of tree recently.

Well that sounds promising, but somebody intentionally changed the FW/VBIOS=
 to report a different PCI identifier so that standard AMD GPU drivers don'=
t load.

People usually do that for a reason, so I would expect some difference the =
normal driver doesn't take into account.

Anyway it currently seems to improve the situation so I would say we should=
 go with it, but if somebody reports issues we might as well revert it.

Regards,
Christian.

>
> Normally I probably wouldn't have bothered to intrude with this change, b=
ut then the now widespread use of secure boot and the impracticality of dis=
abling secure boot in the Kaiser fleet when booting USB keys practically me=
ans that I need to get this change rolled out so that at least Debian will =
pick it up and produce signed kernels.
>
>
> Wizard, 3rd Class
>
> Sent from Proton Mail for Android.
>
> -------- Original Message --------
> On Monday, 06/22/26 at 01:22 Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> On 6/19/26 20:45, Matthew Jacob wrote:
>>
>> These adapters typically are only supported by Barco on the Windows
>> platform. However, with these changes in the linux driver, multiple
>> monitor support should work correctly.
>>
>> Signed-off-by: Matthew Jacob <mjacob@feralsw.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_drv.c
>> index 60debd543e44..e3ba168795cc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1926,6 +1926,7 @@ static const struct pci_device_id pciidlist[] =3D =
{
>>        {0x1002, 0x6646, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE|AMD_I=
S_MOBILITY},
>>        {0x1002, 0x6647, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE|AMD_I=
S_MOBILITY},
>>        {0x1002, 0x6649, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
>> +       {0x1002, 0x664D, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE}, //=
 Barco MXRT-5600
>
> Please no // style comments in kernel code.
>
> Apart from that looks good to me, but I'm wondering if we shouldn't print=
 a warning or similar.
>
> It could be that those boards have non standard VBIOS changes and cause p=
roblems on Linux.
>
> Regards,
> Christian.
>
>>        {0x1002, 0x6650, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
>>        {0x1002, 0x6651, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
>>        {0x1002, 0x6658, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
>> @@ -1995,6 +1996,7 @@ static const struct pci_device_id pciidlist[] =3D =
{
>>        {0x1002, 0x6930, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
>>        {0x1002, 0x6938, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
>>        {0x1002, 0x6939, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
>> +       {0x1002, 0x693B, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA}, // B=
arco MXRT-7600
>>        /* fiji */
>>        {0x1002, 0x7300, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_FIJI},
>>        {0x1002, 0x730F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_FIJI},
>> @@ -2023,6 +2025,7 @@ static const struct pci_device_id pciidlist[] =3D =
{
>>        {0x1002, 0x67C4, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>>        {0x1002, 0x67C7, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>>        {0x1002, 0x67D0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>> +       {0x1002, 0x67D4, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10}, =
// Tentative Barco MXRT-8750
>>        {0x1002, 0x67DF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>>        {0x1002, 0x67C8, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>>        {0x1002, 0x67C9, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>> @@ -2036,6 +2039,7 @@ static const struct pci_device_id pciidlist[] =3D =
{
>>        {0x1002, 0x6985, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>>        {0x1002, 0x6986, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>>        {0x1002, 0x6987, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>> +       {0x1002, 0x698F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12}, =
// Tentative Barco MXRT-4700
>>        {0x1002, 0x6995, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>>        {0x1002, 0x6997, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>>        {0x1002, 0x699F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>> --
>> 2.47.3
>>
>
>


