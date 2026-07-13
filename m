Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2wJzG0zpVGoWhAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:34:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74C74BA42
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=maVTcoab;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4A710E5E1;
	Mon, 13 Jul 2026 13:34:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71AD10E5E1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1CnPb/ac5fqP2N7TRHER3M9hxCXkqx8lA2WsnwrC+tdk4iZ04l8UKdTJmncW6DmaU7HC66gQSUB/8Q3DqKCjCmvdHU3+ZMGQNekIofdFSrfS+PAcho1+H6DMgprtaz+Rx0GOAukp8nuyNzz+y5EceCq0fNRo9e4mv6bMmbMc7OwZADLtWiimcKe9I1R4W8MQAx6Fmz6cCPylxXh9PAKk4GWP5WXq6y8hgigbbRwAdwE3/eCINozS2U6ZOP0bZE1f+jLHUK5lZbEvjxlrpPQQR6tTFnZEUrSTgXEJ8eEMvF7+tbJ19TFaYrPugBdlQEC15EmEo2D2lAVVh5UaTNBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81ruH7+zI2FX/FP3HD7pDXZLA3tazDt77DVTAzWvn/Q=;
 b=JZpUMm3nMPOnr3bZ+WFBBGOFOvbrAiZpQ8S3//jVi42ydyOMXlZKXlHEs+UNblzSkzHWw2aLNPe5kh0jFIJZsCcpNWcpihA4HUBg3ani2qK6Z6Nd5U7ye8Niw22wVE1mbX5ZUtMgDCf+VRNky0MPpJsk5w6/Uz1KqZQpsWY7KyGA1GJFmMVdImP8KJaBtmIRCUrYHRgNHHfvyFKUbbwlZJ8Re0fZjg6QZJ3nNULMbS3oLcjBMa2jbDO2fNweWVwzebrzveAdU9H5oYxYHplLgrag7x3eY9dh+uMEbIMPFNb0N6Nokk+d+iyxLf3CF5xddL5orX4pCfW9Yqsv9WICKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81ruH7+zI2FX/FP3HD7pDXZLA3tazDt77DVTAzWvn/Q=;
 b=maVTcoab5yQdEXVz9Pl3FRa4L4qFeDbA5B/ytbfhjOO8ivjaunErwRNnb/j5G5WdsaQJfmUTYK6FGJxPawVjSo6Bclww1kFle5AOLvfFGdfm5r+pOYUrM/Jo5crKfMLoL3f604SjcKmZ1a7QZm2rq74p2j1YN/0SlYbeJlW/U4k=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by DS2PR12MB9709.namprd12.prod.outlook.com (2603:10b6:8:276::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 13:33:54 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::1aeb:47e6:faf1:5f13]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::1aeb:47e6:faf1:5f13%5]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 13:33:54 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Kamal, Asad" <Asad.Kamal@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Ma, Le" <Le.Ma@amd.com>, "Zhang,
 Morris" <Shiwu.Zhang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
Subject: RE: [PATCH] drm/amd/pm: add jpeg/vcn busy to smu_v15_0_8 gpu metrics
Thread-Topic: [PATCH] drm/amd/pm: add jpeg/vcn busy to smu_v15_0_8 gpu metrics
Thread-Index: AQHdDuoTLe9iY2QP7E2lRUrc3XWJybZrepYA
Date: Mon, 13 Jul 2026 13:33:53 +0000
Message-ID: <BN9PR12MB52577BEC0A662AEB9F181977FCFA2@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20260708145649.1587572-1-asad.kamal@amd.com>
In-Reply-To: <20260708145649.1587572-1-asad.kamal@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-13T13:33:36.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|DS2PR12MB9709:EE_
x-ms-office365-filtering-correlation-id: 16a6b4df-1ec0-49ef-ad86-08dee0e361fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|18002099003|22082099003|56012099006|11063799006;
x-microsoft-antispam-message-info: jbP1TQS7Q+x4XSkx+L7poGNpskETix3+TjpiydeCmcp6CQUdSVXDkRn7/cF4tXvEgtEmqsXGGnVe9AC7BisHCP4sqTw15BVMEcC6/pnXSV8ilHe/cz7j/W0QxwCXV1w4TtRQwsIW+naknGaNtXlRfNKuQ3FMXWOG+cIILCUBtGJ0u3MGr52rznuBw77MpuwnKQq98RnQBBuAagJOD4e2wsimN33L/YEpiGLnai/5vaPkFu/OO1spyOyRpxsMOq6jEMTC/KjqEfIrP4ZuMyYPrQUK8PW51dpHM30fqkWis71iq4fAJ1KcyBfFLt/jHhXfbP+x7SJSBAfZLb5dAbmc8cGCU1rKs9tM9FAgLxAqR1fGHAPklu36j2G/6RQN7mJQTGenPmpu80owyF2Pl7Ruol76EEobRf3h8kuT3N2ETI/hGNY4grkmdHaIKc/pR4heYvtieMqJR19oMf7eOWe5mMOFN7FiNqKTpzYGjqe+iFpyTBqfsNeUrTUxCpTSVSQ/4ZTaLORWwFZpQTVSqgptb+dyy4mHvG+P8HLEiWYgbzmqu7ZYCUuX/PN4zCb/PWuRtX2Fda603BXOFVVt0FxoN4VFu0MMQf1DikAMmH+JiY2+/VgqZoykQa7icnVdafqhIaZVDnKznyX0dFUju4u4Wkrw1WzMbA9KjbRcsmfsLw/lPDyvgnQNnWZcIIdk1gv19VArLpHI82UegSxF4E8lEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lzLpzAgNl3MzfxGLUI5XLmZc/vPIzIVSV20FenPr2xqm7mT9J8XCbXWPeK1J?=
 =?us-ascii?Q?62V730a66Rfp423YW2V8vxXMqfD/TCzoV+z6ufidskVMvUmCrdgUEBQD0D58?=
 =?us-ascii?Q?H3Go2oKydHX/G8o36zM4lHydN+Fyl1moM1iXUYCbR3OhqqF51kwXkEJRrd94?=
 =?us-ascii?Q?hGrzTPuBCCkcval0Gk3rUhhtJXLPxckzTrCnxwnXgSpVkDcdkJkfMQN+FxgK?=
 =?us-ascii?Q?59WwQGl3It39gU7ryX+uKN90lmvVpeq0pPG6UfpP033Noev0PLUUK54HaMYl?=
 =?us-ascii?Q?8InA/iUMMQ7MEQmxTTdzJ42pAOMG6PTf1dYuxhT7vxsEjKtenJ0cf1JBYl8A?=
 =?us-ascii?Q?FA6baU5MwDtQdRjnobtgaoR2npzjX3cjJEgKH/lqqwVi3dPsoXphRCX1FsMc?=
 =?us-ascii?Q?BnhrH/3SeMHDl11aJFnjL3D7SYNY3vhftBaH8yPylEEfltb1aiv2Ul2fBPAs?=
 =?us-ascii?Q?OkWvi/LrNbivbzLqOatNhA/8ix6hbb3El/oG8k8EVxJK73PG06e/dSINPouI?=
 =?us-ascii?Q?H2v/qj0n5Xoj5KVK3SdovUouUiRW8vBrhJVpTwa8DT9ClyyVehVrHawYHEvD?=
 =?us-ascii?Q?gqX5IXubXJJDmlnyUTt0tkZaDKUb6D9hGzbq5u+IklrY6rMB0JHoaEHC1jm3?=
 =?us-ascii?Q?vThfKzKwK/qxHvLh0iDee7gJmwjYv/x9KZsXijjRmnICx2n6V+AyygdDVNZC?=
 =?us-ascii?Q?I8K+DH9Q2U1RAAqCSGbC+AJvlijMLEl3RsiisAWJhx2khr9Ew7eMNprYAKLT?=
 =?us-ascii?Q?Jk4l7jOq6D3opToT1RCitg+MYhMJBltAnHG4m7vgYfvIMjGkEuVhpA/AuH1+?=
 =?us-ascii?Q?TuCRejBRO/ujRoD3TBiw9L17KfE9H8hJhRM+WD64po/1vpBhGgabP8rdZvJK?=
 =?us-ascii?Q?KOfTvuQgHyvmzlmS7CxSbFDsPnG/9quiMdEPjD0164xzwvtMtjt+iUtFrKY2?=
 =?us-ascii?Q?YOH35n/OP9cRw95aWhpXeKqBhJqsaZ5+mVR/m78tT3PhBNgIN7Vo4N2hR0JO?=
 =?us-ascii?Q?0/F/q2CLTKucm0zvp1InxV+wO3JNlZtZP2Lf1t1zrOvuKKu8EQj3gVKMS4Dw?=
 =?us-ascii?Q?TTSz2zONSaFvBFpN9eL6XDcyXjtz7ybQxD2mHiQgDtULU1lfN+1/fcA2QWG3?=
 =?us-ascii?Q?ysMG0Rhyp/0eaS1a9qbFyBNdUV423Px7VG/vU9sX3UMvZMgdHa8NJWsCLO03?=
 =?us-ascii?Q?PK625PEfcMvje8YDSdvps3lc4wk5MzqBTiZgNzd1u0DHU7krIqurvBlNX+OA?=
 =?us-ascii?Q?1QHBwIz5fBGsZvT7/tSmswzE+huQAi3JJtQRvPNUkAbcaYEqw7ZkDCOsjB2G?=
 =?us-ascii?Q?x9XqwZr/P3ycIuvzY3CtHPkY7ZQTEvbRJ3y3uVLSt5CNi/fanS85hytt+od3?=
 =?us-ascii?Q?+qYgh86/HK1Z2lJ/zZSwShRntV5aACv4uWt0Dmk/IpuWWcPUCaYqHlJBYeqz?=
 =?us-ascii?Q?pPILXG4QZ3NxuIm9o8DZ50eS7B8HMxYvxkkJzQZ2ZByjuR6hKWSZK29bgW7F?=
 =?us-ascii?Q?D3Ob9C6Kg8+Lo04Ax5CazTFma359+LpmDnbhU/v84xNgC+dqHcOfXRcnv7dP?=
 =?us-ascii?Q?qu5hCjssJKOrBlKVoePKVANglKn8vWBze/7lbUWfi2t0hsKvQP5yEDAxF/1K?=
 =?us-ascii?Q?N1DC6M05Llpf8AR1wxkkeiuVoW83pUKzAEBFKsCaQYMbSI0aUjsqqAw2NS97?=
 =?us-ascii?Q?kIMQ3gpYcOZRZSMC0YBm5sjQTrdPjvjiFH4uAOqs2C9Nsu/T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a6b4df-1ec0-49ef-ad86-08dee0e361fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 13:33:53.9302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nfjWRQGmiDGpi/yM/x1qtSjZj8cb0rClCm7b2FqxGMMVzzvkXllHc/9+CMPQUxcKXXRcmDWG6Y3JvTNwPVR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9709
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Asad.Kamal@amd.com,m:Lijo.Lazar@amd.com,m:Le.Ma@amd.com,m:Shiwu.Zhang@amd.com,m:Alexander.Deucher@amd.com,m:KevinYang.Wang@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,lists.freedesktop.org:from_smtp,amd.com:from_mime,amd.com:email,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,BN9PR12MB5257.namprd12.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD74C74BA42

AMD General

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: Kamal, Asad <Asad.Kamal@amd.com>
Sent: Wednesday, July 8, 2026 10:57 PM
To: amd-gfx@lists.freedesktop.org
Cc: Lazar, Lijo <Lijo.Lazar@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com=
>; Ma, Le <Le.Ma@amd.com>; Zhang, Morris <Shiwu.Zhang@amd.com>; Deucher, Al=
exander <Alexander.Deucher@amd.com>; Wang, Yang(Kevin) <KevinYang.Wang@amd.=
com>; Kamal, Asad <Asad.Kamal@amd.com>
Subject: [PATCH] drm/amd/pm: add jpeg/vcn busy to smu_v15_0_8 gpu metrics

Add jpeg_busy and vcn_busy population to smu_v15_0_8 gpu metrics

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
index 2105a1d7bb34..227cd86e13e8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
@@ -1766,12 +1766,17 @@ static ssize_t smu_v15_0_8_get_gpu_metrics(struct s=
mu_context *smu, void **table
                idx++;
        }

-       /* Per-VCN clocks */
+       /* Per-VCN clocks and busy */
        for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
                inst =3D GET_INST(VCN, i);
                if (inst >=3D 0) {
                        gpu_metrics->current_vclk0[i] =3D SMUQ10_ROUND(metr=
ics->VclkFrequency[inst]);
                        gpu_metrics->current_dclk0[i] =3D SMUQ10_ROUND(metr=
ics->DclkFrequency[inst]);
+                       gpu_metrics->vcn_busy[i] =3D SMUQ10_ROUND(metrics->=
VcnBusy[inst]);
+                       for (j =3D 0; j < NUM_JPEG_RINGS_FW; ++j)
+                               gpu_metrics->jpeg_busy[(i * NUM_JPEG_RINGS_=
FW) + j] =3D
+                                       SMUQ10_ROUND(metrics->JpegBusy[(ins=
t * NUM_JPEG_RINGS_FW)
+                                                                      + j]=
);
                }
        }

--
2.46.0

