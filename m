Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xhc+F1+eOmpXBwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 16:55:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CAB6B8136
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 16:55:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PsvQcrb8;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85D10EB9D;
	Tue, 23 Jun 2026 14:55:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012021.outbound.protection.outlook.com
 [40.107.200.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71CC10EB9D
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 14:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUhMYmYZEsPge+TCSpM2j9aAGO7rr2+agjK4cQuCrQK3WZlnXLB/8I9QTVrvlMg86GfIlwj5g/+JeKQ1u7U1JBOZkUjvvN5wmm6iOoAoeli/OwLs4JtW8aYIaE7Wf1r+mJ5f3sqMzBiaVK9JR6aljoczFeS/fwxG3X/6/c2AV8CGyFZZLaknjj1QAmOM0DJerywPWoesVwSoXN9KJdSm/eiSj+HmZ+3S+1lcYXdePjXx+SNxL8Tq3XWWwV1b2XmOzrWftWqxjNu/2DKSJqZyyLMTxdpPCCSEAql+A2kFQhnWvBEEKCXff5v6XZ892h5EOwaX5h1eiGYyUQ445VDdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zNpganY8X8l+7r/SY/AiYUCZtkwYkT+R1ZniimUtns=;
 b=FbbqM3o5561G28FJF9Jf63iQOUGX7fr/WbzGSlZkljEJFmdJEbqyZ0lBWAP6AJy/mWOS8+AwGEREtNrjBSBytadF4jzCnDLaBKkKtjiInMwM3CRsDI5bSu7xzBjgaJWtL85vOOrlXCYWE71r/lIy7O8PpbdhYxD+MXoG6Z01WUjpi51I2FMqMiP3drvWwJL0+kxatEDdOpTURX2eMO2FDjeM0TwESST3e3yV0cZ9wSq+AoONYeXOQou38oes5h9pjqAgtokpwC38IMN3H3Kxtfu4N54zwWa98WKjDsFU+zNSHBOx6GCfIUr1G/LjwjmzCRD8dUpC7GQy/jqmbrj2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zNpganY8X8l+7r/SY/AiYUCZtkwYkT+R1ZniimUtns=;
 b=PsvQcrb83GTslPruCjRjciWq7LhbrXZSoHsop8QqS9teko0/kluwcP3Kj1tAX0+nian/btTDnuEXVrwfsMggdgMobtujeIm0w+6cO2d98p/HUOM+FSHycLnpAONd5l/+pPfrEZjjiB7tkeO1txDoyM0AjwQLQ3eThparZ/lGesE=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 23 Jun
 2026 14:55:20 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::f3be:26ac:e6fd:16da]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::f3be:26ac:e6fd:16da%4]) with mapi id 15.21.0159.012; Tue, 23 Jun 2026
 14:55:18 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Lin, Amber" <Amber.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
CC: "Lin, Amber" <Amber.Lin@amd.com>
Subject: RE: [PATCH] drm/amdkfd: Add gfx12.0 queue reset support to topology
Thread-Topic: [PATCH] drm/amdkfd: Add gfx12.0 queue reset support to topology
Thread-Index: AQHdAxnZoDBcwrIdRkq4S3xyS910GbZMOkCQ
Date: Tue, 23 Jun 2026 14:55:18 +0000
Message-ID: <CH0PR12MB5372807B21528AC8A15DC3F0F4EE2@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20260623140825.71342-1-amber.lin@amd.com>
In-Reply-To: <20260623140825.71342-1-amber.lin@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-23T14:54:43.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5372:EE_|SA3PR12MB9132:EE_
x-ms-office365-filtering-correlation-id: 6ba4ff0a-2783-44ad-cda1-08ded1377150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: BvgEuO3RXxyT5hnOD5p6kWv5lysiEUQHYDcGqV8Ry5ROxbkwioQJI/i0DyGQZoaESMjRBMPwT9/peryiKj1XPHm9f+WJzS7k35lRNzXjozEZ2sy9+9oyquk0apk6i5q7mY77q9yaBnuWARXrSp9fHqmn2L7WN909wpmovfuhVSKz2CgvEVYpYabv2wlGNDYLgHYDRyxDc4lxjx+Ag8FwQ62sNCRNBsHh1+kVibAXfT9rexKAq7U6tUSY8r/eOd32mmZwuHsg5EnfEdv+j4vXN920g3B55vxWCeq0ZvQxcMNw6Uf1JqXnD7nMvp7x/wa7e96Dm9PkJMV+CQSIAn3Rku6Wo6/HWYqDgqLPzK5oKnvJ8gb2rcM1KLVvz9DJML7qkDaGu3f8fxBISn/lBNHM/B8H4j2vLG3CfhuH4IHsdpHLrBaLlniV4AtKDZAvUe1WLntvLxbjmh4EfZDhYKKbbtP7W1ZVLTgJnWIXn8knHevhtMY36iIdOYbI03MD9y9haVnwmjDgsHS2s19pSRtKuGWxOvZQ1PP+pK3ds7eGkF+/41tbkMbOlumHgeK0aK+9WpeDKs/YeU7KtsO56QX0P54WXyNl5LwH/SYHBbAsybrrYIhwvJ/wkhzn60JL/DphmTGmDKHJDS9FWvIs/WN4VR9U24xbouvjVa07lRagFG9PligaVyQxoCvPy+jsaxB/FXKcmkW/kMBT/JqJV3vYLtdEoPmV3k7upcEpQjK/zOs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TCeCuSJ/pb3agEN38HpwRTil2SpsftBpmbIdc5YuiFFW4j6XI/q5HPyc/Z9j?=
 =?us-ascii?Q?cki5ENeJc9yjvfI4/WK6IdNB2NVSzhNnTGsNbETXYZ5r2GAikjgqPS7hfAVz?=
 =?us-ascii?Q?iZ7Db3fUVow8A/s6pMGAits7PTFsktXYfGlmlNdY5ZHhu5JMHDhJ//tUxZY0?=
 =?us-ascii?Q?ClhY2lSFWl2DeiUARkHPGJHTWYJZrThj69jVw79RvZgXccPIbJG5ECLfiPtu?=
 =?us-ascii?Q?rIGve0C1jMIkoOh9GkH/A2M0ZMUzM659TPky89WeUZPWRrLrSgGClVQfV/mZ?=
 =?us-ascii?Q?vfPrWrLGfhQPs1u68l+V7DC6DUjK5nHziviKPtfnk2OlQ6LQ2L8jWb2rCzAv?=
 =?us-ascii?Q?ei4Mry/IqgpoGHxvcjIleQlAb0a8QEiG7WKTXFT2V2tCfkNL9H7/IVgk+O6p?=
 =?us-ascii?Q?U48qHBpL7PvtiOXLg8beGT5z2Z9yjFpx/TiXK93GoAOtVZ94j4QbcEo7nXwa?=
 =?us-ascii?Q?F9L0bjltGfaj0tyfv+PJlNANVhvGbRmWhmNZO8u7L/n/R/9VBDWl1C6D7IQG?=
 =?us-ascii?Q?y/UV/aOAY2+8tU5SAY98uJkZhyOB+RyfBNRH1pZIDDsRVGFikvZPGK0YwLCN?=
 =?us-ascii?Q?CvIpNHRCIVckap+1oGsct7kFuWbzhjJJ1zJEa++Cy+awqRV2dwTKqzErPVOj?=
 =?us-ascii?Q?YLfhLoNI6ujH8CYxJjjoMTe+jr2ad8qOYYPJdBpHh3v+gNLbYXVWHz4wk5Vz?=
 =?us-ascii?Q?eutd8PJmeuRRpZCBAIsHg1FRPEAILrrg22u1g8j7c1ooYeEEe+btR7FeM2r9?=
 =?us-ascii?Q?9+5eb0yxW9uDj04gVeay6B7+YVk11jiUfd89l6kZ811975mOB7PLebHdAsHZ?=
 =?us-ascii?Q?sG528sCmK04W9LDOaQeZVP6bNQbjGL2/BmDNysCbfjCcYyVd1RLTQ8E1MY8p?=
 =?us-ascii?Q?mZz1Mu3+79Jrz6idx3obI2kryhczy+dZTLWWACqZbI1zKu0qL2KGMvbhETeg?=
 =?us-ascii?Q?tJjbkZBk6BIbW+BRVgiYQZ2+TVt0mO9VJg/hgd4aYHIRIBRmMc++8WCgNHbB?=
 =?us-ascii?Q?qz6jX/2V3/UKavbHHnjj0PxUz37q36JEznCeuYYZFFy3GMa0RruZ3M76paeQ?=
 =?us-ascii?Q?E0xrUkjOBC0maCs3M1eJNDsBUU+SM9oJI72ZIei5wUgC4dhM0AvMBBsuNwyQ?=
 =?us-ascii?Q?ZTUpwe11q5nB9i2N2n4q5O4y/dSrcMibcd7BY/FAgaWIYIYWg7ol9eXXUGuO?=
 =?us-ascii?Q?eXGdoCtZUmysNAcX4UWLkatdN2/dmc2Q7Clx4l2Ijb6xgtNRAliHlifgP1+7?=
 =?us-ascii?Q?RL2Z2D7oGQzWqWhrd5Cje/GYzKpeKGOZg2uUKC2Pn9oHO0tryOtZz8CvUjef?=
 =?us-ascii?Q?krC9YYuzxYrk7HMwm4M/UP6VBRHItPsUY/jfZUt6RYgLK9omXC/IJPE4lGY3?=
 =?us-ascii?Q?ZjTFrc+Ee0+uabaPqt1LLS5QZ4YI7LTBps2t8mr5w861gODH7W2l6BeqKC0Y?=
 =?us-ascii?Q?wpf1BrLTq9JJ/HeuAt/Tg/a4IJkBbC86/wdzr0imLCS5BrIAjmg/N93FVwna?=
 =?us-ascii?Q?kzXJhRK9xw80ugNTBloKHuHrRwQkYoeG9qPNvV9tA7JnSDkinG3UjNDfUQGj?=
 =?us-ascii?Q?+quGKxl6R+VTV7J+nk1XdK2J04MUy9quyZnebf1aimgL985i3yH6G3ZRBhk7?=
 =?us-ascii?Q?TSyYuoAhu7Z4AHWJPgy0Hot8gEYw5AKrHsQ5hekjL0It7hYjL3Qxg0NkcJvk?=
 =?us-ascii?Q?C+2a+G9P0nCg2kbokFCKwEm2TbzgSssqzCuugbb/4TL4SjCh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba4ff0a-2783-44ad-cda1-08ded1377150
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 14:55:18.7330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: la/YsCrMCycA/vysskpP/IiD26EW6tIgmPsJHtil4nS9VyyorLy1fhHEABm43nBFfFxzQuqE53SewFRgMLe6Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
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
	FORGED_RECIPIENTS(0.00)[m:Amber.Lin@amd.com,m:Jesse.Zhang@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Shaoyun.Liu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Shaoyun.Liu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:from_mime,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,CH0PR12MB5372.namprd12.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3CAB6B8136

AMD General

You can add me  as RB

Regards
Shaoyun.liu

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Amber Li=
n
Sent: Tuesday, June 23, 2026 10:08 AM
To: amd-gfx@lists.freedesktop.org; Liu, Shaoyun <Shaoyun.Liu@amd.com>; Zhan=
g, Jesse(Jie) <Jesse.Zhang@amd.com>
Cc: Lin, Amber <Amber.Lin@amd.com>
Subject: [PATCH] drm/amdkfd: Add gfx12.0 queue reset support to topology

This adds queue reset support in KFD topology for gfx12.0.0 and
gfx12.0.1 on non-sriov mode.

Signed-off-by: Amber Lin <amber.lin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_topology.c
index f56b55ef1edd..80f7b14a2e47 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -2020,10 +2020,12 @@ static void kfd_topology_set_capabilities(struct kf=
d_topology_device *dev)
        } else {
                dev->node_props.debug_prop |=3D HSA_DBG_WATCH_ADDR_MASK_LO_=
BIT_GFX10 |
                                        HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
-               /* gfx11 dGPU */
+               /* gfx11 dGPU and gfx12.0 */
                if ((KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, 0) |=
|
                     KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, 2) |=
|
-                    KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, 3)) =
&&
+                    KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, 3) |=
|
+                    KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(12, 0, 0) |=
|
+                    KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(12, 0, 1)) =
&&
                     !amdgpu_sriov_vf(dev->gpu->adev))
                        dev->node_props.capability |=3D HSA_CAP_PER_QUEUE_R=
ESET_SUPPORTED;

--
2.43.0

