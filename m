Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WaZwGtYeH2pTgwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 20:20:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88C631020
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 20:20:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=dmzX3sHD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E644110F325;
	Tue,  2 Jun 2026 18:20:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1AA10F325
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 18:20:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSEtMuMUQcqocBbswE+JH7ynSThWQ0qxiwk7jbvK+9lIFUjw1U+gSHXXSiyv2SvgdaV66f6CIbcSTyG1WjokPia+rwVG0s8R46BIExJpCBauHAHsVY1uYTWStOs01BMBeflbrAZzyRHo3RjWSWvOn8D5SHHMS3axPoFdu8az9T+Li20MvnDOHIh+wiINwCTAGE9SpPgWcqVPwmDtCqvS6K3SVkkrRAp9ahqIP0TvC1KxbdVFxoBZcJBOPePmKCv1e7bsBkqfxHTuIJeC1Bg3uVI/AMMhIz4fUaaCMvsj/KDR8aGpcmKGjE/adj+RYCE7hiLbNhaYPTG6RXWo/sjPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pczzfm65V7kGd2y0R9kgoPTHcmu2rOILIR8HM7lruVI=;
 b=AfHWcv1xBkgmAbSPUl5S6mxwwD2gRFvJyBGta5k2PHHmNj1UPuNzVo/54aiSLHJ2SbEvQqHnwKcGlXT1K0vvv/C6cmRAZi45sqF6U9qLzS7cWM4E6/BbkeOF3GhRPecvqZ5bfNTzYpIN6X+8Ig7Aoad/Fm+ud/WHJJCLISGy42f8BJVoLGNulZZMHnmABS/StGA7IXOUFe0/aq1w6swRayUyhEsbAhY70N7bFthD9ZMUu+FExrevEiFoDSQyVii8vASgNnXG4QqEB53gcMKQCeiMMPoPO/rLK3Yo1wdvFR/0YAt9jTkHzdxgdjeUPeGe+1L7tYnf8StqnVeASOBE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pczzfm65V7kGd2y0R9kgoPTHcmu2rOILIR8HM7lruVI=;
 b=dmzX3sHDn5L/exntd/bnrUuLrwqGfVTjlN5mfOxzOb+BedZSjw0Ki2uAX9r0zAW35QQkjfZ0xpBgblbbiTC+DMwQyR6sKss7xQbzLj9zEBGl0BfNiFvPEJ/IKVjZ7UkC1irB0R+mUgg6k0lypX2uGZVsKACcqsgpyLMxuQcPoeQ=
Received: from PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15)
 by CY8PR12MB7753.namprd12.prod.outlook.com (2603:10b6:930:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 18:19:57 +0000
Received: from PH7PR12MB7794.namprd12.prod.outlook.com
 ([fe80::e0be:f851:96ea:cf85]) by PH7PR12MB7794.namprd12.prod.outlook.com
 ([fe80::e0be:f851:96ea:cf85%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 18:19:56 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/amdgpu: validate the mes firmware version for
 gfx11
Thread-Topic: [PATCH 1/3] drm/amdgpu: validate the mes firmware version for
 gfx11
Thread-Index: AQHc8eMEHyVDP1LmBE2nCGV27jmtwrYrktKAgAAB/GA=
Date: Tue, 2 Jun 2026 18:19:56 +0000
Message-ID: <PH7PR12MB7794F7C24BB1EF58E6DA6BEE93122@PH7PR12MB7794.namprd12.prod.outlook.com>
References: <20260601162336.3239363-1-sunil.khatri@amd.com>
 <BL1PR12MB5144AC4C3E48C6FD88E7762CF7122@BL1PR12MB5144.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5144AC4C3E48C6FD88E7762CF7122@BL1PR12MB5144.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-06-02T18:07:10.0000000Z;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD Public
 v26; MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7794:EE_|CY8PR12MB7753:EE_
x-ms-office365-filtering-correlation-id: 94a7a95e-bb9c-408c-f6dc-08dec0d38cf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|38070700021|5023799004|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: J3RQ27Lxt9oK86XxzUy+CT/ER7NWpVmhj4N9SItrYql7a21fv6V84hpqVG7oXWsiVE0NRKhUhRYrJo0MW5KPkm4tRPGtjqGz1RdUXckh3NKktPQ1YZ9ufzxR1AA06C/vzFAIcerTflfln0jm9Mxw3C5incj8NfrdXTFiTJGatqsxbR0UvyxyTwBIGgQX49Pxv1WWQg1Mp06o03lo4pPBfBduFXjUMFCmB7JDdzFyUUBKKBl2rc+PhclR4zvii+XhZCzkC6G3WWedetrxl8GQQSFAzBIgDPUQDyPxf09kZQ5lN5i91mvwvAtVsehEICcNZKXGcYXlgOvKkR6tp07hHIC64jEOOU0Uq8q5UbRxHEYPq1+psLrVATK89fDd5OEF5OVpjEguyjrimKL4KUm6lovNswxkt/xCMdhj0wAWJyjozfrLmMZAo2nRFrSCdbcIFQV1iD7MbKc+XSJ3+Ksn1OAFg7iZU8upalngbMmjt6BS4PfDrAKBh+0vmV9zwPtEL6moAkDGvUhmLuMHdV7U1ieQimJlZnO+sZ+mVZCy4luhi7h9la6VRGVzKirZVpn/Y4A6Y6HeOSm2Pxpv33f/OIb2hyW5l0NLqwuBPh0CtNbO4AabDYduD75GnRyPkqxL+O9/qqrhc5HelPO1Rcuu5qLTttVG+I2AGFZRYy8mgZTH2DJTPeApiKzp6vg8xUO6e4eNj/2S10OgYo2aXCvXNEEZLP0jNbc9ILBW+/6xnoRs/01exY4pJ4le5mJOt0nS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7794.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(38070700021)(5023799004)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tkvNCegNV3Mx9GzSp3pqM5Y0b1lgCTVDI5zYJef5xfTB2kYvrrvvovB4dWNh?=
 =?us-ascii?Q?2/HKp2D1WR2gadZ5mWgy1Gme4vEXCYfYcEiOrHsTAFI6w5QWak2BVV3Ycsbj?=
 =?us-ascii?Q?Mk1gR1yas1yoo2jrP235EkGCu2h5SzrHADp5yqho9VMcHEajdjyWDdHcK6Lu?=
 =?us-ascii?Q?cGZoOuE5FuZG3lEY4w0j/wkjxw/2yXiEmii0hEKhqZqdELHw90BsI86wz1rs?=
 =?us-ascii?Q?c5ltGwwAt2EOFMW3sPoDcGA5IW7IAJfaAREYDjH6y+R/01b58L6Bw0NSB6eK?=
 =?us-ascii?Q?JvKIEdgXhjZYkZsjcENiAX4nrMJflgm3MU/5uBW744GSpW2iI7QM/CJ7f/Q/?=
 =?us-ascii?Q?ZFYfGzPZFg+b4apsnzAHcNNXEHqPJaJl9CUJelQV0AZYCfxXyTETvjmb7Mkp?=
 =?us-ascii?Q?kln6mIdk6zzZMJ9KAkgsnM5lpj4qQKy63eBGiWAg1KGS5uB/igsTF4J86mTI?=
 =?us-ascii?Q?r+iLLJiFQixr6VttIvhqHPnmbOe/NQN0SRaFrUGBU200MEJayDkA6FwlQMGh?=
 =?us-ascii?Q?uMqPPZQ9bZ9AiK5viBmJn5LzTAzRrogX2CB2AzPyJHLF3OGTOP/DjqINv3sQ?=
 =?us-ascii?Q?viMDKKR9ygKuYJqpXeNGTHZtqQsThh8uCHM2Alxo0ZOLAZM6SZlvj/2IyrKi?=
 =?us-ascii?Q?O+qU84nWWYx1h26gCW3U3lRNJMGQi7IfNTf8THHuR9oCcIvCzjYecaYdKvE+?=
 =?us-ascii?Q?rekSW2Pn5gar2751CVY9WE4ozUMrSa1j7UAZ17FFDsDYRmcuUCs+CKVDlDRf?=
 =?us-ascii?Q?oQffVWKeZZyzY4LmI9XvXab3+ZyrLfD6syLbmEYWbHMMv7U1TMp6OBSD/vyG?=
 =?us-ascii?Q?8Pl+XDOLh42rrxLwELUSME1rZq/gDQ+XPUNMn6DDG3CMTAaZ7ewkO9dOUwHD?=
 =?us-ascii?Q?Eobd6KqZ3eXoLbQlXvPKTNWvWcUyuJG68+0vQcEJcLsQCVqE5NWLriYbpCX9?=
 =?us-ascii?Q?ozwdm73SFHNOSWozpPVKvcEscsagVGMhcIcGbVgLOml+QM7KrDiuXuCe4fLT?=
 =?us-ascii?Q?zG16Omt8zflqpJg5v/TObuUwx90sW6tc7KiCUTVuOaClYYE7FZNQYO9b3A99?=
 =?us-ascii?Q?URhLohEcXg5wZyrHLpDGA9odbLD067xgUGXPgXMPFmXfeGkUzU51wadEoXDs?=
 =?us-ascii?Q?ntBzBZKW6Tc/7tHG+SdYJCbSkjeU/U0x2OFS+KMeaJC0CreZ3a7ge5AtX5tu?=
 =?us-ascii?Q?Cbd/6IkRYOnTM6Q0TSVNbNdL9DEv2VSuOaXGERoh/w1Wf386jsrrOwWUKRNI?=
 =?us-ascii?Q?6IWS7g4k4Pr7lAv0yU7RQPDnEvcinGR+fBffpCspCYDu26c1JJ5X3LAF5gGi?=
 =?us-ascii?Q?bQ9PYUfz+siO5fYEfPEr717R2hng0uVQMCPWt74fyIhJshSsg8+6ka/qc9tP?=
 =?us-ascii?Q?j6Y2k4Z0wydxJo7kptR3rQvn/l64ocVl9ZOyMY9WA1Jkwpe17pXGUliHmowu?=
 =?us-ascii?Q?gwMTQ6v9f2ocZfSJirXpiEieLrqL1xrzoLMDglVc0vHlKlaYmOtnID0+nZbB?=
 =?us-ascii?Q?a3B0Zeizf+7SldIEkz0dyu3jkuaU7QQiMLL0wda+BCM9TeqVGiHICebv7810?=
 =?us-ascii?Q?O7ppQrPtGDipz2LYcFC6i14SElEClPP4eOdDkYnTxvajo7CytEx4Kqb30WaY?=
 =?us-ascii?Q?ku3HzkAsk2Xe9xjzOAHdeBNXaCQ3c4PY0Mp45/RUmVyR8XskCDYHt0wBMBg8?=
 =?us-ascii?Q?h0rIfDNQfcsPjaWsDlWj3qMM0vofmnBxoD2KVGJKxF16RwW5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7794.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a7a95e-bb9c-408c-f6dc-08dec0d38cf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 18:19:56.8056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zkmk3LamGlj/kEM67LgpzSQHmS6gE5YYx4HsedNRnoq+Hpyjn+hP8QFLBXLLG9TvbRdI8UCUsEm6Qemk7QlPzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7753
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Sunil.Khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Sunil.Khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:from_mime,amd.com:email,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,PH7PR12MB7794.namprd12.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B88C631020

Public

-----Original Message-----
From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Tuesday, June 2, 2026 11:42 PM
To: Khatri, Sunil <Sunil.Khatri@amd.com>; Koenig, Christian <Christian.Koen=
ig@amd.com>
Cc: amd-gfx@lists.freedesktop.org; Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: RE: [PATCH 1/3] drm/amdgpu: validate the mes firmware version for =
gfx11

Public

> -----Original Message-----
> From: Sunil Khatri <sunil.khatri@amd.com>
> Sent: Monday, June 1, 2026 12:24 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; Khatri, Sunil
> <Sunil.Khatri@amd.com>
> Subject: [PATCH 1/3] drm/amdgpu: validate the mes firmware version for
> gfx11
>
> MES fw should report the fw version same either read from the register
> or if read from the firmware ucode. That is not the case for MES
> firmware and we add a warning in case it is not same.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 12 ++++++++++++
> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h |  1 +
> drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  |  1 +
>  3 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index c9467b26e42c..e5e1ceabcbc5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -781,6 +781,18 @@ int amdgpu_mes_init_microcode(struct
> amdgpu_device *adev, int pipe)
>       return r;
>  }
>
> +void amdgpu_mes_validate_fw_version(struct amdgpu_device *adev) {
> +     u32 fw_from_ucode =3D adev-
> >mes.fw_version[AMDGPU_MES_SCHED_PIPE];
> +     u32 fw_from_reg =3D adev->mes.sched_version &
> AMDGPU_MES_VERSION_MASK;
> +
> +     if (fw_from_ucode !=3D fw_from_reg)
> +             dev_warn(adev->dev,
> +                      "MES FW version mismatch: ucode=3D0x%x
> register=3D0x%x\n",
> +                      fw_from_ucode, fw_from_reg);

Rather than a warning, maybe just dev_info?  I'm concerned this will genera=
tes a lot of useless bug reports.  There's nothing actually wrong with the =
firmware, the version is just wrong in the ucode binary.  Perhaps reword th=
e message to say something like: "firmware reports incorrect version in uco=
de binary (0x%x vs. 0x%x)."


Sure that sounds good to me. Will push another patchset.
Regards
Sunil Khatri

Alex


> +}
> +
> +
>  bool amdgpu_mes_suspend_resume_all_supported(struct amdgpu_device
> *adev)  {
>       uint32_t mes_rev =3D adev->mes.sched_version &
> AMDGPU_MES_VERSION_MASK; diff --git
> a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> index 93990d4990f2..fdd06a17520a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> @@ -441,6 +441,7 @@ struct amdgpu_mes_funcs {
>       (adev)->mes.kiq_hw_fini((adev), (xcc_id))
>
>  int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe);
> +void amdgpu_mes_validate_fw_version(struct amdgpu_device *adev);
>  int amdgpu_mes_init(struct amdgpu_device *adev);  void
> amdgpu_mes_fini(struct amdgpu_device *adev);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> index a926a330700e..0db378d126fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -1686,6 +1686,7 @@ static int mes_v11_0_hw_init(struct
> amdgpu_ip_block *ip_block)
>       if (r)
>               goto failure;
>
> +     amdgpu_mes_validate_fw_version(adev);
>  out:
>       /*
>        * Disable KIQ ring usage from the driver once MES is enabled.
> --
> 2.34.1


