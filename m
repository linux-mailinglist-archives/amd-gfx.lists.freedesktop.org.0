Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2VGLIm9sPmp8FwkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 14:11:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E3B6CCDBD
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 14:11:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=eODneoE8;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A70510F5AA;
	Fri, 26 Jun 2026 12:11:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9C10F5AA
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 12:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4a/bnl9Yu/9bsXTdNambnkYoUvSbAL4Al+OcTeWL1WkkGEDXScf1Mru9AiQQrLx/sgNwSPUDt291VHnKevS0itf+7KWONcNMsAV/a0Rsdh8YBKpOiiy2PMRJYKS5iClj6QTPqPyDwY0nr3D9c3ViNHXKxLCoYAkU2x0btfadZb3waqh1yOgVHRytbCPGLg2YwVkd2VQTkEn4EDb4zUeLFaXoXPHsez/A8jQ/dISETHBaI0vykFzUTZxsq4zDoDM5CAGYtRa4Sl1D2WNG+q0vfbf0rgOnE7Jl7DXXaIP2RDhxTtsY3MKc5hLyqxa9pBm+MWi+q+ijDLizTcKiSqdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6DdouKz0nqqg3DealPvKiG5VRx62dZXGuV5YLgOAZY=;
 b=rc74PLrWmBssHnG+YwjAOhbJiiLTV//DdkZ5xxYiB2Can9+u0s+lDylBMYrDLdEjzFONHsS6/oZVWFeYGS6Xb9h3pBWeSqxjyg94L9igudZOqBvglQhEgOmuYPg4KuM/F5kouXVm5Bocg/2QqHZ9wecEFJstXJ1J+ptipj6NQ9VmvwJC74nYR3ksFqHliGPZN+N9vgWCadFV/s1a3SybxzLtVsfyt2IPoyFmVlKtI271i+ZimZn5d9XrzE9SNo+06p1of8NbmuT+cQMpymflep4bBE3MgLJW8QR03LeG+YOpLTaSrMqwWJ1lNzmsnJpUC8Xo2CCtGytYxQcbQCKZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6DdouKz0nqqg3DealPvKiG5VRx62dZXGuV5YLgOAZY=;
 b=eODneoE8AzrR8m1duwgYSAf7BImRGesO+uSmy8AQRRLk3btB9+yfjX/6ETvHxQ79vGff40Jy+PmnBPURW/HfximuZOj/v6m0tfWXxli0EKipJKVOKy7YyITrdQ5yaP1JPHsuYmZCnYIJiDOLELssDuqqmFYw7qrQaMzvp7AHSRQ=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 12:11:19 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::1aeb:47e6:faf1:5f13]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::1aeb:47e6:faf1:5f13%5]) with mapi id 15.21.0159.018; Fri, 26 Jun 2026
 12:11:19 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yang, Stanley" <Stanley.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Yang, Stanley" <Stanley.Yang@amd.com>
Subject: RE: [PATCH 1/1] drm/amdgpu/ras: Resum RAS IP hw init during nps
 dynamic switch
Thread-Topic: [PATCH 1/1] drm/amdgpu/ras: Resum RAS IP hw init during nps
 dynamic switch
Thread-Index: AQHdBTv/JV4VeXmGHkOgmg4vFe55S7ZQvu2w
Date: Fri, 26 Jun 2026 12:11:18 +0000
Message-ID: <BN9PR12MB5257C0EB2D89BA6F84479494FCEB2@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20260626071752.192163-1-Stanley.Yang@amd.com>
In-Reply-To: <20260626071752.192163-1-Stanley.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-26T12:09:54.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|CH3PR12MB8583:EE_
x-ms-office365-filtering-correlation-id: 5216ea22-a343-4809-860c-08ded37c079f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|22082099003|18002099003|3023799007|56012099006|6133799003|11063799006;
x-microsoft-antispam-message-info: gyvzK55MtSNlUv5Nnuq/iVXt5qGUvNbrk5JD+aXEoAV7gFforz/KMdTMl0SB9H52/TE+9D2Se8LxytjNdJwg/cZ+YrVlpUXz5oFzobIfbxizfS8zXZlwMJcl8AooFzaoCXH+Wc8GTTdou/INt467A1qI15CkMRZVEVDeKjQrjC4P8BhSqVFzHHhDvP+KCc5yNOmSTdeDCBsSB+vqmF9prSOKMubiYUhNuYPBp2Q96RV7n7DXxdiejhgim2j4FAEJmLMu6ts/IAFUF7meXnnYSobkJnO0Z1QQEFfbCPM7mFVHyp4ulMrIFmlFEd3M8T0esshMQFr2Ab1HVEA8XcAfEAV7FCkXExtnqgl4fd4Hs1X/gy0yOX/1EKxNZGYYYi/GMNmVQScrNnzOdGfpPQAe9rEVz/c/kGFaM8ZnspCWEL6mbPfL9L4OogELeifBWu6gRSO8fUil9Z0GQKRpe+WxaAktgKF77zQoSsm4JEO2njJHsl/F+CebQG0senISdi08bFu67xBUd55l9Ek8o1WyVoVsUpes8nEfNZFXBeTfjlPFOlFkI3ne4FaSX/Y2Gl5SXEKpK/3u+y/NO9cFAzgH6tcrI2LI6t4+mkcajDEbX3p5Nt1C0ToDwFOPSeIrljlk1PG2om1Q6z8dwdqF8fPdkji20f6/IYwO73M6eB50c9h1Aiu0iyTuPX90KqjPEGyGynGCWP0tfEa9voxaxKqL9QszJej1+sXfX4eGU6m9dLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yv73tbqgm09wKASOxOeLSLJ5y7AxPIHZKPavmVDx2BBAA2z6//svQgnMUMN2?=
 =?us-ascii?Q?XcTV4YUOC0vAlthk2yPFeBdaUqNrEV+ovpKGWxaQw4IrSTTvo0emSaXshj9/?=
 =?us-ascii?Q?b7BMpIE8lcbejn9gViNU7Vd/sa6gRPkyPmHz2DF2V6pFw0ZRdYFgNEDXqAtF?=
 =?us-ascii?Q?jLRnYRDRi/PXFvhpmfmGlXmEmXQQmhgI4WzXqZcBPTnflnXhIFzka2sU43Kj?=
 =?us-ascii?Q?+rYnTo+ko0e5y3oo/Y2d4iMElAHUuTYGU+9tgCkMaXVvF5DhpNySQVh8bWZU?=
 =?us-ascii?Q?IFfivuBlQmYZdSsRSlrnmSJz5PrTnZr87bqWoOqb1QuXHLW0w8anHwC6ub/A?=
 =?us-ascii?Q?zSVOp/gb4wD8utWoeVBjEHaSElZmG9MlqlKt/SYe9IanbRFWhbAvf+XkuscV?=
 =?us-ascii?Q?IHce2krTyBkBof7rhoN++NTp9pRhesZC+haxtWJVvKROnH5j2LpNvtxKKKKk?=
 =?us-ascii?Q?/fJ+RjXJeWSr25IAoeq/IJoOrCmYzQkAGOzjzd18UfcQt+OIOxNJM0OyXVM3?=
 =?us-ascii?Q?iEdzgTGGnlZFnpCODr3jFQF8ghD+ajlEkF7u5Qt2NZuzzPbNFkxsCPp64F1u?=
 =?us-ascii?Q?c5XvfpLuo3ErTMT1v42w+OWB/G72tqASodQkq9lws3rybhkfxzcPliFin/Vw?=
 =?us-ascii?Q?nAHHzIrLmtZ5TVywjk0DD8oOGSOEOVfCfOnKfXzmKvaXAHzBpz/SiulSv0rs?=
 =?us-ascii?Q?rE4mrE2cGGmQZB9VXWdccC6/GIwRW1jNUxxvMNu73xcXLNmIAUKvCLaCFZ9v?=
 =?us-ascii?Q?1J1l+cLgISQquYXYLnkB3OhjaUJBtsF+R/+SHxP7jBYFfaJK2fNBZy1AfSsQ?=
 =?us-ascii?Q?zM3LBUybXlLWPdXnNR9hXfl69BCsJ+Sv6vhitRjrFNXHm25NisAe8ND4VNH+?=
 =?us-ascii?Q?NXniCSFFyeUVtJlR2F0jaWkbZ6NNhIIOmI8kk7NyFLB1ttDQ3oHlcDiJ7tAT?=
 =?us-ascii?Q?djaAW7t5L3OSp64pbRChWpAFV/8Bm0/fSCfzUNjxlfpbJBi++1pQI1sO4DPZ?=
 =?us-ascii?Q?GkJpeHxwVgEL+JQCcWb2c60ummK1cmwHfrasBumYVwDeK0J+s9gf1Q+hqKLQ?=
 =?us-ascii?Q?LpTONyOukTpXFU0150V/gwNmhrQPY4+H1U7vChwMxBVHI4vNQgfaZIxzIa+u?=
 =?us-ascii?Q?8tmrlwjmOKcWYZENS9aJEYt52eE3iPcauKNwaAgpImKPUiOgdd8a7FEPrLln?=
 =?us-ascii?Q?Tj0yB4lqIgCXAIxSiL84BGJI+iGejMlVisW4yXxvwdeG7RPvXRhH/zV4VGPo?=
 =?us-ascii?Q?H2kvbOKLzSJrOrXJ3dlLFOE2Sg7sgaLOp95Hg4YraaELzcNvzIm2j+LmoYIR?=
 =?us-ascii?Q?YUaoole+N/myEJureSLyjgtjXqU9KDx1hIzmArTCaPaIUqGn1OSuLtTgXaF/?=
 =?us-ascii?Q?GnWXV9iM4y6cCgPnLBs3TgfMWeeGvyAoJKoal5O+NEpdKpAfBHYZ7hyHG5k0?=
 =?us-ascii?Q?UvqVpK1iVG/YQFa81ygLPYpXnMnHFGqd/yrcxbOAVyo3ZinhOhhooKPsQaw/?=
 =?us-ascii?Q?oeAk/2mCAqOkNd/6Q/0sBkUBRYp+PQGxiMBcncaPpZf9txYdr/tkRWLT9CGK?=
 =?us-ascii?Q?OrCEmit+lVwFmIZqB4WM1T98lD/1WNBv4tVdi+iCdQXmUmAJGV2EItGkVEZ/?=
 =?us-ascii?Q?UmM5zHbw4VE34eA7xE5u3xAOZY2gHahLPzfPN96avFl0dny2OdLuEJMHy/1K?=
 =?us-ascii?Q?BxXmY04EmHbabSGiR1XOS/UUlC3Bs2OgMCr0l8dBfdtOqitr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5216ea22-a343-4809-860c-08ded37c079f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 12:11:18.9833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9uIvMKI7p5w7g3mhgsSQvB61DygC39kZNfpFLxEuBmX3/4RgZOOPyGdeukCvfrn39qnJ04HoCdl4I8JxDrGXSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Stanley.Yang@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,amd.com:dkim,amd.com:email,amd.com:from_mime,BN9PR12MB5257.namprd12.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0E3B6CCDBD

AMD General

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Stanley.=
Yang
Sent: Friday, June 26, 2026 3:18 PM
To: amd-gfx@lists.freedesktop.org
Cc: Yang, Stanley <Stanley.Yang@amd.com>
Subject: [PATCH 1/1] drm/amdgpu/ras: Resum RAS IP hw init during nps dynami=
c switch

On an XGMI reset-on-init (NPS memory patition mode swith), RAS IP hw fini, =
sw fini is called but hw init is skipped due to RAS IP block is not include=
d in hwinit mask, so need call RAS IP hw init during XGMI reset-on-init.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       | 14 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      | 10 +++++++++
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c  | 22 +++++++++++++++++++  ..=
./gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h  |  1 +
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index 7ef7c54ab982..e11c542a01b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -3857,7 +3857,14 @@ int amdgpu_ras_init_badpage_info(struct amdgpu_devic=
e *adev)
        if (!con || amdgpu_sriov_vf(adev))
                return 0;

-       if (amdgpu_uniras_enabled(adev))
+       /*
+        * For the reset-on-init path (e.g. an NPS memory partition,
+        * switch) the RAS IP block hw_init has not been enabled and
+        * the amdgpu_uniras_enabled return false, check amdgpu ras
+        * context uniras_enabled flag, eepron init will be called
+        * during RAS IP block hw_init.
+        */
+       if (amdgpu_uniras_enabled(adev) || con->uniras_enabled)
                return 0;

        control =3D &con->eeprom_control;
@@ -5859,3 +5866,8 @@ void amdgpu_ras_post_reset(struct amdgpu_device *adev=
,
                        amdgpu_ras_mgr_post_reset(tmp_adev);
        }
 }
+
+void amdgpu_ras_resume_after_reset(struct amdgpu_device *adev) {
+       amdgpu_ras_mgr_resume_after_reset(adev);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.h
index a86ab65aa2f0..ad24c7cf8936 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -1045,4 +1045,5 @@ void amdgpu_ras_pre_reset(struct amdgpu_device *adev,
                                          struct list_head *device_list);
 void amdgpu_ras_post_reset(struct amdgpu_device *adev,
                                          struct list_head *device_list);
+void amdgpu_ras_resume_after_reset(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_xgmi.c
index 9a4e8715742a..f175c8987aeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -1669,6 +1669,16 @@ static void amdgpu_xgmi_reset_on_init_work(struct wo=
rk_struct *work)
                if (r && r !=3D -EHWPOISON)
                        dev_err(tmp_adev->dev,
                                "error during bad page data initialization"=
);
+
+               /*
+                * For the reset-on-init path (e.g. an NPS memory partition
+                * switch) the RAS IP block hw_init was skipped under the
+                * minimal init level, so uniras was never enabled. Bring i=
t
+                * up now that the reset domain has been unlocked. This is =
a
+                * no-op for any other reset path where RAS is already
+                * initialized, and for non-uniras devices.
+                */
+               amdgpu_ras_resume_after_reset(tmp_adev);
        }
 }

diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c b/drivers/gpu=
/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
index f627a97797ed..a70e532b3d00 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
@@ -465,6 +465,28 @@ static int amdgpu_ras_mgr_hw_fini(struct amdgpu_ip_blo=
ck *ip_block)
        return 0;
 }

+int amdgpu_ras_mgr_resume_after_reset(struct amdgpu_device *adev) {
+       struct amdgpu_ras *con =3D amdgpu_ras_get_context(adev);
+       struct amdgpu_ras_mgr *ras_mgr =3D amdgpu_ras_mgr_get_context(adev)=
;
+       struct amdgpu_ip_block *ip_block;
+
+       if (!con || !con->uniras_enabled)
+               return 0;
+
+       if (!ras_mgr || !ras_mgr->ras_core)
+               return -EINVAL;
+
+       if (ras_mgr->ras_is_ready)
+               return 0;
+
+       ip_block =3D amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_=
RAS);
+       if (!ip_block)
+               return -EINVAL;
+
+       return amdgpu_ras_mgr_hw_init(ip_block); }
+
 struct amdgpu_ras_mgr *amdgpu_ras_mgr_get_context(struct amdgpu_device *ad=
ev)  {
        if (!adev || !adev->psp.ras_context.ras) diff --git a/drivers/gpu/d=
rm/amd/ras/ras_mgr/amdgpu_ras_mgr.h b/drivers/gpu/drm/amd/ras/ras_mgr/amdgp=
u_ras_mgr.h
index 4f44a917d48b..3f80b9f1f0ac 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
@@ -82,6 +82,7 @@ int amdgpu_ras_mgr_handle_ras_cmd(struct amdgpu_device *a=
dev,
                void *output, uint32_t out_size);
 int amdgpu_ras_mgr_pre_reset(struct amdgpu_device *adev);  int amdgpu_ras_=
mgr_post_reset(struct amdgpu_device *adev);
+int amdgpu_ras_mgr_resume_after_reset(struct amdgpu_device *adev);
 int amdgpu_ras_mgr_lookup_bad_pages_in_a_row(struct amdgpu_device *adev,
                uint64_t addr, uint64_t *nps_page_addr, uint32_t max_page_c=
ount);  #endif
--
2.43.0

