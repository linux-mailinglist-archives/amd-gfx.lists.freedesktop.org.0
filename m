Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC682D9D
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 10:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D3889D84;
	Tue,  6 Aug 2019 08:21:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770044.outbound.protection.outlook.com [40.107.77.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C287789D84
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 08:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE3mSbCOS0kaNje1a+3ZASwV8Nv9x3e23s4gEOYilWfuOmB4LvdKWz5WKnp1w9/4xm9Y3wTEdNFzciuP/GJXZlzuOHrDERzTnSoomB1Wz+azQlAzeNP56+jXj4lID73K+hAFQ200gTpUBtSej4w9RdBq7e9cFF94DroZnWTr2TSPgig1oMnsy8YiXfTlV6Z5gjCoE4JSdghUs/47nKnJL24db1o0NS2IcKg+QNgGxpqPEC1Wtc99rZzTC4/lOKCqVdrwKJFNb4Fv94N0gkPyekJezgwo3e99Bb1Fb6J7Bh5/DvoCtfcv+h2VFeakuGCkPSftI2qsm4fFduFq1fmQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ322NvGjQ6gSytYb5krivenR8jxMRaB4O8XyHh7A9c=;
 b=bxnai4DSqJepgHfrYWA/4QMtkrJ2E+sC8pR/SMaczxdqB90QsSWOmVcNEOZKHCvRG9cr+xALPKylcE8Hlu46GnCUgQp0YgkJWhdrBjnd5lVFQAUraxYRqK9pwWHB1FkYIJnoFasbyZiZkDhZYU7SyxwrfAwjiyp83lNVK5XwtaoVSHKAnur0BZxwZnNqH/E55ARz+7DbW4oagCcrvZojIoT3IILOtWOpMtqFohMTgu2hUT/wjGx1VgGON6XqB6lQIF6jVo9O94sphqkhgLT1rMyTDMWUTh8hxiYDskHSQ7Y1kExPXVwOJQ3/t8ks6OtX5LzXKaP1AAVqyLG9JE6lDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by BN6PR12MB1603.namprd12.prod.outlook.com
 (2603:10b6:405:b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Tue, 6 Aug
 2019 08:21:28 +0000
Received: from DM3NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Tue, 6 Aug 2019 08:21:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT026.mail.protection.outlook.com (10.152.82.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Tue, 6 Aug 2019 08:21:28 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 6 Aug 2019
 03:21:27 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: check before issuing messages for max
 sustainable clocks
Date: Tue, 6 Aug 2019 16:21:20 +0800
Message-ID: <20190806082120.3352-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(51416003)(356004)(50226002)(7696005)(2870700001)(478600001)(81166006)(81156014)(15650500001)(6666004)(426003)(6916009)(4326008)(26005)(2906002)(8936002)(86362001)(5660300002)(2351001)(305945005)(48376002)(486006)(50466002)(44832011)(36756003)(2616005)(476003)(47776003)(126002)(70586007)(70206006)(1076003)(336012)(186003)(53416004)(316002)(8676002)(4744005)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1603; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efee718c-c125-4b12-1c21-08d71a471457
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1603; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1603:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1603BBC43DD306FED39E2D10E4D50@BN6PR12MB1603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-Forefront-PRVS: 0121F24F22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AbSbpNYFOqX2bSBriqoQYlqzWWFqsZHVRMdMZ2VToc6teKmQ3zoasV23cjDHwlaMvqPXH7umgR+/rz9ha/8zPyT0nIOmbfX1r0ua5D3+hy3VxUqQB4zTxd/D3nnxHvVO7p7t+qsHXqRldUwWSXaJTdJBI/+C1lnmdD6WXSgPPbRPtOWIg7qcAbn+AW44AVb9KteoF97nu4HzJFVBw6babUsL5TO2iKeJnp6i9dpplYKbphdH5sl10cX5/zDl3cjt+V0H2fo9UjD6tfXVZtHEQ8M8PKtvmq2inzdTc+K/FglmN56/GvwKhwbeWjTAPrWTCn0yIi5AFvYwA6ijr4zkO5VwkVzfh5XjQmrKw20BYUHqOwmqwNf8WAmLtiCauEwm6zIee/sceGR/UaCe8el3iZg7hmRgilza8koyfTrXJtU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 08:21:28.1407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efee718c-c125-4b12-1c21-08d71a471457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1603
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ322NvGjQ6gSytYb5krivenR8jxMRaB4O8XyHh7A9c=;
 b=Gu9ltvlRNpZqMAaiyq2O0VtMlo31ix5Al79wgh48wLYWMhrQYTAb1MPQbKY7eyKPbPFLAMhm37lOzWJeLBespHIV7Wp/8xRLQukhdKkTy4UMzaSxX/AhVPOA0iPLSimZ3x993/4GJvtc7olSpjTnlbkuU6zEJSj66Df9v4qh8qU=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhvc2UgbWVzc2FnZXMgYXJlIG5vdCBzdXBwb3J0ZWQgb24gQXJjdHVydXMgYW5kIHNob3VsZCBu
b3QgYmUKaXNzdWVkLgoKQWZmZWN0ZWQgQVNJQzogQXJjdHVydXMKCkNoYW5nZS1JZDogSTM5MTA5
OWZjMjhlMDAzNTYyMzRmZDJhZTdiNjhmNTg2MWZkNGMxNDcKU2lnbmVkLW9mZi1ieTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggODRlYjE0YTY2
NTBmLi4yZGRiNGVjNzUzMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTFfMC5jCkBAIC05MDUsNiArOTA1LDEwIEBAIHNtdV92MTFfMF9nZXRfbWF4X3N1c3RhaW5hYmxl
X2Nsb2NrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAqY2xvY2ssCiAJaWYgKCFz
bXUtPnBtX2VuYWJsZWQpCiAJCXJldHVybiByZXQ7CiAKKwlpZiAoKHNtdV9tc2dfZ2V0X2luZGV4
KHNtdSwgU01VX01TR19HZXREY01vZGVNYXhEcG1GcmVxKSA8IDApIHx8CisJICAgIChzbXVfbXNn
X2dldF9pbmRleChzbXUsIFNNVV9NU0dfR2V0TWF4RHBtRnJlcSkgPCAwKSkKKwkJcmV0dXJuIDA7
CisKIAljbGtfaWQgPSBzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsb2NrX3NlbGVjdCk7CiAJaWYg
KGNsa19pZCA8IDApCiAJCXJldHVybiAtRUlOVkFMOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
