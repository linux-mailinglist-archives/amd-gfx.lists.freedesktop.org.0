Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B27C895
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 18:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8505E89791;
	Wed, 31 Jul 2019 16:26:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C534989791
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 16:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBbxkVu6gzlbb6ifhKuP6t5fL86GjGBakeBNKmArLB5pkWgo4hxC0zG0/pvK8Voy7EbAZ4kMjtB6VzYG5deCuixqXxd6PUUdz8ecNlfXpCEPUL4uXdmQIqaWpY2loVCWs5cEw45W4rwM3qg4mx37Ld8WYALAVCA21dMnfKsGuykIWGM6gsnw6stpKt1aZ49xchBRnn6w6AcryGOagPJek7qHH0feeecusJM84e5fYuAM/u94lFnnOzvJDvYKHN6VB2HLSLwem2Zrnjp5k1ejaZ8LeH6iTY2KwAGhC5FL4RKQivq0udBdknrN0XNsCxRNuxCBouRFYeSDubCn33gmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv4fcBOEoTx00mKgWfjw2dCvmzpv3A92LXjHedFIzrw=;
 b=ESX9eETj3btXOkN3iB12S8i89LLyKUE2lYajaHLAP1Th85pqSFiH26Xmjhid4l7UEiLh/Dt6r2THy/rWsLLlEQnt21Jsy8GH7bVz1Umc+UmCUbisOD5bnnh6Edi58/CtletWBrim2s1/fErARssQoEeD7e0szYoq8bHS2c3NG8JnIOWc0QipOgQhRLYo6ovv2qWkzNfpz5WhPhuc4TeYItMcuvHcyw8qg9gW8mUayJX3sI76qFqr+UWRVbiljVfm7mKCqFKcVLCIKTgXU1iXaZR6/8cKw80qx7b0NHHey35tDmFrkHu5e9IqtBs86W84tN/PaU+3TIx9KAs+tVOguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0035.namprd12.prod.outlook.com (2603:10b6:301:2::21)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:2a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Wed, 31 Jul
 2019 16:26:10 +0000
Received: from CO1NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR12CA0035.outlook.office365.com
 (2603:10b6:301:2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Wed, 31 Jul 2019 16:26:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT053.mail.protection.outlook.com (10.152.81.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Wed, 31 Jul 2019 16:26:10 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 31 Jul 2019
 11:26:09 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/display: Allow cursor async updates for
 framebuffer swaps
Date: Wed, 31 Jul 2019 12:26:02 -0400
Message-ID: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(81166006)(7696005)(47776003)(70206006)(16586007)(50466002)(316002)(53416004)(478600001)(54906003)(2906002)(2351001)(5660300002)(15650500001)(51416003)(486006)(476003)(14444005)(8936002)(126002)(44832011)(426003)(6666004)(6916009)(36756003)(2616005)(8676002)(70586007)(1076003)(48376002)(305945005)(68736007)(86362001)(26005)(336012)(81156014)(53936002)(356004)(186003)(50226002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2542; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb35470d-c420-4803-994a-08d715d3cc4b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN1PR12MB2542; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2542C9903F72660E3B11B030ECDF0@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fYax0301Dxusen3pMQvvpeKx97medOesU3HlwEA2R6cKGAKx+d6aTHgrhmPrTAHvciIkRfpSAlrDRB2lwR+8Dy4cDUwmZsnLksK5/uDOs61jBU6Qz8KGBfQeUpY9m5fDHKRXRw4TVc1RnbrUtUpFfe57L6xlo5VdGylKVVI5HbdVC0MpZA+UbPL/xWJe7vxktiE8PZYjDfiFikPE1D4GwHaP9J0D8oYJPkq94gkbrJfotUDw7sHDCIA7RzAaZNGJw3+NfTLVGePVz7OWtDK7l/SXFbBB8l9AMMvdMHanzcyYPjn5HyULze7JDSUnHVWRLv6JMer2HLQx92G2PhkWuhDo5FhqLehx9Hs+KzK+UpKyWRJYxKJk2dEDixfwOZLPw5LG5A3x/DGFGReE0Ek8O9As2LB35u7KmLy1LVjC0wA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 16:26:10.3932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb35470d-c420-4803-994a-08d715d3cc4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv4fcBOEoTx00mKgWfjw2dCvmzpv3A92LXjHedFIzrw=;
 b=jOCnPRkJacZu7g00J32ThOltRH8puqtp3cjMYewPO2Y0iHknwfSCUCRrZt89Vp8nelnSit5oOAvsLehOiajKLqDyzOD3y+We5V+x+FESmAaDbj7wE+KlEb+xgXzoYeUzZ+KLsnD6I27ux2Wa7abQvD9m5pgcDA35WTc014O5hy8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <david.francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgcHJldmlvdXNseSBhbGxvd2VkIGZyYW1lYnVmZmVyIHN3YXBzIGFzIGFzeW5jIHVw
ZGF0ZXMgZm9yIGN1cnNvcgpwbGFuZXMgYnV0IGhhZCB0byBkaXNhYmxlIHRoZW0gZHVlIHRvIGEg
YnVnIGluIERSTSB3aXRoIGFzeW5jIHVwZGF0ZQpoYW5kbGluZyBhbmQgaW5jb3JyZWN0IHJlZiBj
b3VudGluZy4gVGhlIGNoZWNrIHRvIGJsb2NrIGZyYW1lYnVmZmVyCnN3YXBzIGhhcyBiZWVuIGFk
ZGVkIHRvIERSTSBmb3IgYSB3aGlsZSBub3csIHNvIHRoaXMgY2hlY2sgaXMgcmVkdW5kYW50LgoK
VGhlIHJlYWwgZml4IHRoYXQgYWxsb3dzIHRoaXMgdG8gcHJvcGVybHkgaW4gRFJNIGhhcyBhbHNv
IGZpbmFsbHkgYmVlbgptZXJnZWQgYW5kIGlzIGdldHRpbmcgYmFja3BvcnRlZCBpbnRvIHN0YWJs
ZSBicmFuY2hlcywgc28gZHJvcHBpbmcKdGhpcyBub3cgc2VlbXMgdG8gYmUgdGhlIHJpZ2h0IHRp
bWUgdG8gZG8gc28uCgpbSG93XQpEcm9wIHRoZSByZWR1bmRhbnQgY2hlY2sgZm9yIG9sZF9mYiAh
PSBuZXdfZmIuCgpXaXRoIHRoZSBwcm9wZXIgZml4IGluIERSTSwgdGhpcyBzaG91bGQgYWxzbyBm
aXggc29tZSBjdXJzb3Igc3R1dHRlcmluZwppc3N1ZXMgd2l0aCB4Zjg2LXZpZGVvLWFtZGdwdSBz
aW5jZSBpdCBkb3VibGUgYnVmZmVycyB0aGUgY3Vyc29yLgoKSUdUIHRlc3RzIHRoYXQgc3dhcCBm
cmFtZWJ1ZmZlcnMgKC12YXJ5aW5nLXNpemUgZm9yIGV4YW1wbGUpIHNob3VsZAphbHNvIHBhc3Mg
YWdhaW4uCgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBEYXZpZCBGcmFuY2lz
IDxkYXZpZC5mcmFuY2lzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNr
YXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTAgLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDA0MDE2OTE4MGE2My4uMmVmYjBlYWRmNjAy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKQEAgLTQ1MDQsMjAgKzQ1MDQsMTAgQEAgc3RhdGljIGludCBkbV9wbGFuZV9hdG9taWNf
Y2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiBzdGF0aWMgaW50IGRtX3BsYW5lX2F0b21p
Y19hc3luY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJCQkgICAgICAgc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlKQogewotCXN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSA9Ci0JCWRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0
ZShuZXdfcGxhbmVfc3RhdGUtPnN0YXRlLCBwbGFuZSk7Ci0KIAkvKiBPbmx5IHN1cHBvcnQgYXN5
bmMgdXBkYXRlcyBvbiBjdXJzb3IgcGxhbmVzLiAqLwogCWlmIChwbGFuZS0+dHlwZSAhPSBEUk1f
UExBTkVfVFlQRV9DVVJTT1IpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JLyoKLQkgKiBEUk0gY2Fs
bHMgcHJlcGFyZV9mYiBhbmQgY2xlYW51cF9mYiBvbiBuZXdfcGxhbmVfc3RhdGUgZm9yCi0JICog
YXN5bmMgY29tbWl0cyBzbyBkb24ndCBhbGxvdyBmYiBjaGFuZ2VzLgotCSAqLwotCWlmIChvbGRf
cGxhbmVfc3RhdGUtPmZiICE9IG5ld19wbGFuZV9zdGF0ZS0+ZmIpCi0JCXJldHVybiAtRUlOVkFM
OwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
