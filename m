Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F55060FC9B
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Oct 2022 18:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075BE10E0BF;
	Thu, 27 Oct 2022 16:04:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8310E0BF
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Oct 2022 16:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL6DuQw6e0NPAJnDGwabiapL1GbWVkZVNXbR0ET6gmCJNjpCgNVqu+UO4wIZ/jTpF8jDUCkteT9WGlAtWkNaPi0fi7On9MYBkZ5Zsi1DId8JaI+8acbqJYBls/GLRLzJOQePmTOD1mxmPssRjewbmvDXLscY7MM6HkxnTujW1+9FOMfbah63SWAOWA+nnTPDdlMU++Zs5rJCjFqCV76gpaw3Blc29MKtSMNaV3C3lf5OLko+6hzKtf+qGcc4W/17bo1FAJDjNSzFL+XsHBfocOJaIPAOhOD9keGZS/M8SIdFMurg3dS+k1yLzvCM7aHzVWbXFkiLiST6sLFuVSyaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+66Ml40IEQDPkHJYjeAb3SVURXUNc/Setxf4PvmfHno=;
 b=Wsq057h2ahmetZb2krfFmSQ0/hOguvAJlj35T0OsARY9s2AeTJfzZa/E/oWNLacoLOTNieV7LM4RFztdmoVIHCGOGmkfhKiu4amQ2KmvgsGsixtBUi++gQn7bpWizr4IMeQ9sgKjKhcUKNA9857SqXs4o7fMtbeLmpVQVKLfTUThhOBXdqIFjVRNuc5G3FMuSamd2WYxM6ACsVOOAw6aKG3Nc3/gghXuxeOjfT/pT3TwtiL9yQFHf5CzKwBlW/Y6JuWUDOuPHJoE7vTTyWj3LNDt9iSDcrURtSoQ/1Tzb0HJO9lCDZlgrkD0mZie/y5vhLCXDnoO4Rz3zjntIrWX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+66Ml40IEQDPkHJYjeAb3SVURXUNc/Setxf4PvmfHno=;
 b=aIjvSoX2aEETpkb5CpjJKFEIR1XYjCpXcK5h2NsDcp1+yDts4xSS2iP5zseeS0vPs1IqlWanfxxPN4leR9PE55i9FDDWQ8X6JYQxHiQFPFX6OTtUS7v69ygGXX4tMEW7ui6ZWoRTTxvwjX1A5kJ40+shcsMtOQyIoUqlTZy8iY0=
Received: from CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.27; Thu, 27 Oct 2022 16:04:12 +0000
Received: from CY8PR12MB7099.namprd12.prod.outlook.com
 ([fe80::905d:6b27:ab75:97e3]) by CY8PR12MB7099.namprd12.prod.outlook.com
 ([fe80::905d:6b27:ab75:97e3%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 16:04:12 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "Sider, Graham" <Graham.Sider@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: update GFX11 CWSR trap handler
Thread-Topic: [PATCH] drm/amdkfd: update GFX11 CWSR trap handler
Thread-Index: AQHY6X7ATnYQDQd0kkyQE95U6Xxgu64iaGyA
Date: Thu, 27 Oct 2022 16:04:12 +0000
Message-ID: <CY8PR12MB70999F59866C231DBE3F94668C339@CY8PR12MB7099.namprd12.prod.outlook.com>
References: <20221026210503.1007781-1-Graham.Sider@amd.com>
In-Reply-To: <20221026210503.1007781-1-Graham.Sider@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-27T16:04:10Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=9f30c8f3-7831-4a24-bdca-7d941c428c73;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7099:EE_|DM4PR12MB6351:EE_
x-ms-office365-filtering-correlation-id: 64992699-e804-4d25-ea4f-08dab834e3db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jwxDOKvM6Uk7KxOvJuu3cvRcYjoknIl/q60z7jrCC86R1aoZoXnFlX2ePbIoUqh0jgZ3iy3Hp7snoJRVHZsYuo4IXc/rwRmbG/tSsHJfcp/80v/B9lvW7+0T/zm7pAEIxXRwxq3u69Z5do4DsR7Tw79qcPPSKFlTKzuNCEogriYbXvBqpFnRMTEqUWRVieV+5LKFU+6ajDyZ4qMpbS5t3iOeKByCkRf51RV6kzbZ1O3Ia7zsi3Njra3xCfwwg3koEHxaGVEC6W5HRFEys/t6p2yIYZ4ko7pVCC30r7qXYpd0C7VzoFwrLdVO5/BOw5UiMy8swKJ7W6jSIIZdF63/fRs1wwqLQvW6ERSO3Su9va+jdcWG6ptApmOZTnMbzGxL2RbmpbawOs2l3ubKVkan7o24yiFFhgFW+S4uhpwSzblqyI34roBR1WyoldQ7PaJfGJ15dGhPzUmE/9+S1Kpin/Cn6rGLGJ6ZV3j9NEwT0nMDtD3UiJLurwqNOsmGCzHQG7otL76qxRjhLvDNQBHruuN6NbIoJB8ZBkebM/PUn0zIFgrGYmYTfeqUv3DdmhXy5SdkzIu9vhoVJX4cWKqOuZhJwxmO9ZytNU1Jjq3UC51jzSH0Bv89EhYa5N/AD0ZMDG9/UpXiltOdjnQGrMEnFyJmuoLEBwrc/aqfseAKiQHFvXnyWhnjqPl0S3JxvM1H2i2u/GdVX5oPMSJT1smcuuD6b8XclNjjToBD6yqmN51z5pPei1fyDTrQ8qBbkHWmv+jksMo0oCfwc3D6ICc11g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7099.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(71200400001)(8676002)(316002)(38070700005)(110136005)(186003)(83380400001)(54906003)(38100700002)(6506007)(9686003)(26005)(53546011)(41300700001)(122000001)(8936002)(15650500001)(478600001)(5660300002)(7696005)(86362001)(52536014)(76116006)(66556008)(33656002)(55016003)(2906002)(66946007)(30864003)(4326008)(66446008)(66476007)(64756008)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZDmmNfa48P0kQGS5e3SNulGry1Gctdrco1Xc2Y6uGxPo+rQW5YVp8mYcUOPG?=
 =?us-ascii?Q?4pmiyV9Z7xizqCyjXfPrNh2+Y61JlN/TFYCnGD8naMiFMv8GqS9Scv3nYQOi?=
 =?us-ascii?Q?iJTBAcaq/Q6osdvYIXn1prRP02yMSqjAs7ezmjg12WjHyNEO8kfmtjsVse0M?=
 =?us-ascii?Q?5awIN6ctjiRtNnQ+rz7Y73B1WyaxeBguwdfyiVbn+iKVmuaqE+8IcVpxIcmY?=
 =?us-ascii?Q?mdXU/kppld1bpo5MIBNODeb5bvFWXwYOWLHBlJAAT4HGxS5hvtPT/LLJq8L3?=
 =?us-ascii?Q?JltA2+639OizS1Qv4ee+w7TbvisjGFrEgTbhMdGsHAAdcjVS6WK7o/BTBSNH?=
 =?us-ascii?Q?UOGzi5KOemkVN8e1LDg6lD7+/MrTsHqs9cuSncKT4pzAiD0TnhrscCLinHix?=
 =?us-ascii?Q?V7Uym/XP53uT1VXoCjid4ZZDnQTy1eu1XcWvdWIZVh5TJeoC4N8mw5a82b5o?=
 =?us-ascii?Q?kPZTZBG4JJx7gOxACLeZttSAROB4AzffYw9A21ZjZDco+V8dlawy1S8HFg8u?=
 =?us-ascii?Q?U+TdmtTRlKwJsd+Nx178zGGo/FyhKJxunsJ9ZfclsB2cVNTRwLtQxdzc7qOX?=
 =?us-ascii?Q?D+enpYQvrGaWPuwFPl/Bwjrp24XZWAKxB4u4h/bOqsXdn8mjYS0QRNiXK36m?=
 =?us-ascii?Q?0gmhG97Ri2I0WIU1SAkpOxvtEzJoEsFL42X6INLdXGYedYzSqAEeCcMwfG1G?=
 =?us-ascii?Q?/3EJxaCVbPCFJIucKOOsXZJTkkRmlS1S26HBasOy9tZ6UKIgji9IfYVaA7RB?=
 =?us-ascii?Q?ah9WSiG8Vi6BhBsgxJfOztyURHKycGtxJ4jqNNAMFqXLv0BbRRT234Pb0yS4?=
 =?us-ascii?Q?pyNmlLSeKW5IP5XbNvre/3Nvb8/Ogx2WPUdj1yWXCUTfjM0Wh7B+wE698FhO?=
 =?us-ascii?Q?2N6Lmh1WqziUd9Rr2JEuQHfoLvMX+zDYR8u038JOH3nh480V/KcXkvhdQmXq?=
 =?us-ascii?Q?gPLbXVW1ho3fIO7CO1z3jliFs5gcSH7OHDabywY/5yCAOS0yddRFVD4HtJss?=
 =?us-ascii?Q?8KXBANPb/Ch7+wtySJ01D8jD+ji9+QjgEOd+PuD1FkJzPVsI0HkE4KJVOpNt?=
 =?us-ascii?Q?aXPPlawKKMfgSDZXGvf5AAlrJt3I09JiSvPg/eEAmmVaEQw/ZR3paXnxDmm6?=
 =?us-ascii?Q?mmyIVaJRyCy8XVRWexu/fRCmnO90Bey60iWkapLwimgZ4wkIzvgXk97pIzCk?=
 =?us-ascii?Q?jTzHGtcoJfICkDnHOVKKkPn6KtRIvkb3dZQ6p8QW0+M83rMhuj5x9Mu/qdK0?=
 =?us-ascii?Q?U8kfBJY0SxdrZCg9EfVSB92RGSwzVFbpAsgQS69UdXTI00VPRcKDmLpAbRGy?=
 =?us-ascii?Q?5TZrF6D83WRjMpyvSCp4jn6Ujiukh8R9DAUtZUdCN3XRALLah/pyWh9RepA9?=
 =?us-ascii?Q?wKcTuyZiPj0wxAcT68BtGnQD2plTnA+yR5e3K/Gqdn3h4fkksDBciG0srT7B?=
 =?us-ascii?Q?5GIjtIWfx25SzpopDr/uSGCQT3KRV/ixfMH4FJqiAKqa1wQvkpTphaHqOKJb?=
 =?us-ascii?Q?kAU0ygzrMXVUWhFQaBh43OaSR/XmABW8y11hf70gaMs7VpdRuFChdZ/jaFKL?=
 =?us-ascii?Q?BKB52/1xFrN/kvSi5v4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7099.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64992699-e804-4d25-ea4f-08dab834e3db
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 16:04:12.6840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CW6hfUt8jCgOHbXMeZDh0hwmoGUExvL/6BIdhOaQ9rVqnXx3v5qQxlsKguU4RfjdZ/OjUrFC7SJszK+5dDEteA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Cornwall,
 Jay" <Jay.Cornwall@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Acked-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

-----Original Message-----
From: Sider, Graham <Graham.Sider@amd.com>=20
Sent: Wednesday, October 26, 2022 5:05 PM
To: amd-gfx@lists.freedesktop.org
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Kasiviswanathan, Harish <Hari=
sh.Kasiviswanathan@amd.com>; Cornwall, Jay <Jay.Cornwall@amd.com>; Sider, G=
raham <Graham.Sider@amd.com>
Subject: [PATCH] drm/amdkfd: update GFX11 CWSR trap handler

From: Jay Cornwall <jay.cornwall@amd.com>

With corresponding FW change fixes issue where triggering CWSR on a workgro=
up with waves in s_barrier wouldn't lead to a back-off and therefore cause =
a hang.

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Tested-by: Graham Sider <Graham.Sider@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 764 +++++++++---------
 .../amd/amdkfd/cwsr_trap_handler_gfx10.asm    |   6 +
 2 files changed, 389 insertions(+), 381 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/d=
rm/amd/amdkfd/cwsr_trap_handler.h
index c7118843db05..0c4c5499bb5c 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -2495,442 +2495,444 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {
 	0xbf9f0000, 0x00000000,
 };
 static const uint32_t cwsr_trap_gfx11_hex[] =3D {
-	0xbfa00001, 0xbfa0021e,
+	0xbfa00001, 0xbfa00221,
 	0xb0804006, 0xb8f8f802,
 	0x9178ff78, 0x00020006,
-	0xb8fbf803, 0xbf0d9f6d,
-	0xbfa20006, 0x8b6eff78,
-	0x00002000, 0xbfa10009,
-	0x8b6eff6d, 0x00ff0000,
-	0xbfa2001e, 0x8b6eff7b,
-	0x00000400, 0xbfa20041,
-	0xbf830010, 0xb8fbf803,
-	0xbfa0fffa, 0x8b6eff7b,
-	0x00000900, 0xbfa20015,
-	0x8b6eff7b, 0x000071ff,
-	0xbfa10008, 0x8b6fff7b,
-	0x00007080, 0xbfa10001,
-	0xbeee1287, 0xb8eff801,
-	0x846e8c6e, 0x8b6e6f6e,
-	0xbfa2000a, 0x8b6eff6d,
-	0x00ff0000, 0xbfa20007,
-	0xb8eef801, 0x8b6eff6e,
-	0x00000800, 0xbfa20003,
+	0xb8fbf803, 0xbf0d9e6d,
+	0xbfa10001, 0xbfbd0000,
+	0xbf0d9f6d, 0xbfa20006,
+	0x8b6eff78, 0x00002000,
+	0xbfa10009, 0x8b6eff6d,
+	0x00ff0000, 0xbfa2001e,
 	0x8b6eff7b, 0x00000400,
-	0xbfa20026, 0xbefa4d82,
-	0xbf89fc07, 0x84fa887a,
-	0xf4005bbd, 0xf8000010,
-	0xbf89fc07, 0x846e976e,
-	0x9177ff77, 0x00800000,
-	0x8c776e77, 0xf4045bbd,
-	0xf8000000, 0xbf89fc07,
-	0xf4045ebd, 0xf8000008,
-	0xbf89fc07, 0x8bee6e6e,
-	0xbfa10001, 0xbe80486e,
-	0x8b6eff6d, 0x01ff0000,
-	0xbfa20005, 0x8c78ff78,
-	0x00002000, 0x80ec886c,
-	0x82ed806d, 0xbfa00005,
-	0x8b6eff6d, 0x01000000,
-	0xbfa20002, 0x806c846c,
-	0x826d806d, 0x8b6dff6d,
-	0x0000ffff, 0x8bfe7e7e,
-	0x8bea6a6a, 0xb978f802,
-	0xbe804a6c, 0x8b6dff6d,
-	0x0000ffff, 0xbefa0080,
-	0xb97a0283, 0xbeee007e,
-	0xbeef007f, 0xbefe0180,
-	0xbefe4d84, 0xbf89fc07,
-	0x8b7aff7f, 0x04000000,
-	0x847a857a, 0x8c6d7a6d,
-	0xbefa007e, 0x8b7bff7f,
-	0x0000ffff, 0xbefe00c1,
-	0xbeff00c1, 0xdca6c000,
-	0x007a0000, 0x7e000280,
-	0xbefe007a, 0xbeff007b,
-	0xb8fb02dc, 0x847b997b,
-	0xb8fa3b05, 0x807a817a,
-	0xbf0d997b, 0xbfa20002,
-	0x847a897a, 0xbfa00001,
-	0x847a8a7a, 0xb8fb1e06,
-	0x847b8a7b, 0x807a7b7a,
+	0xbfa20041, 0xbf830010,
+	0xb8fbf803, 0xbfa0fffa,
+	0x8b6eff7b, 0x00000900,
+	0xbfa20015, 0x8b6eff7b,
+	0x000071ff, 0xbfa10008,
+	0x8b6fff7b, 0x00007080,
+	0xbfa10001, 0xbeee1287,
+	0xb8eff801, 0x846e8c6e,
+	0x8b6e6f6e, 0xbfa2000a,
+	0x8b6eff6d, 0x00ff0000,
+	0xbfa20007, 0xb8eef801,
+	0x8b6eff6e, 0x00000800,
+	0xbfa20003, 0x8b6eff7b,
+	0x00000400, 0xbfa20026,
+	0xbefa4d82, 0xbf89fc07,
+	0x84fa887a, 0xf4005bbd,
+	0xf8000010, 0xbf89fc07,
+	0x846e976e, 0x9177ff77,
+	0x00800000, 0x8c776e77,
+	0xf4045bbd, 0xf8000000,
+	0xbf89fc07, 0xf4045ebd,
+	0xf8000008, 0xbf89fc07,
+	0x8bee6e6e, 0xbfa10001,
+	0xbe80486e, 0x8b6eff6d,
+	0x01ff0000, 0xbfa20005,
+	0x8c78ff78, 0x00002000,
+	0x80ec886c, 0x82ed806d,
+	0xbfa00005, 0x8b6eff6d,
+	0x01000000, 0xbfa20002,
+	0x806c846c, 0x826d806d,
+	0x8b6dff6d, 0x0000ffff,
+	0x8bfe7e7e, 0x8bea6a6a,
+	0xb978f802, 0xbe804a6c,
+	0x8b6dff6d, 0x0000ffff,
+	0xbefa0080, 0xb97a0283,
+	0xbeee007e, 0xbeef007f,
+	0xbefe0180, 0xbefe4d84,
+	0xbf89fc07, 0x8b7aff7f,
+	0x04000000, 0x847a857a,
+	0x8c6d7a6d, 0xbefa007e,
 	0x8b7bff7f, 0x0000ffff,
-	0x807aff7a, 0x00000200,
-	0x807a7e7a, 0x827b807b,
-	0xd7610000, 0x00010870,
-	0xd7610000, 0x00010a71,
-	0xd7610000, 0x00010c72,
-	0xd7610000, 0x00010e73,
-	0xd7610000, 0x00011074,
-	0xd7610000, 0x00011275,
-	0xd7610000, 0x00011476,
-	0xd7610000, 0x00011677,
-	0xd7610000, 0x00011a79,
-	0xd7610000, 0x00011c7e,
-	0xd7610000, 0x00011e7f,
-	0xbefe00ff, 0x00003fff,
-	0xbeff0080, 0xdca6c040,
-	0x007a0000, 0xd760007a,
-	0x00011d00, 0xd760007b,
-	0x00011f00, 0xbefe007a,
-	0xbeff007b, 0xbef4007e,
-	0x8b75ff7f, 0x0000ffff,
-	0x8c75ff75, 0x00040000,
-	0xbef60080, 0xbef700ff,
-	0x10807fac, 0xbef1007d,
-	0xbef00080, 0xb8f302dc,
-	0x84739973, 0xbefe00c1,
-	0x857d9973, 0x8b7d817d,
-	0xbf06817d, 0xbfa20002,
-	0xbeff0080, 0xbfa00002,
-	0xbeff00c1, 0xbfa00009,
+	0xbefe00c1, 0xbeff00c1,
+	0xdca6c000, 0x007a0000,
+	0x7e000280, 0xbefe007a,
+	0xbeff007b, 0xb8fb02dc,
+	0x847b997b, 0xb8fa3b05,
+	0x807a817a, 0xbf0d997b,
+	0xbfa20002, 0x847a897a,
+	0xbfa00001, 0x847a8a7a,
+	0xb8fb1e06, 0x847b8a7b,
+	0x807a7b7a, 0x8b7bff7f,
+	0x0000ffff, 0x807aff7a,
+	0x00000200, 0x807a7e7a,
+	0x827b807b, 0xd7610000,
+	0x00010870, 0xd7610000,
+	0x00010a71, 0xd7610000,
+	0x00010c72, 0xd7610000,
+	0x00010e73, 0xd7610000,
+	0x00011074, 0xd7610000,
+	0x00011275, 0xd7610000,
+	0x00011476, 0xd7610000,
+	0x00011677, 0xd7610000,
+	0x00011a79, 0xd7610000,
+	0x00011c7e, 0xd7610000,
+	0x00011e7f, 0xbefe00ff,
+	0x00003fff, 0xbeff0080,
+	0xdca6c040, 0x007a0000,
+	0xd760007a, 0x00011d00,
+	0xd760007b, 0x00011f00,
+	0xbefe007a, 0xbeff007b,
+	0xbef4007e, 0x8b75ff7f,
+	0x0000ffff, 0x8c75ff75,
+	0x00040000, 0xbef60080,
+	0xbef700ff, 0x10807fac,
+	0xbef1007d, 0xbef00080,
+	0xb8f302dc, 0x84739973,
+	0xbefe00c1, 0x857d9973,
+	0x8b7d817d, 0xbf06817d,
+	0xbfa20002, 0xbeff0080,
+	0xbfa00002, 0xbeff00c1,
+	0xbfa00009, 0xbef600ff,
+	0x01000000, 0xe0685080,
+	0x701d0100, 0xe0685100,
+	0x701d0200, 0xe0685180,
+	0x701d0300, 0xbfa00008,
 	0xbef600ff, 0x01000000,
-	0xe0685080, 0x701d0100,
-	0xe0685100, 0x701d0200,
-	0xe0685180, 0x701d0300,
-	0xbfa00008, 0xbef600ff,
-	0x01000000, 0xe0685100,
-	0x701d0100, 0xe0685200,
-	0x701d0200, 0xe0685300,
-	0x701d0300, 0xb8f03b05,
-	0x80708170, 0xbf0d9973,
-	0xbfa20002, 0x84708970,
-	0xbfa00001, 0x84708a70,
-	0xb8fa1e06, 0x847a8a7a,
-	0x80707a70, 0x8070ff70,
-	0x00000200, 0xbef600ff,
-	0x01000000, 0x7e000280,
-	0x7e020280, 0x7e040280,
-	0xbefd0080, 0xd7610002,
-	0x0000fa71, 0x807d817d,
-	0xd7610002, 0x0000fa6c,
-	0x807d817d, 0x917aff6d,
-	0x80000000, 0xd7610002,
-	0x0000fa7a, 0x807d817d,
-	0xd7610002, 0x0000fa6e,
-	0x807d817d, 0xd7610002,
-	0x0000fa6f, 0x807d817d,
-	0xd7610002, 0x0000fa78,
-	0x807d817d, 0xb8faf803,
-	0xd7610002, 0x0000fa7a,
-	0x807d817d, 0xd7610002,
-	0x0000fa7b, 0x807d817d,
-	0xb8f1f801, 0xd7610002,
-	0x0000fa71, 0x807d817d,
-	0xb8f1f814, 0xd7610002,
-	0x0000fa71, 0x807d817d,
-	0xb8f1f815, 0xd7610002,
-	0x0000fa71, 0x807d817d,
-	0xbefe00ff, 0x0000ffff,
-	0xbeff0080, 0xe0685000,
-	0x701d0200, 0xbefe00c1,
+	0xe0685100, 0x701d0100,
+	0xe0685200, 0x701d0200,
+	0xe0685300, 0x701d0300,
 	0xb8f03b05, 0x80708170,
 	0xbf0d9973, 0xbfa20002,
 	0x84708970, 0xbfa00001,
 	0x84708a70, 0xb8fa1e06,
 	0x847a8a7a, 0x80707a70,
+	0x8070ff70, 0x00000200,
 	0xbef600ff, 0x01000000,
-	0xbef90080, 0xbefd0080,
-	0xbf800000, 0xbe804100,
-	0xbe824102, 0xbe844104,
-	0xbe864106, 0xbe884108,
-	0xbe8a410a, 0xbe8c410c,
-	0xbe8e410e, 0xd7610002,
-	0x0000f200, 0x80798179,
-	0xd7610002, 0x0000f201,
+	0x7e000280, 0x7e020280,
+	0x7e040280, 0xbefd0080,
+	0xd7610002, 0x0000fa71,
+	0x807d817d, 0xd7610002,
+	0x0000fa6c, 0x807d817d,
+	0x917aff6d, 0x80000000,
+	0xd7610002, 0x0000fa7a,
+	0x807d817d, 0xd7610002,
+	0x0000fa6e, 0x807d817d,
+	0xd7610002, 0x0000fa6f,
+	0x807d817d, 0xd7610002,
+	0x0000fa78, 0x807d817d,
+	0xb8faf803, 0xd7610002,
+	0x0000fa7a, 0x807d817d,
+	0xd7610002, 0x0000fa7b,
+	0x807d817d, 0xb8f1f801,
+	0xd7610002, 0x0000fa71,
+	0x807d817d, 0xb8f1f814,
+	0xd7610002, 0x0000fa71,
+	0x807d817d, 0xb8f1f815,
+	0xd7610002, 0x0000fa71,
+	0x807d817d, 0xbefe00ff,
+	0x0000ffff, 0xbeff0080,
+	0xe0685000, 0x701d0200,
+	0xbefe00c1, 0xb8f03b05,
+	0x80708170, 0xbf0d9973,
+	0xbfa20002, 0x84708970,
+	0xbfa00001, 0x84708a70,
+	0xb8fa1e06, 0x847a8a7a,
+	0x80707a70, 0xbef600ff,
+	0x01000000, 0xbef90080,
+	0xbefd0080, 0xbf800000,
+	0xbe804100, 0xbe824102,
+	0xbe844104, 0xbe864106,
+	0xbe884108, 0xbe8a410a,
+	0xbe8c410c, 0xbe8e410e,
+	0xd7610002, 0x0000f200,
 	0x80798179, 0xd7610002,
-	0x0000f202, 0x80798179,
-	0xd7610002, 0x0000f203,
+	0x0000f201, 0x80798179,
+	0xd7610002, 0x0000f202,
 	0x80798179, 0xd7610002,
-	0x0000f204, 0x80798179,
-	0xd7610002, 0x0000f205,
+	0x0000f203, 0x80798179,
+	0xd7610002, 0x0000f204,
 	0x80798179, 0xd7610002,
-	0x0000f206, 0x80798179,
-	0xd7610002, 0x0000f207,
+	0x0000f205, 0x80798179,
+	0xd7610002, 0x0000f206,
 	0x80798179, 0xd7610002,
-	0x0000f208, 0x80798179,
-	0xd7610002, 0x0000f209,
+	0x0000f207, 0x80798179,
+	0xd7610002, 0x0000f208,
 	0x80798179, 0xd7610002,
-	0x0000f20a, 0x80798179,
-	0xd7610002, 0x0000f20b,
+	0x0000f209, 0x80798179,
+	0xd7610002, 0x0000f20a,
 	0x80798179, 0xd7610002,
-	0x0000f20c, 0x80798179,
-	0xd7610002, 0x0000f20d,
+	0x0000f20b, 0x80798179,
+	0xd7610002, 0x0000f20c,
 	0x80798179, 0xd7610002,
-	0x0000f20e, 0x80798179,
-	0xd7610002, 0x0000f20f,
-	0x80798179, 0xbf06a079,
-	0xbfa10006, 0xe0685000,
-	0x701d0200, 0x8070ff70,
-	0x00000080, 0xbef90080,
-	0x7e040280, 0x807d907d,
-	0xbf0aff7d, 0x00000060,
-	0xbfa2ffbc, 0xbe804100,
-	0xbe824102, 0xbe844104,
-	0xbe864106, 0xbe884108,
-	0xbe8a410a, 0xd7610002,
-	0x0000f200, 0x80798179,
-	0xd7610002, 0x0000f201,
+	0x0000f20d, 0x80798179,
+	0xd7610002, 0x0000f20e,
 	0x80798179, 0xd7610002,
-	0x0000f202, 0x80798179,
-	0xd7610002, 0x0000f203,
+	0x0000f20f, 0x80798179,
+	0xbf06a079, 0xbfa10006,
+	0xe0685000, 0x701d0200,
+	0x8070ff70, 0x00000080,
+	0xbef90080, 0x7e040280,
+	0x807d907d, 0xbf0aff7d,
+	0x00000060, 0xbfa2ffbc,
+	0xbe804100, 0xbe824102,
+	0xbe844104, 0xbe864106,
+	0xbe884108, 0xbe8a410a,
+	0xd7610002, 0x0000f200,
 	0x80798179, 0xd7610002,
-	0x0000f204, 0x80798179,
-	0xd7610002, 0x0000f205,
+	0x0000f201, 0x80798179,
+	0xd7610002, 0x0000f202,
 	0x80798179, 0xd7610002,
-	0x0000f206, 0x80798179,
-	0xd7610002, 0x0000f207,
+	0x0000f203, 0x80798179,
+	0xd7610002, 0x0000f204,
 	0x80798179, 0xd7610002,
-	0x0000f208, 0x80798179,
-	0xd7610002, 0x0000f209,
+	0x0000f205, 0x80798179,
+	0xd7610002, 0x0000f206,
 	0x80798179, 0xd7610002,
-	0x0000f20a, 0x80798179,
-	0xd7610002, 0x0000f20b,
-	0x80798179, 0xe0685000,
-	0x701d0200, 0xbefe00c1,
-	0x857d9973, 0x8b7d817d,
-	0xbf06817d, 0xbfa20002,
-	0xbeff0080, 0xbfa00001,
-	0xbeff00c1, 0xb8fb4306,
-	0x8b7bc17b, 0xbfa10044,
-	0xbfbd0000, 0x8b7aff6d,
-	0x80000000, 0xbfa10040,
-	0x847b867b, 0x847b827b,
-	0xbef6007b, 0xb8f03b05,
-	0x80708170, 0xbf0d9973,
-	0xbfa20002, 0x84708970,
-	0xbfa00001, 0x84708a70,
-	0xb8fa1e06, 0x847a8a7a,
-	0x80707a70, 0x8070ff70,
-	0x00000200, 0x8070ff70,
-	0x00000080, 0xbef600ff,
-	0x01000000, 0xd71f0000,
-	0x000100c1, 0xd7200000,
-	0x000200c1, 0x16000084,
-	0x857d9973, 0x8b7d817d,
-	0xbf06817d, 0xbefd0080,
-	0xbfa20012, 0xbe8300ff,
-	0x00000080, 0xbf800000,
-	0xbf800000, 0xbf800000,
-	0xd8d80000, 0x01000000,
-	0xbf890000, 0xe0685000,
-	0x701d0100, 0x807d037d,
-	0x80700370, 0xd5250000,
-	0x0001ff00, 0x00000080,
-	0xbf0a7b7d, 0xbfa2fff4,
-	0xbfa00011, 0xbe8300ff,
-	0x00000100, 0xbf800000,
-	0xbf800000, 0xbf800000,
-	0xd8d80000, 0x01000000,
-	0xbf890000, 0xe0685000,
-	0x701d0100, 0x807d037d,
-	0x80700370, 0xd5250000,
-	0x0001ff00, 0x00000100,
-	0xbf0a7b7d, 0xbfa2fff4,
+	0x0000f207, 0x80798179,
+	0xd7610002, 0x0000f208,
+	0x80798179, 0xd7610002,
+	0x0000f209, 0x80798179,
+	0xd7610002, 0x0000f20a,
+	0x80798179, 0xd7610002,
+	0x0000f20b, 0x80798179,
+	0xe0685000, 0x701d0200,
 	0xbefe00c1, 0x857d9973,
 	0x8b7d817d, 0xbf06817d,
-	0xbfa20004, 0xbef000ff,
-	0x00000200, 0xbeff0080,
-	0xbfa00003, 0xbef000ff,
-	0x00000400, 0xbeff00c1,
-	0xb8fb3b05, 0x807b817b,
-	0x847b827b, 0x857d9973,
+	0xbfa20002, 0xbeff0080,
+	0xbfa00001, 0xbeff00c1,
+	0xb8fb4306, 0x8b7bc17b,
+	0xbfa10044, 0xbfbd0000,
+	0x8b7aff6d, 0x80000000,
+	0xbfa10040, 0x847b867b,
+	0x847b827b, 0xbef6007b,
+	0xb8f03b05, 0x80708170,
+	0xbf0d9973, 0xbfa20002,
+	0x84708970, 0xbfa00001,
+	0x84708a70, 0xb8fa1e06,
+	0x847a8a7a, 0x80707a70,
+	0x8070ff70, 0x00000200,
+	0x8070ff70, 0x00000080,
+	0xbef600ff, 0x01000000,
+	0xd71f0000, 0x000100c1,
+	0xd7200000, 0x000200c1,
+	0x16000084, 0x857d9973,
 	0x8b7d817d, 0xbf06817d,
-	0xbfa20017, 0xbef600ff,
-	0x01000000, 0xbefd0084,
-	0xbf0a7b7d, 0xbfa10037,
-	0x7e008700, 0x7e028701,
-	0x7e048702, 0x7e068703,
-	0xe0685000, 0x701d0000,
-	0xe0685080, 0x701d0100,
-	0xe0685100, 0x701d0200,
-	0xe0685180, 0x701d0300,
-	0x807d847d, 0x8070ff70,
-	0x00000200, 0xbf0a7b7d,
-	0xbfa2ffef, 0xbfa00025,
+	0xbefd0080, 0xbfa20012,
+	0xbe8300ff, 0x00000080,
+	0xbf800000, 0xbf800000,
+	0xbf800000, 0xd8d80000,
+	0x01000000, 0xbf890000,
+	0xe0685000, 0x701d0100,
+	0x807d037d, 0x80700370,
+	0xd5250000, 0x0001ff00,
+	0x00000080, 0xbf0a7b7d,
+	0xbfa2fff4, 0xbfa00011,
+	0xbe8300ff, 0x00000100,
+	0xbf800000, 0xbf800000,
+	0xbf800000, 0xd8d80000,
+	0x01000000, 0xbf890000,
+	0xe0685000, 0x701d0100,
+	0x807d037d, 0x80700370,
+	0xd5250000, 0x0001ff00,
+	0x00000100, 0xbf0a7b7d,
+	0xbfa2fff4, 0xbefe00c1,
+	0x857d9973, 0x8b7d817d,
+	0xbf06817d, 0xbfa20004,
+	0xbef000ff, 0x00000200,
+	0xbeff0080, 0xbfa00003,
+	0xbef000ff, 0x00000400,
+	0xbeff00c1, 0xb8fb3b05,
+	0x807b817b, 0x847b827b,
+	0x857d9973, 0x8b7d817d,
+	0xbf06817d, 0xbfa20017,
 	0xbef600ff, 0x01000000,
 	0xbefd0084, 0xbf0a7b7d,
-	0xbfa10011, 0x7e008700,
+	0xbfa10037, 0x7e008700,
 	0x7e028701, 0x7e048702,
 	0x7e068703, 0xe0685000,
-	0x701d0000, 0xe0685100,
-	0x701d0100, 0xe0685200,
-	0x701d0200, 0xe0685300,
+	0x701d0000, 0xe0685080,
+	0x701d0100, 0xe0685100,
+	0x701d0200, 0xe0685180,
 	0x701d0300, 0x807d847d,
-	0x8070ff70, 0x00000400,
+	0x8070ff70, 0x00000200,
 	0xbf0a7b7d, 0xbfa2ffef,
-	0xb8fb1e06, 0x8b7bc17b,
-	0xbfa1000c, 0x847b837b,
-	0x807b7d7b, 0xbefe00c1,
-	0xbeff0080, 0x7e008700,
+	0xbfa00025, 0xbef600ff,
+	0x01000000, 0xbefd0084,
+	0xbf0a7b7d, 0xbfa10011,
+	0x7e008700, 0x7e028701,
+	0x7e048702, 0x7e068703,
 	0xe0685000, 0x701d0000,
-	0x807d817d, 0x8070ff70,
-	0x00000080, 0xbf0a7b7d,
-	0xbfa2fff8, 0xbfa00146,
-	0xbef4007e, 0x8b75ff7f,
-	0x0000ffff, 0x8c75ff75,
-	0x00040000, 0xbef60080,
-	0xbef700ff, 0x10807fac,
-	0xb8f202dc, 0x84729972,
-	0x8b6eff7f, 0x04000000,
-	0xbfa1003a, 0xbefe00c1,
-	0x857d9972, 0x8b7d817d,
-	0xbf06817d, 0xbfa20002,
-	0xbeff0080, 0xbfa00001,
-	0xbeff00c1, 0xb8ef4306,
-	0x8b6fc16f, 0xbfa1002f,
-	0x846f866f, 0x846f826f,
-	0xbef6006f, 0xb8f83b05,
-	0x80788178, 0xbf0d9972,
-	0xbfa20002, 0x84788978,
-	0xbfa00001, 0x84788a78,
-	0xb8ee1e06, 0x846e8a6e,
-	0x80786e78, 0x8078ff78,
-	0x00000200, 0x8078ff78,
-	0x00000080, 0xbef600ff,
-	0x01000000, 0x857d9972,
-	0x8b7d817d, 0xbf06817d,
-	0xbefd0080, 0xbfa2000c,
-	0xe0500000, 0x781d0000,
-	0xbf8903f7, 0xdac00000,
-	0x00000000, 0x807dff7d,
-	0x00000080, 0x8078ff78,
-	0x00000080, 0xbf0a6f7d,
-	0xbfa2fff5, 0xbfa0000b,
-	0xe0500000, 0x781d0000,
-	0xbf8903f7, 0xdac00000,
-	0x00000000, 0x807dff7d,
-	0x00000100, 0x8078ff78,
-	0x00000100, 0xbf0a6f7d,
-	0xbfa2fff5, 0xbef80080,
+	0xe0685100, 0x701d0100,
+	0xe0685200, 0x701d0200,
+	0xe0685300, 0x701d0300,
+	0x807d847d, 0x8070ff70,
+	0x00000400, 0xbf0a7b7d,
+	0xbfa2ffef, 0xb8fb1e06,
+	0x8b7bc17b, 0xbfa1000c,
+	0x847b837b, 0x807b7d7b,
+	0xbefe00c1, 0xbeff0080,
+	0x7e008700, 0xe0685000,
+	0x701d0000, 0x807d817d,
+	0x8070ff70, 0x00000080,
+	0xbf0a7b7d, 0xbfa2fff8,
+	0xbfa00146, 0xbef4007e,
+	0x8b75ff7f, 0x0000ffff,
+	0x8c75ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x10807fac, 0xb8f202dc,
+	0x84729972, 0x8b6eff7f,
+	0x04000000, 0xbfa1003a,
 	0xbefe00c1, 0x857d9972,
 	0x8b7d817d, 0xbf06817d,
 	0xbfa20002, 0xbeff0080,
 	0xbfa00001, 0xbeff00c1,
-	0xb8ef3b05, 0x806f816f,
-	0x846f826f, 0x857d9972,
-	0x8b7d817d, 0xbf06817d,
-	0xbfa20024, 0xbef600ff,
-	0x01000000, 0xbeee0078,
+	0xb8ef4306, 0x8b6fc16f,
+	0xbfa1002f, 0x846f866f,
+	0x846f826f, 0xbef6006f,
+	0xb8f83b05, 0x80788178,
+	0xbf0d9972, 0xbfa20002,
+	0x84788978, 0xbfa00001,
+	0x84788a78, 0xb8ee1e06,
+	0x846e8a6e, 0x80786e78,
 	0x8078ff78, 0x00000200,
-	0xbefd0084, 0xbf0a6f7d,
-	0xbfa10050, 0xe0505000,
-	0x781d0000, 0xe0505080,
-	0x781d0100, 0xe0505100,
-	0x781d0200, 0xe0505180,
-	0x781d0300, 0xbf8903f7,
-	0x7e008500, 0x7e028501,
-	0x7e048502, 0x7e068503,
-	0x807d847d, 0x8078ff78,
-	0x00000200, 0xbf0a6f7d,
-	0xbfa2ffee, 0xe0505000,
-	0x6e1d0000, 0xe0505080,
-	0x6e1d0100, 0xe0505100,
-	0x6e1d0200, 0xe0505180,
-	0x6e1d0300, 0xbf8903f7,
-	0xbfa00034, 0xbef600ff,
-	0x01000000, 0xbeee0078,
-	0x8078ff78, 0x00000400,
-	0xbefd0084, 0xbf0a6f7d,
-	0xbfa10012, 0xe0505000,
-	0x781d0000, 0xe0505100,
-	0x781d0100, 0xe0505200,
-	0x781d0200, 0xe0505300,
-	0x781d0300, 0xbf8903f7,
-	0x7e008500, 0x7e028501,
-	0x7e048502, 0x7e068503,
-	0x807d847d, 0x8078ff78,
-	0x00000400, 0xbf0a6f7d,
-	0xbfa2ffee, 0xb8ef1e06,
-	0x8b6fc16f, 0xbfa1000e,
-	0x846f836f, 0x806f7d6f,
-	0xbefe00c1, 0xbeff0080,
+	0x8078ff78, 0x00000080,
+	0xbef600ff, 0x01000000,
+	0x857d9972, 0x8b7d817d,
+	0xbf06817d, 0xbefd0080,
+	0xbfa2000c, 0xe0500000,
+	0x781d0000, 0xbf8903f7,
+	0xdac00000, 0x00000000,
+	0x807dff7d, 0x00000080,
+	0x8078ff78, 0x00000080,
+	0xbf0a6f7d, 0xbfa2fff5,
+	0xbfa0000b, 0xe0500000,
+	0x781d0000, 0xbf8903f7,
+	0xdac00000, 0x00000000,
+	0x807dff7d, 0x00000100,
+	0x8078ff78, 0x00000100,
+	0xbf0a6f7d, 0xbfa2fff5,
+	0xbef80080, 0xbefe00c1,
+	0x857d9972, 0x8b7d817d,
+	0xbf06817d, 0xbfa20002,
+	0xbeff0080, 0xbfa00001,
+	0xbeff00c1, 0xb8ef3b05,
+	0x806f816f, 0x846f826f,
+	0x857d9972, 0x8b7d817d,
+	0xbf06817d, 0xbfa20024,
+	0xbef600ff, 0x01000000,
+	0xbeee0078, 0x8078ff78,
+	0x00000200, 0xbefd0084,
+	0xbf0a6f7d, 0xbfa10050,
 	0xe0505000, 0x781d0000,
+	0xe0505080, 0x781d0100,
+	0xe0505100, 0x781d0200,
+	0xe0505180, 0x781d0300,
 	0xbf8903f7, 0x7e008500,
-	0x807d817d, 0x8078ff78,
-	0x00000080, 0xbf0a6f7d,
-	0xbfa2fff7, 0xbeff00c1,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807d847d,
+	0x8078ff78, 0x00000200,
+	0xbf0a6f7d, 0xbfa2ffee,
 	0xe0505000, 0x6e1d0000,
-	0xe0505100, 0x6e1d0100,
-	0xe0505200, 0x6e1d0200,
-	0xe0505300, 0x6e1d0300,
-	0xbf8903f7, 0xb8f83b05,
-	0x80788178, 0xbf0d9972,
-	0xbfa20002, 0x84788978,
-	0xbfa00001, 0x84788a78,
-	0xb8ee1e06, 0x846e8a6e,
-	0x80786e78, 0x8078ff78,
-	0x00000200, 0x80f8ff78,
-	0x00000050, 0xbef600ff,
-	0x01000000, 0xbefd00ff,
-	0x0000006c, 0x80f89078,
-	0xf428403a, 0xf0000000,
-	0xbf89fc07, 0x80fd847d,
-	0xbf800000, 0xbe804300,
-	0xbe824302, 0x80f8a078,
-	0xf42c403a, 0xf0000000,
-	0xbf89fc07, 0x80fd887d,
-	0xbf800000, 0xbe804300,
-	0xbe824302, 0xbe844304,
-	0xbe864306, 0x80f8c078,
-	0xf430403a, 0xf0000000,
-	0xbf89fc07, 0x80fd907d,
-	0xbf800000, 0xbe804300,
-	0xbe824302, 0xbe844304,
-	0xbe864306, 0xbe884308,
-	0xbe8a430a, 0xbe8c430c,
-	0xbe8e430e, 0xbf06807d,
-	0xbfa1fff0, 0xb980f801,
-	0x00000000, 0xbfbd0000,
+	0xe0505080, 0x6e1d0100,
+	0xe0505100, 0x6e1d0200,
+	0xe0505180, 0x6e1d0300,
+	0xbf8903f7, 0xbfa00034,
+	0xbef600ff, 0x01000000,
+	0xbeee0078, 0x8078ff78,
+	0x00000400, 0xbefd0084,
+	0xbf0a6f7d, 0xbfa10012,
+	0xe0505000, 0x781d0000,
+	0xe0505100, 0x781d0100,
+	0xe0505200, 0x781d0200,
+	0xe0505300, 0x781d0300,
+	0xbf8903f7, 0x7e008500,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807d847d,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7d, 0xbfa2ffee,
+	0xb8ef1e06, 0x8b6fc16f,
+	0xbfa1000e, 0x846f836f,
+	0x806f7d6f, 0xbefe00c1,
+	0xbeff0080, 0xe0505000,
+	0x781d0000, 0xbf8903f7,
+	0x7e008500, 0x807d817d,
+	0x8078ff78, 0x00000080,
+	0xbf0a6f7d, 0xbfa2fff7,
+	0xbeff00c1, 0xe0505000,
+	0x6e1d0000, 0xe0505100,
+	0x6e1d0100, 0xe0505200,
+	0x6e1d0200, 0xe0505300,
+	0x6e1d0300, 0xbf8903f7,
 	0xb8f83b05, 0x80788178,
 	0xbf0d9972, 0xbfa20002,
 	0x84788978, 0xbfa00001,
 	0x84788a78, 0xb8ee1e06,
 	0x846e8a6e, 0x80786e78,
 	0x8078ff78, 0x00000200,
+	0x80f8ff78, 0x00000050,
 	0xbef600ff, 0x01000000,
-	0xf4205bfa, 0xf0000000,
-	0x80788478, 0xf4205b3a,
+	0xbefd00ff, 0x0000006c,
+	0x80f89078, 0xf428403a,
+	0xf0000000, 0xbf89fc07,
+	0x80fd847d, 0xbf800000,
+	0xbe804300, 0xbe824302,
+	0x80f8a078, 0xf42c403a,
+	0xf0000000, 0xbf89fc07,
+	0x80fd887d, 0xbf800000,
+	0xbe804300, 0xbe824302,
+	0xbe844304, 0xbe864306,
+	0x80f8c078, 0xf430403a,
+	0xf0000000, 0xbf89fc07,
+	0x80fd907d, 0xbf800000,
+	0xbe804300, 0xbe824302,
+	0xbe844304, 0xbe864306,
+	0xbe884308, 0xbe8a430a,
+	0xbe8c430c, 0xbe8e430e,
+	0xbf06807d, 0xbfa1fff0,
+	0xb980f801, 0x00000000,
+	0xbfbd0000, 0xb8f83b05,
+	0x80788178, 0xbf0d9972,
+	0xbfa20002, 0x84788978,
+	0xbfa00001, 0x84788a78,
+	0xb8ee1e06, 0x846e8a6e,
+	0x80786e78, 0x8078ff78,
+	0x00000200, 0xbef600ff,
+	0x01000000, 0xf4205bfa,
 	0xf0000000, 0x80788478,
-	0xf4205b7a, 0xf0000000,
-	0x80788478, 0xf4205c3a,
+	0xf4205b3a, 0xf0000000,
+	0x80788478, 0xf4205b7a,
 	0xf0000000, 0x80788478,
-	0xf4205c7a, 0xf0000000,
-	0x80788478, 0xf4205eba,
+	0xf4205c3a, 0xf0000000,
+	0x80788478, 0xf4205c7a,
 	0xf0000000, 0x80788478,
-	0xf4205efa, 0xf0000000,
-	0x80788478, 0xf4205e7a,
+	0xf4205eba, 0xf0000000,
+	0x80788478, 0xf4205efa,
 	0xf0000000, 0x80788478,
-	0xf4205cfa, 0xf0000000,
-	0x80788478, 0xf4205bba,
+	0xf4205e7a, 0xf0000000,
+	0x80788478, 0xf4205cfa,
 	0xf0000000, 0x80788478,
-	0xbf89fc07, 0xb96ef814,
 	0xf4205bba, 0xf0000000,
 	0x80788478, 0xbf89fc07,
-	0xb96ef815, 0xbefd006f,
-	0xbefe0070, 0xbeff0071,
-	0x8b6f7bff, 0x000003ff,
-	0xb96f4803, 0x8b6f7bff,
-	0xfffff800, 0x856f8b6f,
-	0xb96fa2c3, 0xb973f801,
-	0xb8ee3b05, 0x806e816e,
-	0xbf0d9972, 0xbfa20002,
-	0x846e896e, 0xbfa00001,
-	0x846e8a6e, 0xb8ef1e06,
-	0x846f8a6f, 0x806e6f6e,
-	0x806eff6e, 0x00000200,
-	0x806e746e, 0x826f8075,
-	0x8b6fff6f, 0x0000ffff,
-	0xf4085c37, 0xf8000050,
-	0xf4085d37, 0xf8000060,
-	0xf4005e77, 0xf8000074,
-	0xbf89fc07, 0x8b6dff6d,
-	0x0000ffff, 0x8bfe7e7e,
-	0x8bea6a6a, 0xb8eef802,
-	0xbf0d866e, 0xbfa20002,
-	0xb97af802, 0xbe80486c,
-	0xb97af802, 0xbe804a6c,
-	0xbfb00000, 0xbf9f0000,
+	0xb96ef814, 0xf4205bba,
+	0xf0000000, 0x80788478,
+	0xbf89fc07, 0xb96ef815,
+	0xbefd006f, 0xbefe0070,
+	0xbeff0071, 0x8b6f7bff,
+	0x000003ff, 0xb96f4803,
+	0x8b6f7bff, 0xfffff800,
+	0x856f8b6f, 0xb96fa2c3,
+	0xb973f801, 0xb8ee3b05,
+	0x806e816e, 0xbf0d9972,
+	0xbfa20002, 0x846e896e,
+	0xbfa00001, 0x846e8a6e,
+	0xb8ef1e06, 0x846f8a6f,
+	0x806e6f6e, 0x806eff6e,
+	0x00000200, 0x806e746e,
+	0x826f8075, 0x8b6fff6f,
+	0x0000ffff, 0xf4085c37,
+	0xf8000050, 0xf4085d37,
+	0xf8000060, 0xf4005e77,
+	0xf8000074, 0xbf89fc07,
+	0x8b6dff6d, 0x0000ffff,
+	0x8bfe7e7e, 0x8bea6a6a,
+	0xb8eef802, 0xbf0d866e,
+	0xbfa20002, 0xb97af802,
+	0xbe80486c, 0xb97af802,
+	0xbe804a6c, 0xbfb00000,
 	0xbf9f0000, 0xbf9f0000,
 	0xbf9f0000, 0xbf9f0000,
+	0xbf9f0000, 0x00000000,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm b/drive=
rs/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
index 0f81670f6f9c..8b92c33c2a7c 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
@@ -186,6 +186,12 @@ L_SKIP_RESTORE:
 	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
=20
 #if SW_SA_TRAP
+	// If ttmp1[30] is set then issue s_barrier to unblock dependent waves.
+	s_bitcmp1_b32	s_save_pc_hi, 30
+	s_cbranch_scc0	L_TRAP_NO_BARRIER
+	s_barrier
+
+L_TRAP_NO_BARRIER:
 	// If ttmp1[31] is set then trap may occur early.
 	// Spin wait until SAVECTX exception is raised.
 	s_bitcmp1_b32	s_save_pc_hi, 31
--
2.25.1
