Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4F32463E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Feb 2021 23:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D416EB2D;
	Wed, 24 Feb 2021 22:19:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40C26E0AF
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Feb 2021 22:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ6AvhgBgcEeTjo/2q3RIeoWUBj+gLbGy3v+4e/Kg+ahf7UBFXbldH/SS6KryT+/jyEOCyqjHchLYw/ZQa3oprnDJr1KAynwdH4DPzrcKxYZ7Hwc48py2wV5aKk8zUqiWuKZ+MXSIF6gmZGEBFjZhv6yptXrL0aadQetCnoWD8QgYnRQdDBdGnRwA9bnhS1LtrZldbtKfTKp7JPjJq8+PMMDxhbncPmejx1A5FMr7BnzDkjKiwi4Gf/hP/Uxc4z0ZuShlxPYRRdNWuB4BG9WsztFDvS8uGzBRMWaHnpK8o/i5EMtEv+OWUrzXc2AMqATRecK8bKitqaFCJ0DCXwK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARSyadRUBwz/47V5zDHNgw9yMdcvPrquvX6tXJnwubI=;
 b=T99pfsxgblvGUULiOiQUK9UQbvM+mcRH2aF78utBlGqQyx6iaZBZZPjl8sBGm1OANSi6xcNYC3Ng5iujcc7tcp8+2uhzD3paUpXrA3uQClvWsNqSZDGqPjyzusjN+gtH8j3MHOJhcmhbtOwGVbbnVQiOL/GdHabKRjlNbUQ5UzOlEXIq7sP76XRHziGzj+ve7yWqG8TXpvfnzwcmiOJJ6SYT70f28rMIs0wRYO84sosLx3vSro3zmO/xYWWtDhburfIDy1ZUUv3BHpfc1WYjsOaZUjbKNApLmv/Lv+qZIg4W7fAmjI3zgJ8iGhUTRWEbGyFXnHqn8CQTEjgOfaBz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARSyadRUBwz/47V5zDHNgw9yMdcvPrquvX6tXJnwubI=;
 b=CVHskRxrZxKbSIkXPf/HEh7DZCP6aXrtvcFDWZmeBVK+kcLmKEpgdZ0g+F0AWRZGWlMN2Q/FTNGJZb724vQYR8oB+v0cdz9n02E6nkUyt1qhdTwOHkSZoDtGoME2/9LpM8sBaVeo8xX6JoerroEDlJhuEQse+97YpAyBng/gx6E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 24 Feb
 2021 22:19:34 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 22:19:34 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 023/159] drm/amdkfd: Add aldebaran trap handler support
Date: Wed, 24 Feb 2021 17:16:43 -0500
Message-Id: <20210224221859.3068810-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224221859.3068810-1-alexander.deucher@amd.com>
References: <20210224221859.3068810-1-alexander.deucher@amd.com>
X-Originating-IP: [192.161.79.246]
X-ClientProxiedBy: BLAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:208:32b::32) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BLAPR03CA0027.namprd03.prod.outlook.com (2603:10b6:208:32b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 22:19:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 624577f3-9e09-4e1b-ca35-08d8d91243c8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4174:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4174E2A8254A2716E3AADA82F79F9@MN2PR12MB4174.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92sHPQ36YajBjxDE9qKpeWR1z+kErPEXAjo157bA8uko27T170AMgY5SUEV4Xjih8TujZJ32ltxeejARtvoNhz0vEBanMIDc0jX+iJ9ZO8za3zLTr0jUYXDWeaF7e2iz/guMiP+9Rtvnxzk42m0TFc+I1zYMu/vPf+F0x7bqcZJE1zpHZY0u2OcK4jTbpCxPWcw7lj8GBvv57PyBEz1q32t6FbCZm9IwVIvkzQB2/bXwabW0Zvmzz03FTnuBgm2qQKKexbJEwSY4xqjk7cIh/fzoMUMe9nYRRI2Y1t61pBaHel0FCHLM11Ne8NPcdvhQB6/HMU3ihNSpU12CXm8k10MDsNU/RVo/5VGMz+25B3GIVNddPFL+8rfviJXoS11G5SxI6U7xoQcVYHhgmoLBWWGdfK4q5m75dRjYHow5ptFftFifIqZTgh8bnbk3hDPVSq1Yg24Ybaieqwo6FNuNptDl0Gy+RtCfyTuEIWAqxEyIF36cf3IpJwPSdT8eRaUfSq4mNoahPO+Mrxzi4xn6vEoaSCQn6yyqJjs2/Bz8/3GJqnZQkMsds1VPYOPmhrPviVx3W07JgJreO2j1TZCZmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(8936002)(52116002)(4326008)(186003)(2616005)(83380400001)(1076003)(956004)(6506007)(30864003)(26005)(6486002)(6512007)(54906003)(66556008)(316002)(2906002)(86362001)(66476007)(66946007)(6916009)(16526019)(6666004)(69590400012)(36756003)(5660300002)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7pR1Cocyi0r3y39TqMu4l4rN8Nafe999LQRVEFniQg5ZaRLGCMEUCLiI3gs5?=
 =?us-ascii?Q?tBOe+Kw5X3lB6Kx1rZ+ANZ3DoeJ0cn/GDkoxtGrNymN1/GYhSilvD2t9XogV?=
 =?us-ascii?Q?X2b2xRYqVxqv/cVnEcDstm8jceN3c7qqmhUDYgp4L1kkiXhZ4CWzgiVomDqp?=
 =?us-ascii?Q?EqRHSc59tH8vqep/vemzUeV5gTmTXbehDV8yzpOXtP0+eqO2KpKC3asjv4Sa?=
 =?us-ascii?Q?hyIsmPltpUPXEDyW5vgd1ArFbxXPy9duqpMpuq6N28x23YV8tTMJI4rVaRVq?=
 =?us-ascii?Q?As73o3Fx7I3chjD0RWb+yOhIj6u1ubLVl4lT9PxIkr7n87vnTUi66I0t1vxE?=
 =?us-ascii?Q?VrOXXzq901zm7Vl64QtYiEUcyHYyeUld2pkxosnZT0evPT2bhZPo6L10V4Z5?=
 =?us-ascii?Q?03QOfBErmO2gVpy7p4BO2bO3kw7kcM56TtkTNHz5x9IeJtz555EK6rd8Llv1?=
 =?us-ascii?Q?0sa+4trCZStFh7qkMAdwEcyiNq8oZljWiSGhVUiHYdPucuAl1Fi/CgbVl4Z7?=
 =?us-ascii?Q?SlFhDCHsorMoQtH7IHlFJU0DA8MhGj/T25To2PDyVV/nYXUC96GQvIZ5PppP?=
 =?us-ascii?Q?jnHBM+FdwqylCHd+MxH26O2dPaurckD4r55Z8lUuyWIOz3NlyBitpi2VP3gC?=
 =?us-ascii?Q?1nx3FuNri5O3Bc+2yioTMWjR49Z6UsT/CvuiXM0wmpwVrs+QR/OKuJ24AN6l?=
 =?us-ascii?Q?MnX4zMRlUn/FYMGoIpOo5l0nfhxsAp5b4Q/ARNgkXdkTx1/3bfchUYy21WHO?=
 =?us-ascii?Q?ZP9IRIc4TFB9zEHJ92yTrAl0YcKOJN9ykErOSfKL3BYZzkxc8JW6kZ3JduBg?=
 =?us-ascii?Q?lVDr1z8/hVB16YF2aYKNxq5D3RTZTdTHZj+efJmzzXq5ax8yTfClCVWPECTQ?=
 =?us-ascii?Q?nCbDB9LtGpyBFDl6+e40qsfE+9lRYCbE0z/YSx8wGUv0fUzLAU/zu6h4ZTct?=
 =?us-ascii?Q?5U7SCn8Jkjo2dWy2Uk5HEz/Tecf9DgUL4QVaBz2L2tLwV2Ew4s1c8Hr6Vsl+?=
 =?us-ascii?Q?xuAXMPlmX62ErCkw8vXQFnWKFNdBPrcRK8gsRL6JH91A1rIlPl1YzIgd/6bF?=
 =?us-ascii?Q?hRfmIfAXRfRKIjyoWmsUebPn6vBDaBxf+0q6bYjIkmT4/0DkpWz5WP/vJ0hn?=
 =?us-ascii?Q?3ofgt+BYVs7kwPbvT3mH/r/+wcCeU0z7UrLunD8yh/Wq+fbFC4d/vxyMrcNy?=
 =?us-ascii?Q?+axz42N7r7bhMHFPEBTp0cLx8z5OvPkyzphDcfv8UCbozObtTrJdI1Byf2sC?=
 =?us-ascii?Q?oA/U8kTBBWncj6hCtzm8YgqK1Yw85uydRZ3KKJKu5e7ApAR6CJUnJb3BTlvx?=
 =?us-ascii?Q?gpoGEQFzo+nrjxasMzy+vI2t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624577f3-9e09-4e1b-ca35-08d8d91243c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 22:19:34.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGiCXGzN/N0BqBvaJu49Ou+/AgV3sGCUXDh3p2PCGTwefMEOnJ7mgeWk+m9g1W2js3LqkYQMLo7Zlug9EUDA/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Jay Cornwall <jay.cornwall@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jay Cornwall <jay.cornwall@amd.com>

Similar to arcturus, but ARCH/ACC VGPRs may now be split unevenly.
A new field in SQ_WAVE_GPR_ALLOC tracks the boundary between the two
sets of VGPRs.

Squash below patches:

drm/amdkfd: Use preprocessor for IP-specific trap handler code
drm/amdkfd: Fix VGPR restore race in gfx8/gfx9 trap handler
drm/amdkfd: Remove duplicated code in gfx9 trap handler
drm/amdkfd: Separate ARCH/ACC VGPR restore in trap handler
drm/amdkfd: Reverse order of ARCH/ACC VGPR restore in trap handler

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 491 ++++++++++++++++++
 .../drm/amd/amdkfd/cwsr_trap_handler_gfx8.asm |   1 +
 .../drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm | 202 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   7 +-
 4 files changed, 618 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
index affbca7c0050..c8453dad4ea5 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -1575,6 +1575,497 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0xbf810000, 0x00000000,
 };
 
+static const uint32_t cwsr_trap_aldebaran_hex[] = {
+	0xbf820001, 0xbf8202cd,
+	0xb8f8f802, 0x89788678,
+	0xb8eef801, 0x866eff6e,
+	0x00000800, 0xbf840003,
+	0x866eff78, 0x00002000,
+	0xbf840016, 0xb8fbf803,
+	0x866eff7b, 0x00000400,
+	0xbf85003b, 0x866eff7b,
+	0x00000800, 0xbf850003,
+	0x866eff7b, 0x00000100,
+	0xbf84000c, 0x866eff78,
+	0x00002000, 0xbf840005,
+	0xbf8e0010, 0xb8eef803,
+	0x866eff6e, 0x00000400,
+	0xbf84fffb, 0x8778ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xb8eef807,
+	0x866fff6e, 0x001f8000,
+	0x8e6f8b6f, 0x8977ff77,
+	0xfc000000, 0x87776f77,
+	0x896eff6e, 0x001f8000,
+	0xb96ef807, 0xb8faf812,
+	0xb8fbf813, 0x8efa887a,
+	0xc0071bbd, 0x00000000,
+	0xbf8cc07f, 0xc0071ebd,
+	0x00000008, 0xbf8cc07f,
+	0x86ee6e6e, 0xbf840001,
+	0xbe801d6e, 0xb8fbf803,
+	0x867bff7b, 0x000001ff,
+	0xbf850002, 0x806c846c,
+	0x826d806d, 0x866dff6d,
+	0x0000ffff, 0x8f6e8b77,
+	0x866eff6e, 0x001f8000,
+	0xb96ef807, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f6e8378,
+	0xb96ee0c2, 0xbf800002,
+	0xb9780002, 0xbe801f6c,
+	0x866dff6d, 0x0000ffff,
+	0xbefa0080, 0xb97a0283,
+	0xb8fa2407, 0x8e7a9b7a,
+	0x876d7a6d, 0xb8fa03c7,
+	0x8e7a9a7a, 0x876d7a6d,
+	0xb8faf807, 0x867aff7a,
+	0x00007fff, 0xb97af807,
+	0xbeee007e, 0xbeef007f,
+	0xbefe0180, 0xbf900004,
+	0x877a8478, 0xb97af802,
+	0xbf8e0002, 0xbf88fffe,
+	0xb8fa2985, 0x807a817a,
+	0x8e7a8a7a, 0x8e7a817a,
+	0xb8fb1605, 0x807b817b,
+	0x8e7b867b, 0x807a7b7a,
+	0x807a7e7a, 0x827b807f,
+	0x867bff7b, 0x0000ffff,
+	0xc04b1c3d, 0x00000050,
+	0xbf8cc07f, 0xc04b1d3d,
+	0x00000060, 0xbf8cc07f,
+	0xc0431e7d, 0x00000074,
+	0xbf8cc07f, 0xbef4007e,
+	0x8675ff7f, 0x0000ffff,
+	0x8775ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x00807fac, 0x867aff7f,
+	0x08000000, 0x8f7a837a,
+	0x87777a77, 0x867aff7f,
+	0x70000000, 0x8f7a817a,
+	0x87777a77, 0xbef1007c,
+	0xbef00080, 0xb8f02985,
+	0x80708170, 0x8e708a70,
+	0x8e708170, 0xb8fa1605,
+	0x807a817a, 0x8e7a867a,
+	0x80707a70, 0xbef60084,
+	0xbef600ff, 0x01000000,
+	0xbefe007c, 0xbefc0070,
+	0xc0611c7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xbefe007c,
+	0xbefc0070, 0xc0611b3a,
+	0x0000007c, 0xbf8cc07f,
+	0x80708470, 0xbefc007e,
+	0xbefe007c, 0xbefc0070,
+	0xc0611b7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xbefe007c,
+	0xbefc0070, 0xc0611bba,
+	0x0000007c, 0xbf8cc07f,
+	0x80708470, 0xbefc007e,
+	0xbefe007c, 0xbefc0070,
+	0xc0611bfa, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xbefe007c,
+	0xbefc0070, 0xc0611e3a,
+	0x0000007c, 0xbf8cc07f,
+	0x80708470, 0xbefc007e,
+	0xb8fbf803, 0xbefe007c,
+	0xbefc0070, 0xc0611efa,
+	0x0000007c, 0xbf8cc07f,
+	0x80708470, 0xbefc007e,
+	0xbefe007c, 0xbefc0070,
+	0xc0611a3a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xbefe007c,
+	0xbefc0070, 0xc0611a7a,
+	0x0000007c, 0xbf8cc07f,
+	0x80708470, 0xbefc007e,
+	0xb8f1f801, 0xbefe007c,
+	0xbefc0070, 0xc0611c7a,
+	0x0000007c, 0xbf8cc07f,
+	0x80708470, 0xbefc007e,
+	0x867aff7f, 0x04000000,
+	0xbeef0080, 0x876f6f7a,
+	0xb8f02985, 0x80708170,
+	0x8e708a70, 0x8e708170,
+	0xb8fb1605, 0x807b817b,
+	0x8e7b847b, 0x8e76827b,
+	0xbef600ff, 0x01000000,
+	0xbef20174, 0x80747074,
+	0x82758075, 0xbefc0080,
+	0xbf800000, 0xbe802b00,
+	0xbe822b02, 0xbe842b04,
+	0xbe862b06, 0xbe882b08,
+	0xbe8a2b0a, 0xbe8c2b0c,
+	0xbe8e2b0e, 0xc06b003a,
+	0x00000000, 0xbf8cc07f,
+	0xc06b013a, 0x00000010,
+	0xbf8cc07f, 0xc06b023a,
+	0x00000020, 0xbf8cc07f,
+	0xc06b033a, 0x00000030,
+	0xbf8cc07f, 0x8074c074,
+	0x82758075, 0x807c907c,
+	0xbf0a7b7c, 0xbf85ffe7,
+	0xbef40172, 0xbef00080,
+	0xbefe00c1, 0xbeff00c1,
+	0xbee80080, 0xbee90080,
+	0xbef600ff, 0x01000000,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf85004d, 0xbe840080,
+	0xd2890000, 0x00000900,
+	0x80048104, 0xd2890001,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
+	0x80048104, 0xd2890003,
+	0x00000900, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
+	0x80048104, 0xd2890002,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0xbe840080,
+	0xd2890000, 0x00000902,
+	0x80048104, 0xd2890001,
+	0x00000902, 0x80048104,
+	0xd2890002, 0x00000902,
+	0x80048104, 0xd2890003,
+	0x00000902, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000903, 0x80048104,
+	0xd2890001, 0x00000903,
+	0x80048104, 0xd2890002,
+	0x00000903, 0x80048104,
+	0xd2890003, 0x00000903,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0xbf820008,
+	0xe0724000, 0x701d0000,
+	0xe0724100, 0x701d0100,
+	0xe0724200, 0x701d0200,
+	0xe0724300, 0x701d0300,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8fb4306, 0x867bc17b,
+	0xbf840064, 0xbf8a0000,
+	0x867aff6f, 0x04000000,
+	0xbf840060, 0x8e7b867b,
+	0x8e7b827b, 0xbef6007b,
+	0xb8f02985, 0x80708170,
+	0x8e708a70, 0x8e708170,
+	0xb8fa1605, 0x807a817a,
+	0x8e7a867a, 0x80707a70,
+	0x8070ff70, 0x00000080,
+	0xbef600ff, 0x01000000,
+	0xbefc0080, 0xd28c0002,
+	0x000100c1, 0xd28d0003,
+	0x000204c1, 0x867aff78,
+	0x00400000, 0xbf850003,
+	0xb8faf803, 0x897a7aff,
+	0x10000000, 0xbf850030,
+	0x24040682, 0xd86e4000,
+	0x00000002, 0xbf8cc07f,
+	0xbe840080, 0xd2890000,
+	0x00000900, 0x80048104,
+	0xd2890001, 0x00000900,
+	0x80048104, 0xd2890002,
+	0x00000900, 0x80048104,
+	0xd2890003, 0x00000900,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0xbe840080,
+	0xd2890000, 0x00000901,
+	0x80048104, 0xd2890001,
+	0x00000901, 0x80048104,
+	0xd2890002, 0x00000901,
+	0x80048104, 0xd2890003,
+	0x00000901, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0x680404ff, 0x00000200,
+	0xd0c9006a, 0x0000f702,
+	0xbf87ffd2, 0xbf820015,
+	0xd1060002, 0x00011103,
+	0x7e0602ff, 0x00000200,
+	0xbefc00ff, 0x00010000,
+	0xbe800077, 0x8677ff77,
+	0xff7fffff, 0x8777ff77,
+	0x00058000, 0xd8ec0000,
+	0x00000002, 0xbf8cc07f,
+	0xe0765000, 0x701d0002,
+	0x68040702, 0xd0c9006a,
+	0x0000f702, 0xbf87fff7,
+	0xbef70000, 0xbef000ff,
+	0x00000400, 0xbefe00c1,
+	0xbeff00c1, 0xb8fb2b05,
+	0x807b817b, 0x8e7b827b,
+	0xbef600ff, 0x01000000,
+	0xbefc0084, 0xbf0a7b7c,
+	0xbf84006d, 0xbf11017c,
+	0x807bff7b, 0x00001000,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf850051, 0xbe840080,
+	0xd2890000, 0x00000900,
+	0x80048104, 0xd2890001,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
+	0x80048104, 0xd2890003,
+	0x00000900, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
+	0x80048104, 0xd2890002,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0xbe840080,
+	0xd2890000, 0x00000902,
+	0x80048104, 0xd2890001,
+	0x00000902, 0x80048104,
+	0xd2890002, 0x00000902,
+	0x80048104, 0xd2890003,
+	0x00000902, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000903, 0x80048104,
+	0xd2890001, 0x00000903,
+	0x80048104, 0xd2890002,
+	0x00000903, 0x80048104,
+	0xd2890003, 0x00000903,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0x807c847c,
+	0xbf0a7b7c, 0xbf85ffb1,
+	0xbf9c0000, 0xbf820012,
+	0x7e000300, 0x7e020301,
+	0x7e040302, 0x7e060303,
+	0xe0724000, 0x701d0000,
+	0xe0724100, 0x701d0100,
+	0xe0724200, 0x701d0200,
+	0xe0724300, 0x701d0300,
+	0x807c847c, 0x8070ff70,
+	0x00000400, 0xbf0a7b7c,
+	0xbf85ffef, 0xbf9c0000,
+	0xb8fb2985, 0x807b817b,
+	0x8e7b837b, 0xb8fa2b05,
+	0x807a817a, 0x8e7a827a,
+	0x80fb7a7b, 0xbf84007a,
+	0x807bff7b, 0x00001000,
+	0xbefc0080, 0xbf11017c,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf850059, 0xd3d84000,
+	0x18000100, 0xd3d84001,
+	0x18000101, 0xd3d84002,
+	0x18000102, 0xd3d84003,
+	0x18000103, 0xbe840080,
+	0xd2890000, 0x00000900,
+	0x80048104, 0xd2890001,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
+	0x80048104, 0xd2890003,
+	0x00000900, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
+	0x80048104, 0xd2890002,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0xbe840080,
+	0xd2890000, 0x00000902,
+	0x80048104, 0xd2890001,
+	0x00000902, 0x80048104,
+	0xd2890002, 0x00000902,
+	0x80048104, 0xd2890003,
+	0x00000902, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000903, 0x80048104,
+	0xd2890001, 0x00000903,
+	0x80048104, 0xd2890002,
+	0x00000903, 0x80048104,
+	0xd2890003, 0x00000903,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0x807c847c,
+	0xbf0a7b7c, 0xbf85ffa9,
+	0xbf9c0000, 0xbf820016,
+	0xd3d84000, 0x18000100,
+	0xd3d84001, 0x18000101,
+	0xd3d84002, 0x18000102,
+	0xd3d84003, 0x18000103,
+	0xe0724000, 0x701d0000,
+	0xe0724100, 0x701d0100,
+	0xe0724200, 0x701d0200,
+	0xe0724300, 0x701d0300,
+	0x807c847c, 0x8070ff70,
+	0x00000400, 0xbf0a7b7c,
+	0xbf85ffeb, 0xbf9c0000,
+	0xbf820100, 0xbef4007e,
+	0x8675ff7f, 0x0000ffff,
+	0x8775ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x00807fac, 0x866eff7f,
+	0x08000000, 0x8f6e836e,
+	0x87776e77, 0x866eff7f,
+	0x70000000, 0x8f6e816e,
+	0x87776e77, 0x866eff7f,
+	0x04000000, 0xbf84001f,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8ef4306, 0x866fc16f,
+	0xbf84001a, 0x8e6f866f,
+	0x8e6f826f, 0xbef6006f,
+	0xb8f82985, 0x80788178,
+	0x8e788a78, 0x8e788178,
+	0xb8ee1605, 0x806e816e,
+	0x8e6e866e, 0x80786e78,
+	0x8078ff78, 0x00000080,
+	0xbef600ff, 0x01000000,
+	0xbefc0080, 0xe0510000,
+	0x781d0000, 0xe0510100,
+	0x781d0000, 0x807cff7c,
+	0x00000200, 0x8078ff78,
+	0x00000200, 0xbf0a6f7c,
+	0xbf85fff6, 0xbefe00c1,
+	0xbeff00c1, 0xbef600ff,
+	0x01000000, 0xb8ef2b05,
+	0x806f816f, 0x8e6f826f,
+	0x806fff6f, 0x00008000,
+	0xbef80080, 0xbeee0078,
+	0x8078ff78, 0x00000400,
+	0xbefc0084, 0xbf11087c,
+	0xe0524000, 0x781d0000,
+	0xe0524100, 0x781d0100,
+	0xe0524200, 0x781d0200,
+	0xe0524300, 0x781d0300,
+	0xbf8c0f70, 0x7e000300,
+	0x7e020301, 0x7e040302,
+	0x7e060303, 0x807c847c,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7c, 0xbf85ffee,
+	0xb8ef2985, 0x806f816f,
+	0x8e6f836f, 0xb8f92b05,
+	0x80798179, 0x8e798279,
+	0x80ef796f, 0xbf84001a,
+	0x806fff6f, 0x00008000,
+	0xbefc0080, 0xbf11087c,
+	0xe0524000, 0x781d0000,
+	0xe0524100, 0x781d0100,
+	0xe0524200, 0x781d0200,
+	0xe0524300, 0x781d0300,
+	0xbf8c0f70, 0xd3d94000,
+	0x18000100, 0xd3d94001,
+	0x18000101, 0xd3d94002,
+	0x18000102, 0xd3d94003,
+	0x18000103, 0x807c847c,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7c, 0xbf85ffea,
+	0xbf9c0000, 0xe0524000,
+	0x6e1d0000, 0xe0524100,
+	0x6e1d0100, 0xe0524200,
+	0x6e1d0200, 0xe0524300,
+	0x6e1d0300, 0xbf8c0f70,
+	0xb8f82985, 0x80788178,
+	0x8e788a78, 0x8e788178,
+	0xb8ee1605, 0x806e816e,
+	0x8e6e866e, 0x80786e78,
+	0x80f8c078, 0xb8ef1605,
+	0x806f816f, 0x8e6f846f,
+	0x8e76826f, 0xbef600ff,
+	0x01000000, 0xbefc006f,
+	0xc031003a, 0x00000078,
+	0x80f8c078, 0xbf8cc07f,
+	0x80fc907c, 0xbf800000,
+	0xbe802d00, 0xbe822d02,
+	0xbe842d04, 0xbe862d06,
+	0xbe882d08, 0xbe8a2d0a,
+	0xbe8c2d0c, 0xbe8e2d0e,
+	0xbf06807c, 0xbf84fff0,
+	0xb8f82985, 0x80788178,
+	0x8e788a78, 0x8e788178,
+	0xb8ee1605, 0x806e816e,
+	0x8e6e866e, 0x80786e78,
+	0xbef60084, 0xbef600ff,
+	0x01000000, 0xc0211bfa,
+	0x00000078, 0x80788478,
+	0xc0211b3a, 0x00000078,
+	0x80788478, 0xc0211b7a,
+	0x00000078, 0x80788478,
+	0xc0211c3a, 0x00000078,
+	0x80788478, 0xc0211c7a,
+	0x00000078, 0x80788478,
+	0xc0211eba, 0x00000078,
+	0x80788478, 0xc0211efa,
+	0x00000078, 0x80788478,
+	0xc0211a3a, 0x00000078,
+	0x80788478, 0xc0211a7a,
+	0x00000078, 0x80788478,
+	0xc0211cfa, 0x00000078,
+	0x80788478, 0xbf8cc07f,
+	0xbefc006f, 0xbefe0070,
+	0xbeff0071, 0x866f7bff,
+	0x000003ff, 0xb96f4803,
+	0x866f7bff, 0xfffff800,
+	0x8f6f8b6f, 0xb96fa2c3,
+	0xb973f801, 0xb8ee2985,
+	0x806e816e, 0x8e6e8a6e,
+	0x8e6e816e, 0xb8ef1605,
+	0x806f816f, 0x8e6f866f,
+	0x806e6f6e, 0x806e746e,
+	0x826f8075, 0x866fff6f,
+	0x0000ffff, 0xc00b1c37,
+	0x00000050, 0xc00b1d37,
+	0x00000060, 0xc0031e77,
+	0x00000074, 0xbf8cc07f,
+	0x866fff6d, 0xf8000000,
+	0x8f6f9b6f, 0x8e6f906f,
+	0xbeee0080, 0x876e6f6e,
+	0x866fff6d, 0x04000000,
+	0x8f6f9a6f, 0x8e6f8f6f,
+	0x876e6f6e, 0x866fff7a,
+	0x00800000, 0x8f6f976f,
+	0xb96ef807, 0x866dff6d,
+	0x0000ffff, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f6e837a,
+	0xb96ee0c2, 0xbf800002,
+	0xb97a0002, 0xbf8a0000,
+	0x95806f6c, 0xbf810000,
+};
+
 static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xbf820001, 0xbf8201cf,
 	0xb0804004, 0xb978f802,
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx8.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx8.asm
index b195b7cd8a17..ac8edef09ca5 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx8.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx8.asm
@@ -563,6 +563,7 @@ L_RESTORE:
         buffer_load_dword v1, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1 offset:256
         buffer_load_dword v2, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1 offset:256*2
         buffer_load_dword v3, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1 offset:256*3
+        s_waitcnt vmcnt(0)
 
     /*          restore SGPRs       */
     //////////////////////////////
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm
index 75f29d13c90f..4b3f0762a779 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm
@@ -21,9 +21,24 @@
  */
 
 /* To compile this assembly code:
- * PROJECT=greenland ./sp3 cwsr_trap_handler_gfx9.asm -hex tmp.hex
+ *
+ * gfx9:
+ *   cpp -DASIC_FAMILY=CHIP_VEGAM cwsr_trap_handler_gfx9.asm -P -o gfx9.sp3
+ *   sp3 gfx9.sp3 -hex gfx9.hex
+ *
+ * arcturus:
+ *   cpp -DASIC_FAMILY=CHIP_ARCTURUS cwsr_trap_handler_gfx9.asm -P -o arcturus.sp3
+ *   sp3 arcturus.sp3 -hex arcturus.hex
+ *
+ * aldebaran:
+ *   cpp -DASIC_FAMILY=CHIP_ALDEBARAN cwsr_trap_handler_gfx9.asm -P -o aldebaran.sp3
+ *   sp3 aldebaran.sp3 -hex aldebaran.hex
  */
 
+#define CHIP_VEGAM 18
+#define CHIP_ARCTURUS 23
+#define CHIP_ALDEBARAN 25
+
 var ACK_SQC_STORE		    =	1		    //workaround for suspected SQC store bug causing incorrect stores under concurrency
 var SAVE_AFTER_XNACK_ERROR	    =	1		    //workaround for TCP store failure after XNACK error when ALLOW_REPLAY=0, for debugger
 var SINGLE_STEP_MISSED_WORKAROUND   =	1		    //workaround for lost MODE.DEBUG_EN exception when SAVECTX raised
@@ -44,10 +59,17 @@ var SQ_WAVE_STATUS_ALLOW_REPLAY_MASK    = 0x400000
 
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT	= 12
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE	= 9
-var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT	= 8
 var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE	= 6
-var SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SHIFT	= 24
 var SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SIZE	= 3			//FIXME	 sq.blk still has 4 bits at this time while SQ programming guide has 3 bits
+var SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SHIFT	= 24
+
+#if ASIC_FAMILY >= CHIP_ALDEBARAN
+var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT	= 6
+var SQ_WAVE_GPR_ALLOC_ACCV_OFFSET_SHIFT	= 12
+var SQ_WAVE_GPR_ALLOC_ACCV_OFFSET_SIZE	= 6
+#else
+var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT	= 8
+#endif
 
 var SQ_WAVE_TRAPSTS_SAVECTX_MASK    =	0x400
 var SQ_WAVE_TRAPSTS_EXCE_MASK	    =	0x1FF			// Exception mask
@@ -134,7 +156,7 @@ var s_restore_spi_init_lo		    =	exec_lo
 var s_restore_spi_init_hi		    =	exec_hi
 
 var s_restore_mem_offset	=   ttmp12
-var s_restore_accvgpr_offset	=   ttmp13
+var s_restore_tmp2		=   ttmp13
 var s_restore_alloc_size	=   ttmp3
 var s_restore_tmp		=   ttmp2
 var s_restore_mem_offset_save	=   s_restore_tmp	//no conflict
@@ -466,12 +488,7 @@ if SAVE_AFTER_XNACK_ERROR
 L_SAVE_FIRST_VGPRS_WITH_TCP:
 end
 
-	buffer_store_dword v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
-	buffer_store_dword v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1  offset:256
-	buffer_store_dword v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1  offset:256*2
-	buffer_store_dword v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1  offset:256*3
-
-
+    write_4vgprs_to_mem(s_save_buf_rsrc0, s_save_mem_offset)
 
     /*		save LDS	*/
     //////////////////////////////
@@ -565,11 +582,8 @@ L_SAVE_LDS_DONE:
     s_mov_b32	    exec_lo, 0xFFFFFFFF						    //need every thread from now on
     s_mov_b32	    exec_hi, 0xFFFFFFFF
 
-    s_getreg_b32    s_save_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE)		    //vpgr_size
-    s_add_u32	    s_save_alloc_size, s_save_alloc_size, 1
-    s_lshl_b32	    s_save_alloc_size, s_save_alloc_size, 2			    //Number of VGPRs = (vgpr_size + 1) * 4    (non-zero value)	  //FIXME for GFX, zero is possible
-    s_lshl_b32	    s_save_buf_rsrc2,  s_save_alloc_size, 8			    //NUM_RECORDS in bytes (64 threads*4)
-	s_mov_b32	s_save_buf_rsrc2,  0x1000000				    //NUM_RECORDS in bytes
+    get_num_arch_vgprs(s_save_alloc_size)
+    s_mov_b32	    s_save_buf_rsrc2,  0x1000000				    //NUM_RECORDS in bytes
 
 
     // VGPR store using dw burst
@@ -602,10 +616,7 @@ end
     v_mov_b32	    v2, v2		//v0 = v[0+m0]
     v_mov_b32	    v3, v3		//v0 = v[0+m0]
 
-	buffer_store_dword v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
-	buffer_store_dword v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1  offset:256
-	buffer_store_dword v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1  offset:256*2
-	buffer_store_dword v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1  offset:256*3
+    write_4vgprs_to_mem(s_save_buf_rsrc0, s_save_mem_offset)
 
     s_add_u32	    m0, m0, 4							    //next vgpr index
     s_add_u32	    s_save_mem_offset, s_save_mem_offset, 256*4			    //every buffer_store_dword does 256 bytes
@@ -615,8 +626,16 @@ end
 
 L_SAVE_VGPR_END:
 
-if ASIC_TARGET_ARCTURUS
+#if ASIC_FAMILY >= CHIP_ARCTURUS
     // Save ACC VGPRs
+
+#if ASIC_FAMILY >= CHIP_ALDEBARAN
+    // ACC VGPR count may differ from ARCH VGPR count.
+    get_num_acc_vgprs(s_save_alloc_size, s_save_tmp)
+    s_cbranch_scc0  L_SAVE_ACCVGPR_END
+    s_add_u32	    s_save_alloc_size, s_save_alloc_size, 0x1000		    //add 0x1000 since we compare m0 against it later
+#endif
+
     s_mov_b32 m0, 0x0 //VGPR initial index value =0
     s_set_gpr_idx_on m0, 0x1 //M0[7:0] = M0[7:0] and M0[15:12] = 0x1
 
@@ -644,10 +663,7 @@ L_SAVE_ACCVGPR_LOOP:
         v_accvgpr_read v[vgpr], acc[vgpr]  // v[N] = acc[N+m0]
     end
 
-    buffer_store_dword v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
-    buffer_store_dword v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256
-    buffer_store_dword v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*2
-    buffer_store_dword v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*3
+    write_4vgprs_to_mem(s_save_buf_rsrc0, s_save_mem_offset)
 
     s_add_u32 m0, m0, 4
     s_add_u32 s_save_mem_offset, s_save_mem_offset, 256*4
@@ -656,7 +672,7 @@ L_SAVE_ACCVGPR_LOOP:
     s_set_gpr_idx_off
 
 L_SAVE_ACCVGPR_END:
-end
+#endif
 
     s_branch	L_END_PGM
 
@@ -724,53 +740,23 @@ L_RESTORE:
     /*		restore VGPRs	    */
     //////////////////////////////
   L_RESTORE_VGPR:
-	// VGPR SR memory offset : 0
-    s_mov_b32	    s_restore_mem_offset, 0x0
     s_mov_b32	    exec_lo, 0xFFFFFFFF							    //need every thread from now on   //be consistent with SAVE although can be moved ahead
     s_mov_b32	    exec_hi, 0xFFFFFFFF
+    s_mov_b32	    s_restore_buf_rsrc2,  0x1000000					    //NUM_RECORDS in bytes
 
-    s_getreg_b32    s_restore_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE)	//vpgr_size
-    s_add_u32	    s_restore_alloc_size, s_restore_alloc_size, 1
-    s_lshl_b32	    s_restore_alloc_size, s_restore_alloc_size, 2			    //Number of VGPRs = (vgpr_size + 1) * 4    (non-zero value)
-    s_lshl_b32	    s_restore_buf_rsrc2,  s_restore_alloc_size, 8			    //NUM_RECORDS in bytes (64 threads*4)
-
-if ASIC_TARGET_ARCTURUS
-    s_mov_b32	    s_restore_accvgpr_offset, s_restore_buf_rsrc2                           //ACC VGPRs at end of VGPRs
-end
-
-	s_mov_b32	s_restore_buf_rsrc2,  0x1000000					    //NUM_RECORDS in bytes
+    // Save ARCH VGPRs 4-N, then all ACC VGPRs, then ARCH VGPRs 0-3.
+    get_num_arch_vgprs(s_restore_alloc_size)
+    s_add_u32	    s_restore_alloc_size, s_restore_alloc_size, 0x8000			    //add 0x8000 since we compare m0 against it later
 
-    // VGPR load using dw burst
+    // ARCH VGPRs at offset: 0
+    s_mov_b32	    s_restore_mem_offset, 0x0
     s_mov_b32	    s_restore_mem_offset_save, s_restore_mem_offset	// restore start with v1, v0 will be the last
     s_add_u32	    s_restore_mem_offset, s_restore_mem_offset, 256*4
-if ASIC_TARGET_ARCTURUS
-    s_mov_b32	    s_restore_accvgpr_offset_save, s_restore_accvgpr_offset
-    s_add_u32	    s_restore_accvgpr_offset, s_restore_accvgpr_offset, 256*4
-end
     s_mov_b32	    m0, 4				//VGPR initial index value = 1
-    s_set_gpr_idx_on  m0, 0x8			    //M0[7:0] = M0[7:0] and M0[15:12] = 0x8
-    s_add_u32	    s_restore_alloc_size, s_restore_alloc_size, 0x8000			    //add 0x8000 since we compare m0 against it later
+    s_set_gpr_idx_on	m0, 0x8								    //M0[7:0] = M0[7:0] and M0[15:12] = 0x8
 
   L_RESTORE_VGPR_LOOP:
-
-if ASIC_TARGET_ARCTURUS
-	buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset slc:1 glc:1
-	buffer_load_dword v1, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset slc:1 glc:1 offset:256
-	buffer_load_dword v2, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset slc:1 glc:1 offset:256*2
-	buffer_load_dword v3, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset slc:1 glc:1 offset:256*3
-	s_add_u32 s_restore_accvgpr_offset, s_restore_accvgpr_offset, 256*4
-	s_waitcnt vmcnt(0)
-
-	for var vgpr = 0; vgpr < 4; ++ vgpr
-		v_accvgpr_write acc[vgpr], v[vgpr]
-	end
-end
-
-	buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset slc:1 glc:1
-	buffer_load_dword v1, v0, s_restore_buf_rsrc0, s_restore_mem_offset slc:1 glc:1 offset:256
-	buffer_load_dword v2, v0, s_restore_buf_rsrc0, s_restore_mem_offset slc:1 glc:1 offset:256*2
-	buffer_load_dword v3, v0, s_restore_buf_rsrc0, s_restore_mem_offset slc:1 glc:1 offset:256*3
-    s_waitcnt	    vmcnt(0)								    //ensure data ready
+    read_4vgprs_from_mem(s_restore_buf_rsrc0, s_restore_mem_offset)
     v_mov_b32	    v0, v0								    //v[0+m0] = v0
     v_mov_b32	    v1, v1
     v_mov_b32	    v2, v2
@@ -779,24 +765,37 @@ end
     s_add_u32	    s_restore_mem_offset, s_restore_mem_offset, 256*4				//every buffer_load_dword does 256 bytes
     s_cmp_lt_u32    m0, s_restore_alloc_size						    //scc = (m0 < s_restore_alloc_size) ? 1 : 0
     s_cbranch_scc1  L_RESTORE_VGPR_LOOP							    //VGPR restore (except v0) is complete?
-    s_set_gpr_idx_off
-											    /* VGPR restore on v0 */
-if ASIC_TARGET_ARCTURUS
-	buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset_save slc:1 glc:1
-	buffer_load_dword v1, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset_save slc:1 glc:1 offset:256
-	buffer_load_dword v2, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset_save slc:1 glc:1 offset:256*2
-	buffer_load_dword v3, v0, s_restore_buf_rsrc0, s_restore_accvgpr_offset_save slc:1 glc:1 offset:256*3
-	s_waitcnt vmcnt(0)
 
-	for var vgpr = 0; vgpr < 4; ++ vgpr
-		v_accvgpr_write acc[vgpr], v[vgpr]
-	end
-end
+#if ASIC_FAMILY >= CHIP_ALDEBARAN
+    // ACC VGPR count may differ from ARCH VGPR count.
+    get_num_acc_vgprs(s_restore_alloc_size, s_restore_tmp2)
+    s_cbranch_scc0  L_RESTORE_ACCVGPR_END
+    s_add_u32	    s_restore_alloc_size, s_restore_alloc_size, 0x8000			    //add 0x8000 since we compare m0 against it later
+#endif
 
-	buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1
-	buffer_load_dword v1, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1 offset:256
-	buffer_load_dword v2, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1 offset:256*2
-	buffer_load_dword v3, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save    slc:1 glc:1 offset:256*3
+#if ASIC_FAMILY >= CHIP_ARCTURUS
+    // ACC VGPRs at offset: size(ARCH VGPRs)
+    s_mov_b32	    m0, 0
+    s_set_gpr_idx_on	m0, 0x8								    //M0[7:0] = M0[7:0] and M0[15:12] = 0x8
+
+  L_RESTORE_ACCVGPR_LOOP:
+    read_4vgprs_from_mem(s_restore_buf_rsrc0, s_restore_mem_offset)
+
+    for var vgpr = 0; vgpr < 4; ++ vgpr
+        v_accvgpr_write acc[vgpr], v[vgpr]
+    end
+
+    s_add_u32	    m0, m0, 4								    //next vgpr index
+    s_add_u32	    s_restore_mem_offset, s_restore_mem_offset, 256*4			    //every buffer_load_dword does 256 bytes
+    s_cmp_lt_u32    m0, s_restore_alloc_size						    //scc = (m0 < s_restore_alloc_size) ? 1 : 0
+    s_cbranch_scc1  L_RESTORE_ACCVGPR_LOOP						    //VGPR restore (except v0) is complete?
+  L_RESTORE_ACCVGPR_END:
+#endif
+
+    s_set_gpr_idx_off
+
+    // Restore VGPRs 0-3 last, no longer needed.
+    read_4vgprs_from_mem(s_restore_buf_rsrc0, s_restore_mem_offset_save)
 
     /*		restore SGPRs	    */
     //////////////////////////////
@@ -974,6 +973,21 @@ function check_if_tcp_store_ok
 L_TCP_STORE_CHECK_DONE:
 end
 
+function write_4vgprs_to_mem(s_rsrc, s_mem_offset)
+	buffer_store_dword v0, v0, s_rsrc, s_mem_offset slc:1 glc:1
+	buffer_store_dword v1, v0, s_rsrc, s_mem_offset slc:1 glc:1  offset:256
+	buffer_store_dword v2, v0, s_rsrc, s_mem_offset slc:1 glc:1  offset:256*2
+	buffer_store_dword v3, v0, s_rsrc, s_mem_offset slc:1 glc:1  offset:256*3
+end
+
+function read_4vgprs_from_mem(s_rsrc, s_mem_offset)
+	buffer_load_dword v0, v0, s_rsrc, s_mem_offset slc:1 glc:1
+	buffer_load_dword v1, v0, s_rsrc, s_mem_offset slc:1 glc:1 offset:256
+	buffer_load_dword v2, v0, s_rsrc, s_mem_offset slc:1 glc:1 offset:256*2
+	buffer_load_dword v3, v0, s_rsrc, s_mem_offset slc:1 glc:1 offset:256*3
+	s_waitcnt vmcnt(0)
+end
+
 function write_vgpr_to_mem_with_sqc(v, s_rsrc, s_mem_offset)
 	s_mov_b32 s4, 0
 
@@ -1008,9 +1022,9 @@ function get_vgpr_size_bytes(s_vgpr_size_byte)
     s_add_u32	   s_vgpr_size_byte, s_vgpr_size_byte, 1
     s_lshl_b32	   s_vgpr_size_byte, s_vgpr_size_byte, (2+8) //Number of VGPRs = (vgpr_size + 1) * 4 * 64 * 4	(non-zero value)   //FIXME for GFX, zero is possible
 
-if ASIC_TARGET_ARCTURUS
+#if ASIC_FAMILY >= CHIP_ARCTURUS
     s_lshl_b32     s_vgpr_size_byte, s_vgpr_size_byte, 1  // Double size for ACC VGPRs
-end
+#endif
 end
 
 function get_sgpr_size_bytes(s_sgpr_size_byte)
@@ -1023,6 +1037,32 @@ function get_hwreg_size_bytes
     return 128 //HWREG size 128 bytes
 end
 
+function get_num_arch_vgprs(s_num_arch_vgprs)
+#if ASIC_FAMILY >= CHIP_ALDEBARAN
+    // VGPR count includes ACC VGPRs, use ACC VGPR offset for ARCH VGPR count.
+    s_getreg_b32    s_num_arch_vgprs, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_ACCV_OFFSET_SHIFT,SQ_WAVE_GPR_ALLOC_ACCV_OFFSET_SIZE)
+#else
+    s_getreg_b32    s_num_arch_vgprs, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE)
+#endif
+
+    // Number of VGPRs = (vgpr_size + 1) * 4
+    s_add_u32	    s_num_arch_vgprs, s_num_arch_vgprs, 1
+    s_lshl_b32	    s_num_arch_vgprs, s_num_arch_vgprs, 2
+end
+
+#if ASIC_FAMILY >= CHIP_ALDEBARAN
+function get_num_acc_vgprs(s_num_acc_vgprs, s_tmp)
+    // VGPR count = (GPR_ALLOC.VGPR_SIZE + 1) * 8
+    s_getreg_b32    s_num_acc_vgprs, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE)
+    s_add_u32	    s_num_acc_vgprs, s_num_acc_vgprs, 1
+    s_lshl_b32	    s_num_acc_vgprs, s_num_acc_vgprs, 3
+
+    // ACC VGPR count = VGPR count - ARCH VGPR count.
+    get_num_arch_vgprs(s_tmp)
+    s_sub_u32	    s_num_acc_vgprs, s_num_acc_vgprs, s_tmp
+end
+#endif
+
 function ack_sqc_store_workaround
     if ACK_SQC_STORE
         s_waitcnt lgkmcnt(0)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index f0b5ac4eb849..f5a290999eb5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -656,11 +656,14 @@ static void kfd_cwsr_init(struct kfd_dev *kfd)
 			BUILD_BUG_ON(sizeof(cwsr_trap_gfx8_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_gfx8_hex;
 			kfd->cwsr_isa_size = sizeof(cwsr_trap_gfx8_hex);
-		} else if (kfd->device_info->asic_family == CHIP_ARCTURUS
-			|| kfd->device_info->asic_family == CHIP_ALDEBARAN) {
+		} else if (kfd->device_info->asic_family == CHIP_ARCTURUS) {
 			BUILD_BUG_ON(sizeof(cwsr_trap_arcturus_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_arcturus_hex;
 			kfd->cwsr_isa_size = sizeof(cwsr_trap_arcturus_hex);
+		} else if (kfd->device_info->asic_family == CHIP_ALDEBARAN) {
+			BUILD_BUG_ON(sizeof(cwsr_trap_aldebaran_hex) > PAGE_SIZE);
+			kfd->cwsr_isa = cwsr_trap_aldebaran_hex;
+			kfd->cwsr_isa_size = sizeof(cwsr_trap_aldebaran_hex);
 		} else if (kfd->device_info->asic_family < CHIP_NAVI10) {
 			BUILD_BUG_ON(sizeof(cwsr_trap_gfx9_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_gfx9_hex;
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
