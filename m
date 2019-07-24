Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923487313F
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283266E59C;
	Wed, 24 Jul 2019 14:11:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790054.outbound.protection.outlook.com [40.107.79.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80EC6E59C
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:11:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cieU0fF/K3sw84cszBS3QmhAk23nqCB9WQehR/boULHAnOpwDG1DVRYDIFw41NvIZsBzt1NCKOpKNMFHa5ybYh31WrC2YzJh4XiB+UK61V3JOJsClspBwCNj6roWQ5bACElsiK2z1r0sSmFPErmSzKqbrhLCTfvgzUmwdpCIjxRZLu7he7GHDqZvXvgEcwgbnooIqtWx2eF9i0yxESsDxUjmrNX13vAJcqLGOj2BA+gqnbeFJI0im+v9+vt8ZIjO8WxtvJrSBn3vI3s8hkf/UtDytdgk4/32iGb/h2HoRS6M5FVZuUdTN1RzmUak782TU6QzwHTR0nNAO+PhXE5Erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnmKfSERh6ywbcITg4OOBsPQRcKTPtmtFXmphIneGqY=;
 b=JaoLk2tanjkdVaBqYYLJtMpc3gWou2anWC/Ur6g1V/v1ue4uOvkHLk5i2jEJSh0ntHfylLpXyFpW4YYIFhYoHc2uhgYQwyGWBu7RlsqzmY/8/DYLZGo45r2dq2oSGg92KGeK6bDphbJX24pkRvFiI9eMD+RHhM6mSsfEUARAoQ5739yooMv1tvliiWilPHgIR/Wm0MewV3Jx6gM7XgV3HckYMQu9EVzY/0+6Yx4wwBsLEwN//i5RV3XPpTJul7aaM/wQjhQH7OOSXdTpWmO9o2sZuj8dMhJ0yAY9Hx6IBy/232wFB1Ktk2CvACDPAIJkBCQPWr9eLD3ZKPGgIbuz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:910:16::33) by BN6PR12MB1299.namprd12.prod.outlook.com
 (2603:10b6:404:1d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Wed, 24 Jul
 2019 14:11:07 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CY4PR1201CA0023.outlook.office365.com
 (2603:10b6:910:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Wed, 24 Jul 2019 14:11:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Wed, 24 Jul 2019 14:11:06 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 09:11:05 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 0/3] Enable S/G for Picasso
Date: Wed, 24 Jul 2019 10:10:39 -0400
Message-ID: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(486006)(47776003)(50226002)(316002)(53936002)(478600001)(44832011)(336012)(16586007)(8676002)(476003)(2616005)(8936002)(305945005)(2351001)(126002)(86362001)(26005)(6666004)(356004)(5660300002)(68736007)(53416004)(51416003)(70206006)(70586007)(6916009)(36756003)(7696005)(426003)(81156014)(2906002)(4744005)(50466002)(186003)(81166006)(54906003)(4326008)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1299; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2993405d-884a-4aa1-1407-08d71040c561
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1299; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1299:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1299F4A1460198105B6ADA43EAC60@BN6PR12MB1299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: l6lIaiKywDcc75dr2QmzRDotGqb1Hgfg3grMrOD3PsSNd2p9kj2D51rl/ug8UKV/r3tFAesKbr64WadR86cHjYVMMlAI6tVTHrvq5X8HLLg2KX90MibPQ1s4moxTUFHVDCV0WmSkGzHZ1ky2KC7QZNOI3OwwTMPCuydD87rWxHyWcQCGlpHM5YEMO43Fu8ec8T7focQhYShKB2uxo4u/NQXhJQXr0pjMvrFTcoP64T3wgBkKEoHjkBquZ+62/mgP+qK84Pk438JE3zXL368Vj2Comhb2P/b1swa07Ih2Ayt8EKhB3MWElSE5pqgncYgxnsXzN3zxnxv48BDQ6Fr8FYw1NklpsI5haPDkSKZJn4mBkUHYCLrpiPgDs2WxFHPwGqjM4XRU9jAPusBghC2T28KNuLz2r47p2mJmanpPtTs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 14:11:06.9727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2993405d-884a-4aa1-1407-08d71040c561
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnmKfSERh6ywbcITg4OOBsPQRcKTPtmtFXmphIneGqY=;
 b=Yjp3yAPqNQKhU3H+Dd3Xt3/T56GtaMislCPder0sA/Lj3DIqreD8wkYgpH8OfbSDscLwI+ELa0jJV7czceYOWYT42SGdvJ1hVOy3xDl0QittEBIcn2n7rz/1Tvdcs/pGCFgJcEKKeCZnfxqzE7qy2R/Ner+wVigTiGLr13w6Ojg=
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
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rmlyc3QgdHdvIHBhdGNoZXMgZml4IGEgaGFyZCBoYW5nIGludHJvZHVjZWQgYnkgcGxhY2luZyB0
aGUgZGlzcGxheSBCTyBpbiAKR1RUIG1lbW9yeSBiZWNhdXNlIG9mIEhXIGlzc3VlcyB3aXRoIGNh
Y2hlZCBtYXBwaW5ncy4gU2Vjb25kIHBhdGNoIGRvZXMKc29tZSBtaW5vciByZWFmYWN0b3Jpbmcg
dG8gcmVzdWUgY29kZSBpbiB0aHJpZCBwYXRjaC4gTGFzdCBwYXRjaCBlbmFibGVzIFMvRy4KCkFu
ZHJleSBHcm9kem92c2t5ICgyKToKICBkcm0vYW1kZ3B1OiBGaXggaGFyZCBoYW5nIGZvciBTL0cg
ZGlzcGxheSBCT3MuCiAgZHJtL2FtZGdwdTogQ3JlYXRlIGhlbHBlciB0byBjbGVhciBBTURHUFVf
R0VNX0NSRUFURV9DUFVfR1RUX1VTV0MKClNoaXJpc2ggUyAoMSk6CiAgZHJtL2FtZDogZW5hYmxl
IFMvRyBmb3IgUkFWRU4gY2hpcAoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
aXNwbGF5LmMgICAgICAgfCAxNiArKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9mYi5jICAgICAgICAgICAgfCAgNyArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uYyAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jICAgICAgICB8IDYzICsrKysrKysrKysrKystLS0tLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggICAgICAgIHwgIDIgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAyICst
CiA2IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
