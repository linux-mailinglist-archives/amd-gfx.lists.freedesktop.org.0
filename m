Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ppZ0OI5gMWoYiQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 16:41:18 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D59690990
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 16:41:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=urUY4xoD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A9010EC0C;
	Tue, 16 Jun 2026 14:41:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013047.outbound.protection.outlook.com
 [40.107.201.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEFB10EC0C;
 Tue, 16 Jun 2026 14:41:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HddSaEaKaEJlsfoWYX/uMuPczR1/tQ1hB5b6c4vbP3f7oeo6aXdhGnL9iRcsG27k3AXIbc4Mv3vE6Kfvb6mH8KqK5JIU0OKBw6HvjtnwhEY4ToGq0gTLjOcybWbr2iIuq5aQN5aqIHVq9Gq5QVlYzSPJi4qJgZ2aqnlu5upyX0nxUdYhijqQbkZ+Pza/XMAB2Autp0KyiM0wAX+zv9xpivNA+cfYRywpBvmxMBtMiDbyY0yDmVZLsoVi1PDENt/s+nlBgoVPT6A2e4lF8AeO9tFh5kBOoo89BAL1KaWCAsaxMGEjkj5zA5wQWAQ81hfcLouV/14h6VwFFDnMLiL8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+xgDMJQr+4cz+EOPhEsIaA5q5aW2iCnTjmolhQm9yA=;
 b=fxBQa0eFjQUN5r0wj1U51Xna4Mql3mhCJGtW1LBsYx/q00w8bifAXP0pPm4Krq64jd5IEle1iJQmJOhLwBFN+1uzH/SsR9pjQAgh+65DEWJ/DBsaoq3G/pCA8QeOU/Rf/FrRQr1iQzZgVcclPCcumKOWs4J0nbCLDpCW4A7BavOiRTLRWqX31f/NaQ7K8C3uaAr5LyeE64p+5DFVtaJsuX7Kfmq/+rxEGJDmaSu8HVZS0Onc9QsF1k/Usvko614KwH8yBZ5Qf5+qIAIrWS+KVND+etkWseGeWjciF5hOlneL5CwMLWbIuFgFImp4IMvQJtVhljnt341CYn+yBbMTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+xgDMJQr+4cz+EOPhEsIaA5q5aW2iCnTjmolhQm9yA=;
 b=urUY4xoD0nKnTFsrKNXrT0/newM/tOsva54fRDVI89/gkP/j4CnAafdR/vRv580YtNjE/5/QpEitwmaqpzXOCHnHNdyoCwHziENRc+RbRZPuQM+K0ffklxmB6dAFzqaWjuCtrgbdREy29q4K4NiGzh4st0RYxnEq6KAdO96ngJo=
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 14:41:11 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:41:11 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] drm/amdgpu: delay ttm buffer func enablement on
 xgmi
Thread-Topic: [PATCH v1 2/2] drm/amdgpu: delay ttm buffer func enablement on
 xgmi
Thread-Index: AQHc/Y7Wj1SVsR9es0GC9mqRWBonqbZBQOcA
Date: Tue, 16 Jun 2026 14:41:11 +0000
Message-ID: <SA0PR12MB7091079B864676A8379E6B7997E52@SA0PR12MB7091.namprd12.prod.outlook.com>
References: <20260616125040.9977-1-pierre-eric.pelloux-prayer@amd.com>
 <20260616125040.9977-2-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260616125040.9977-2-pierre-eric.pelloux-prayer@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-06-16T14:40:12.0000000Z;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD Public
 v26; MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR12MB7091:EE_|CYYPR12MB8990:EE_
x-ms-office365-filtering-correlation-id: 21b573cf-8060-4cc3-e192-08decbb54f3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|22082099003|18002099003|921020|6133799003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: HP6CiGcbN0MYoxc01M66luNhbZOufPS82uQWhJJB7JukLxKFeQ5pj+5G0+RjWeLAwo9btrm42DS7alTjLUC2UkTOwHBZICYKBJTq60U/ir4BToYjtFWAZqc4wLPlF0kFNRaw3FTa+y/2KJpGaAmGPbikOoxwfta8uqoyjEX0mkbx2H+xIuK9lCxmMnAh3rJoLqQ/E31BUSYAClI8LpcAqcm9bax4uOzaP6kwB0JiZ/jz/ELD/3qOgUT57OvahMkkp90PhY6QWYFI62MSKvY3SsJ0mf+4Uxym/fwnC90rvoFkK/JQG4VtNSPW6hhoBDlvB/RL6igWuS8VWv0jo1cpIBl+hXbF3fo/yg6XedlZFyAjT+QBR/LtAMGY+oRjOSquBhFkw2wx8IIi7PB4qCECqcpBHxfh9tk2q++5ovYcMMtIS/KX1Is8RN4FGKwfgGb27ShZgpqTcDwYo2GpNGPKcx1znWJ0c7YZwb0wHsaIombf24476dqTW5vEOSiv+sCDVJdt26BUb8hxVmVuPj0+TtA4PNcySTxCojmlwMAkL86q6pep0KzO7qyyH3MreTwcXOOokcuVEAFip4vxpolrAYQesvSvuRqJmX95szX/Rk4NnBIOo+ep95Mv2I8iTXL4oOAIZ6C/P0qPnZL41nWQXdmanE9NNYwlcZr1CILvjw0agGZtoMSSOaHp3l1XDz9xintw8oca8rQwTzMXOjfdZXFy6ueRD3nriz9PYXX1y4hRrY8WjASAoFW/rmd4WdRJIS8LtddbPlQi75eP7+MELw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(921020)(6133799003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d35ajrkdk2hUHnntDsPEz10JKM0DSBLcLw7HundCZE2omYEPZVt4QOecPFhe?=
 =?us-ascii?Q?LWD6y1TYJN4TZpLd6j69QRejvPyVVrt+oWlP81biBG/hNiV40BHnvPscxY2Q?=
 =?us-ascii?Q?/4QSADHyRc8cOjdztw8mrO/1OSsMm1CbK4Pqku9+CySCUsyLKCm4NDlcse7G?=
 =?us-ascii?Q?MtQ4XykrFKot3NirmP8k4jt6WJVJ0rUvBF8lYRQXrHQmTFeroZhZvXZOnWPh?=
 =?us-ascii?Q?BfxYVSHEwZhwe3NofgSwhuwo6KryWcJsQUL8JLm1DwVBE0RYHwcQeUMIgGcr?=
 =?us-ascii?Q?8i3CTK5icFzoT6fdP/2/J2t1TBY/80w6oJLVgGuqBwD1lB1ik0SU4HyAbT5J?=
 =?us-ascii?Q?yFGzJUGQRdq7TojvI7BYoMB3Qtj6dkxR1yt/dITvVM5IR+0iFltXZ8oZvDOi?=
 =?us-ascii?Q?VGtQJVG6vHRQP2Y2ALNQLO223p43Zeo6qCiyf3CVeZ4zEPYeWZD0L5C5XEg0?=
 =?us-ascii?Q?iQnK9PHH3FxTofuJJpzyD204/gOEltOng1RU48+CS47ViCiCu0yy59wQtprA?=
 =?us-ascii?Q?NVFrZ50LWsaxJ+b4RP4KBDWq7n9zO/bnQwVBMRUN4Akw2FIkta8V68xXTiNX?=
 =?us-ascii?Q?j6Lsl17pwr5VgEXXmbjzrfO7NAQTPB/clsQIGVmLycBA/Va9AVTI/7u9vvGE?=
 =?us-ascii?Q?1R4LDrm9SxgZ61zTxRh6X6feTOtMdqySuwdJZ45UpauW+k1AI2DmrN28CjPU?=
 =?us-ascii?Q?pa9jy69iGuYwlPD8ZYUpYvsYDJ5BxqDWo4fiF9EKtjigv95k5GUspoo41Uw9?=
 =?us-ascii?Q?mh8aO+5HaE1UKyYCyaRmJvY9W7hRubhayGEkCh8dNfM8RY6d1fJJ0liBtgaV?=
 =?us-ascii?Q?/EctzDK3rkudROW/Tgc+6+EgI+PXRX39766Zxzyo7x3KLK+DKd2wZe+gt15w?=
 =?us-ascii?Q?YohuELVhdSQbFNCHggO5ULEts3qYFzf3l3JnAJ2UuuAH2W1Zn84DVtRKSLvq?=
 =?us-ascii?Q?z0/+X7RF1QVW8tah34qahSJ1EiOjlHg87WoYDoDR279CMnWbQ18QfAk7O22X?=
 =?us-ascii?Q?zKEjXt6E8CfIdPYYNMLLAmMMYLngDUEEQS2Si3TS/gQLe29RWPSjF8MYfRJd?=
 =?us-ascii?Q?EuZh5Qs5CLz73q2AM2YgLQanCmX0EfoDEwpDGVfj2SUYpDnmqo2kNj5Yh4XK?=
 =?us-ascii?Q?kjTcwQTZxxk89a5CduoxmUy+guAphu/G0BShMmU9RvxM9ncPutKvJs+x5at3?=
 =?us-ascii?Q?w3iFrMgpDVA64w2tyAWC9gfF5Rh/ciTEVlWlVx5rmALeGqnPazKuZEE5tcdi?=
 =?us-ascii?Q?eaMSeIFt2ngEOFNpi4zmJMNl9KeuckAxbQiMZBlSIvFu42jKF4HfQqQceGx8?=
 =?us-ascii?Q?xZi/flH3U7AXSqGpzVc0K0QQGT/pCTVEe5cOgAY20QpNRfErWknLDprNJthD?=
 =?us-ascii?Q?NB4NMK1ismFc2IpRk9MMfFoaqj6N1fiWAu+40xvg6/MShaGwcEOEHQedKpDz?=
 =?us-ascii?Q?1mjNm56u/3Bez6TRyhUfIqd0Wyg1+1QJKsK0ImrZaZzzUgPe/evojp0X77Ao?=
 =?us-ascii?Q?ZrD+byR26rOr0hP6OiPzBc78t9e/8WrhpZKRJ0570+lR50jur1wRLwsPA6Vc?=
 =?us-ascii?Q?wfjU8Ob1q+9h+WTpp+rWYQDi+Gd6KBBZh+po4TM9LJh4utaW0RH6vh82ozgN?=
 =?us-ascii?Q?W/AE9D1AsaCdLjrIZ9c8rKghBLPOM90RudxuyXGwVYPT7R9jomAppW9ChtzX?=
 =?us-ascii?Q?o3M6ou3ujQKbwMv5CU3J4Gu1ot6gtVOs8V7vt4sy/Q7ecyDp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b573cf-8060-4cc3-e192-08decbb54f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 14:41:11.1780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gsnXIA6qkFV8tIBLLz6ODr2z/wOlsv67rFLslLux1nQO3pvhVNo1PUX0zarp8ICq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Lijo.Lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,ffwll.ch:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45D59690990

Public

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Pierre-E=
ric Pelloux-Prayer
Sent: Tuesday, June 16, 2026 6:21 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter <sim=
ona@ffwll.ch>; Pelloux-Prayer, Pierre-Eric <Pierre-eric.Pelloux-prayer@amd.=
com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org
Subject: [PATCH v1 2/2] drm/amdgpu: delay ttm buffer func enablement on xgm=
i

When amdgpu_init_minimal_xgmi is used, SDMA engines init is delayed so amdg=
pu_ttm_enable_buffer_funcs must be called later.

Without this, the check for num_buffer_funcs_scheds will fail and using ttm=
 buffer funcs later will fail.

Fixes: 3a5da695c8d1 ("drm/amdgpu: only use working sdma schedulers for ttm"=
)
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.c=
om>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index 57e10afb4714..2e8954fa5c40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2479,7 +2479,8 @@ static int amdgpu_device_ip_init(struct amdgpu_device=
 *adev)
        if (r)
                goto init_failed;

-       amdgpu_ttm_enable_buffer_funcs(adev);
+       if (amdgpu_ip_member_of_hwini(adev, AMD_IP_BLOCK_TYPE_SDMA))
+               amdgpu_ttm_enable_buffer_funcs(adev);

        /* Don't init kfd if whole hive need to be reset during init */
        if (adev->init_lvl->level !=3D AMDGPU_INIT_LEVEL_MINIMAL_XGMI) { di=
ff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_xgmi.c
index faac80a8a6eb..c0dca209335e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -1663,6 +1663,8 @@ static void amdgpu_xgmi_reset_on_init_work(struct wor=
k_struct *work)
                if (r && r !=3D -EHWPOISON)
                        dev_err(tmp_adev->dev,
                                "error during bad page data initialization"=
);
+
+               amdgpu_ttm_enable_buffer_funcs(tmp_adev);

<lijo> This gets enabled in the resume path after xgmi reset. It is not nee=
ded here.

Thanks,
Lijo

        }
 }

--
2.43.0

