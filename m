Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yXzwEaweTWrEvQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:43:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58971D73B
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:43:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=tS7Pgr6R;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552610EE37;
	Tue,  7 Jul 2026 15:43:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013059.outbound.protection.outlook.com
 [40.107.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030CC10EE37
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiSndaQlmKdioqggoTSOHFSDIB0slCHyAdzeCyf2/lkPenC5HEVOWbFuD3diWy9bu4zy/wOeYIlko7yXZRlI6mzhIOTP+vi/vNbI6JRlbcda5Q7d2fwI7rSeeExTqDQtXgFpyKxUrhJeyEKcAHLLXb017eeJput/OhGHp1wbebHrFC/BOQqJstYR8cUG3dRC5IbnUqd5AR696k1LixdEpkIOmPrw3upc9ZND6GnMQtzy0b59LM81Vv3YN+PGk/QB9V6x3kR7IsMD98dHtWry4GEg4fjCYml/fFWkpXK13Z7AcacU4AOqtEFZ4eet3oLVTCTWc3K1Js/xsOtB5kyq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z/XVB4E4GteznAVOlVSaC1anUmkG0amYA8iT8sSLWY=;
 b=SgmlMybX/GWDbgwa6RFYTWzSnopJ1Q2QWbgxMSAiPIHmJV9wRSzvJVBH+idghO4yjHTyWJrtpgLXKsb9htm4dldMW24oXQAdsXhuKxLnfyCOwMI1jfL7w3E2kaSTyI4CqSalESgbYq4yn/5IxJS8sa2NQCATLQnI7AQpXZQnCxJG6XPtQRbZqiGjuJLq1zmwx/ALgnZM8ZTBuu/CxgdPGwAuGSlCav0cbhxrbd7YMx7fZr8gf+Uz2FMTZRCv3nLeV6l2RgKkd0HIFfLBAyi8zWkMIAFvOtOnt6olrMeQhvMRRV3xt7R2/VhQfZBSG0RTLGeJb33RLC/PW/wregIrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z/XVB4E4GteznAVOlVSaC1anUmkG0amYA8iT8sSLWY=;
 b=tS7Pgr6RACV8KHyRistf8uvb+vxnn+8st3zITJX/EObuqcT0Ch4GVMX3E14ptlKnLCswAkk9wz4dHdTfP1qOxdmahCZ66P5RLQBS79QMWyn6cBhQU2/fQoUgjY2cUxPejh9EuWlqP13CV+RVFkd/U0u6/FDqEQIfutiZQ5liLqY=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by CYYPR12MB8963.namprd12.prod.outlook.com (2603:10b6:930:c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 15:43:31 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::1aeb:47e6:faf1:5f13]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::1aeb:47e6:faf1:5f13%5]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 15:43:30 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Sun, Ce(Overlord)" <Ce.Sun@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Chai, Thomas" <YiPeng.Chai@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Yang, Stanley" <Stanley.Yang@amd.com>
Subject: RE: [PATCH 2/2] drm/amdgpu: drop debug_enable_ras_aca debug mask flag
Thread-Topic: [PATCH 2/2] drm/amdgpu: drop debug_enable_ras_aca debug mask flag
Thread-Index: AQHdDhjJ0ePqz5NjoU2J/FhPTNTXcrZiMm5w
Date: Tue, 7 Jul 2026 15:43:30 +0000
Message-ID: <BN9PR12MB52573B7E793296B9CE2586CDFCF02@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20260707135846.1028199-1-cesun102@amd.com>
In-Reply-To: <20260707135846.1028199-1-cesun102@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-07T15:43:10.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|CYYPR12MB8963:EE_
x-ms-office365-filtering-correlation-id: f958727c-4ec2-4f00-ccb0-08dedc3e7ea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: QZav5UZhREDVhOOKUyl1cpzF/DCluMA4FDKbJcEYOE29NRcDfK9JnA4ogbnB0IMByryewaNpNTVMS0Ecieo4TwY5iVgIiYMZZhPWeKvO3XINoYpBXO59nqjK4PCkkZnwo/dNCNWb185vyn/XfuGMA+ZaaSUgSwYKZAFAHScYVtD6kTyyzvuAtIKi4cZXrl/wqEwjtdzlKpEJ3QBF6Va5rrDcKi/U3a4R5OQTn6MWc8iF0fgyhp/mycEDeW5m7LcjvCyhHqTNgKON2cLaI1HnqycKfqdqotkkH8LdO5CbYih5hbUOk0ER6Iz7623b8aLcSJHw29qqNLNx7kw3UKV++5QK8FJrg7tRuhzCHuOEYeOJA8rUDu2RaggoidQtXsYxnoPpIyJ0xtdNEO+VoThluQGp1ZFwPVRHaL5sKV/SNiHDC64JzJqdiBGo5CoBmyU+7wqWCcO/mFzqGkGYgGf5UwXqS1mi6yCNUSjs1iOy2SHxqHZRCGHD8DYM3u/n5q3C+lVGDRIaMVaV8P5IYuZsgEq+bnttmqzxKC/IhNE+yj+l4iqVHHv07xey6LrLiJZW4tn0lg+RNqhTh8EeKiAuS6AjLNE8aD1bWKgOyu1zGekpRA7TGr5szuR9U2HfWE/5ooB++miZ2RQ/EO/5HUewjssXow1cOPpJW8DFzGDli3BUWcHJwDA/biSTLZYf2fc+m0QF4p+dQxHEl4VcwQdU0glc0Yh8oY/1t+KHeUAOPnE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fzG8GrKNwgOtdY3uHQMCsHOQZ7ycz/j6JlGL3DBnR3wQ/8toQd7KPDhQD/mb?=
 =?us-ascii?Q?keFgLRhpX3tEJ1dAyAoB/+lrWxpVPTfxX4rLeLvqygYY8JAIIva5PYgUDfsI?=
 =?us-ascii?Q?F6CjKfiNptWvC73CCYHF9NWqV318bgqf+RF4Zl0Pz4YmVPcRE8trnWJEVb8P?=
 =?us-ascii?Q?iePVgnM8kwpl9Es+g68m8gWC0D+xE5EHt77xzIU+xQd9PRrYYmBcforAXJJN?=
 =?us-ascii?Q?ueqyFyShv6uFMD79fsUocbtEz8Gje23kGdQGGf4+yY79ZNTVtSoCdsJ9jIXS?=
 =?us-ascii?Q?MIPHcLkjCaDqYij8TGTPlg4lStBzfPdQw0n0KbJq0+C+p9BgeuwHbmGIkEUH?=
 =?us-ascii?Q?pAmW4Fshc8C0sjwwjVi8pTDKBWX2P3doN0+i5wu8kxtFRn6L2hetxvACtpQx?=
 =?us-ascii?Q?fIrxJ/l1jab4CJPG/QLELms4MuArI2UFTfbbb12108ZtPRNpefLgJ0NDVL4j?=
 =?us-ascii?Q?lIILAEiGHZgnwFY4hdymaHclMSpjMK0lO+8AVTcPRpO5o4s+8IR/s/2Oopmt?=
 =?us-ascii?Q?LM87pE+NqloTO/4BYsVtVsXujEQcuLMHnIakDEJIkKChzlIIqSr8Ixppmcfj?=
 =?us-ascii?Q?/sGWLjr1TnsW7fWbch0nefNi3+7qKK9ufI7DaOBmpLTV/Whr0TEmFuyzw/IH?=
 =?us-ascii?Q?osk4ZZiNzoxSRZjpCikeypeNXNemifzudT0yYVk+sznmNnh2kTCj5QabCRIl?=
 =?us-ascii?Q?qpYEXb4XgzVXQObTo40aK/05rVw3drQEF73jEWTR6CaK2ZExOwUoOe9WrajL?=
 =?us-ascii?Q?Jv1yfhgvbWlo/sAQ6DcMnR82I/6PDvhj7CUsk+EJTK1JueL5ETabprH/gR5b?=
 =?us-ascii?Q?o8kzXrzn7yJFUegwAay3Rd3LVC3auVTxW6FEbT8EGDDUAL5QvLNJFJD1XJcu?=
 =?us-ascii?Q?GFW6xY4P9VbDjpiT+IOBX920bw6klRjDjP9KyqYBOmw/JvCcxINtEe3jFZ/c?=
 =?us-ascii?Q?uU+1KJ7kTxm2LxGvVGmPnlnl6PwjzxDKupCd4CmrWElX4/n3so8qVGzjOvPf?=
 =?us-ascii?Q?FpE7nDtDrLbxxmaSinWPhb6Z5qqFnNgN3ifH/t4fhqZhMFidCrJk39HV02rS?=
 =?us-ascii?Q?OtP3ygCWU/rLmiOayObnxshwqvMTKa4wLKo9E45fNxqAUhwNAOBBoiWp6oXO?=
 =?us-ascii?Q?yNbNxQAOH7JtQVOjDHyInvFBAss6BLfHJKi0KpcbxxDp0Rolk7fqevmClSwY?=
 =?us-ascii?Q?tIAn/o/k4R2xbSoP0wApMJBgOsaAc+sKQXSgH6MQOONzWGTkQTENvxhI0Ayw?=
 =?us-ascii?Q?7Hvj1T2deFPzihikqgk7jtN4uMSUpuMAzCLaGeOnoJWOIrLec4pGi2oQiqdg?=
 =?us-ascii?Q?9lvcHrMCDeBZA7rAK5xwFoBhrxngV6pYWpYZ/+XIvARmlD1LzjCWxDOIWQG9?=
 =?us-ascii?Q?OhnzB4ZVeHRNOc0vqFcGmFUw+uXFenELrQ940ksORRO28Ks5luvuPtCo5EbR?=
 =?us-ascii?Q?PbquC8niM9oSyydf8GYzaaj8nxYGoikxQpw2N6dXMZa1UngI8/KPAo3pSupU?=
 =?us-ascii?Q?lp6WnmFV+CQJURLLB1GTeG02RmscA9Iov+OM5m1IvNMxFcMIxLfavykUK5WN?=
 =?us-ascii?Q?hxOJfaINnNaRuwil64nhCG+euPbvqvttqf478EJQBMka6sM/W9Za6BkfsER+?=
 =?us-ascii?Q?VDaxd0kn7gT2q+mGvS2XUXkFxnLunbY1RFs/jmSiDxFKtz6ULf15K5kQYFsY?=
 =?us-ascii?Q?P8UGwlnNm53SMCPlM0SLu2vqYr3prk7hGhyESETLUOEe0ojv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f958727c-4ec2-4f00-ccb0-08dedc3e7ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 15:43:30.3808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GzBXtDk1plr6JkqOaEjFOoTz28WtTRLHPAd++1X6LYaN6zbHBrM48v5xYbQmXqSHk8HOKf5qQ8oEpmGAyD7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8963
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Ce.Sun@amd.com,m:YiPeng.Chai@amd.com,m:Tao.Zhou1@amd.com,m:Stanley.Yang@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F58971D73B

AMD General

The patch is

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: Sun, Ce(Overlord) <Ce.Sun@amd.com>
Sent: Tuesday, July 7, 2026 9:59 PM
To: amd-gfx@lists.freedesktop.org
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Chai, Thomas <YiPeng.Chai@amd.c=
om>; Zhou1, Tao <Tao.Zhou1@amd.com>; Yang, Stanley <Stanley.Yang@amd.com>; =
Sun, Ce(Overlord) <Ce.Sun@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: drop debug_enable_ras_aca debug mask flag

drop debug_enable_ras_aca debug mask flag

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 8339ab6f5d32..f5d65bd0ac25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -926,7 +926,6 @@ struct amdgpu_device {
        bool                            debug_largebar;
        bool                            debug_disable_soft_recovery;
        bool                            debug_use_vram_fw_buf;
-       bool                            debug_enable_ras_aca;
        bool                            debug_exp_resets;
        bool                            debug_disable_gpu_ring_reset;
        bool                            debug_vm_userptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index ad631ad31899..5362705143bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -139,7 +139,6 @@ enum AMDGPU_DEBUG_MASK {
        AMDGPU_DEBUG_LARGEBAR =3D BIT(1),
        AMDGPU_DEBUG_DISABLE_GPU_SOFT_RECOVERY =3D BIT(2),
        AMDGPU_DEBUG_USE_VRAM_FW_BUF =3D BIT(3),
-       AMDGPU_DEBUG_ENABLE_RAS_ACA =3D BIT(4),
        AMDGPU_DEBUG_ENABLE_EXP_RESETS =3D BIT(5),
        AMDGPU_DEBUG_DISABLE_GPU_RING_RESET =3D BIT(6),
        AMDGPU_DEBUG_SMU_POOL =3D BIT(7),
@@ -2264,11 +2263,6 @@ static void amdgpu_init_debug_options(struct amdgpu_=
device *adev)
                adev->debug_use_vram_fw_buf =3D true;
        }

-       if (amdgpu_debug_mask & AMDGPU_DEBUG_ENABLE_RAS_ACA) {
-               pr_info("debug: enable RAS ACA\n");
-               adev->debug_enable_ras_aca =3D true;
-       }
-
        if (amdgpu_debug_mask & AMDGPU_DEBUG_ENABLE_EXP_RESETS) {
                pr_info("debug: enable experimental reset features\n");
                adev->debug_exp_resets =3D true;
--
2.34.1

