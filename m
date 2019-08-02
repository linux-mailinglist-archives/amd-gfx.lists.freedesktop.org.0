Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC28020D
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 22:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB86E49C;
	Fri,  2 Aug 2019 20:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804C36E48E
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 20:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljkd8QGGOZG/6GzWPTXarJyXofSpY3c0TLCFBpNPW+8PQSyCG8sA5Xl8nWRbyl6nb73xtRk629Xft6zZ1TA7fBXlXASS6mYgmlNkuoQ78axyY2dMgmLy1bVA364VnyjB74S7Y9CC4wVfSKuXy4dlZVnFGe4N3HptrB0etg+qisa00g3Mg7IPCV5GiKcHi6Dw4uv2br1pbmZZbu+7DCnc+JpEmvB5PaCbFujOo/zlF6+CIUvDRUoXHVp/kNZ6OlzDbmfJIvmfxolEFs2jNivYUf5EuLSWQFuS0lT1LH92mvI4W7TDGb061F9KWS2kTXuoODQKta2ORTaOrMog4Bb7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7K3gOmH5fc1zLC7fb8lJ8TLqm7n7v/HNtcVMWEkR3w=;
 b=FAjOVDwIGTnRMqY/m/zq6mpizUH/i/OsG0xEtjbsmYnKg7x1KPCraIzsMkYK4E6QDb8wI10WownhBz4DStYgSm1SbYR6QtQxPfP78Yr0cBuDN5rNlSqIQnkK3VIK3S4+rzEieIAS9fQkbg/fuXeq08pFwJ3eLpekq5CEoO/TaM1AXxtilrEZPhLqUPqc3zap5rCHekfnUwLCmGE1gJjAABDTGXSyVCY6yPwkIaq35BJAczg2TZ7U9btmURNMB6rAR0ZycXBSiejZpHjr6DFHQGrOqrcRBwJUEGezlwS4HMm7jA5+dC7eVjJRLEp77O9CQos0614iRjzvtQAnghTBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0096.namprd12.prod.outlook.com (2603:10b6:802:21::31)
 by CY4PR12MB1141.namprd12.prod.outlook.com (2603:10b6:903:44::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Fri, 2 Aug
 2019 20:53:12 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by SN1PR12CA0096.outlook.office365.com
 (2603:10b6:802:21::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Fri, 2 Aug 2019 20:53:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 20:53:12 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Fri, 2 Aug 2019 15:53:10 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix GPU reset crash regression.
Date: Fri, 2 Aug 2019 16:53:04 -0400
Message-ID: <1564779184-22641-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(2980300002)(428003)(189003)(199004)(186003)(4744005)(8936002)(86362001)(26005)(70586007)(5660300002)(316002)(54906003)(70206006)(2616005)(16586007)(36756003)(7696005)(51416003)(6666004)(356004)(14444005)(53936002)(2906002)(4326008)(50466002)(305945005)(47776003)(2351001)(478600001)(8676002)(336012)(126002)(50226002)(44832011)(81156014)(6916009)(68736007)(53416004)(486006)(48376002)(426003)(81166006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1141; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15090751-cebc-4d1f-532b-08d7178b6ed0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1141; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1141:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1141582BD82E7DC98F83407DEAD90@CY4PR12MB1141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gLX4SuxwdKkebn36hvsXDxRSQggfmnPRLpUhf8JAFJ6x5MzjEQhm0iVr9/1OgkH3qpHZvJ+diaatgCqH9mhae6mi48UALYzd5yedNoqch2it3qmSE/gGTfs8qhGDkkobwhzhz/vhapqp4t3SYM3i87/5cuqpfNth8gvWdWJvGLu7HhT8uwDw3EJM3w3iHiM7/6bsw13R1un8CWAJGVOCdoKTztOkgp1Ey6ZvboOWgN5gX9pHM/sVVj8dc1nNePna6B5IRNGL7tN/aIJyDC26DVNyrOmZtCHPiZZdk5e4YyIE0xT2GZi5PLXuhExOSQygySlgi7vq73SRx6QW+sdQbK3421CXD5FRuxUv3NjD7n86aHf2aMKWyP8JvltBSWj7IR48vAnhogm+z9+U3+l7qZe1nkYHLWt90h1EqBI1k7Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 20:53:12.1592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15090751-cebc-4d1f-532b-08d7178b6ed0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7K3gOmH5fc1zLC7fb8lJ8TLqm7n7v/HNtcVMWEkR3w=;
 b=jihXcg6bUUIRdZpRjeRyglItoGWvH9OsE8sO/uXQARKOPw/heqXHNxZZjjoZaWJqrLYxosWxXnE15SprbdOU/QwleiaDUPzLMl9EADHNZUpRRiyge+UFmxjqDkU9NizKrx+phE07FQn1udjN+9GMqF2S2mw/2nZezcMtfOoy7CI=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Monk.Liu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X2lwX2Jsb2NrLnN0YXR1cy5odyBmb3IgR01DIHdhc24ndCBzZXQgdG8KZmFsc2Ugb24g
c3VzcGVuZCBkdXJpbmcgR1BVIHJlc2V0IGFuZCBzbyBvbiByZXN1bWUgZ21jX3Y5XzBfcmVzdW1l
Cndhc24ndCBjYWxsZWQuCkNhdXNlZCBieSAnZHJtL2FtZGdwdTogZml4IGRvdWJsZSB1Y29kZSBs
b2FkIGJ5IFBTUCh2MyknCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpp
bmRleCAzMWFiZDg4Li42N2ExZjU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCkBAIC0yMjcwLDkgKzIyNzAsMTAgQEAgc3RhdGljIGludCBhbWRncHVfZGV2
aWNlX2lwX3N1c3BlbmRfcGhhc2UyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJ
ICBhZGV2LT5tcDFfc3RhdGUsIHIpOwogCQkJCQlyZXR1cm4gcjsKIAkJCQl9Ci0JCQkJYWRldi0+
aXBfYmxvY2tzW2ldLnN0YXR1cy5odyA9IGZhbHNlOwogCQkJfQogCQl9CisKKwkJYWRldi0+aXBf
YmxvY2tzW2ldLnN0YXR1cy5odyA9IGZhbHNlOwogCX0KIAogCXJldHVybiAwOwotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
