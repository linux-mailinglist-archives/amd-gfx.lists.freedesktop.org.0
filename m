Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D588DE1A
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 21:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5324A6E822;
	Wed, 14 Aug 2019 19:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC816E821
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 19:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai68nWzTdrkcXRtuacOAcekqzMiQ/dxSJNYrnetnp0j59yiA/9XaDFhv9bvKuznHcx+uOMwpIzSGDq6bDgIJgoBpFyyLLyAzxGxHTX7lgrzjcyWZLCA0XMLnuVV/NbzzfgqTHRGIJP7nqfCOlNS1dwhqnYz9K1CsGpJMh1HCb9TSgaciypnR5xnjM3K70YJZ6EomleHEB5RTLOo9JHY+eFXtn422MFQeUSh9/PJsayQIdpf4xkVuYAKiQUSbZbiE8tOEs4xWEBj43RF1qZb31XI17w//FlD8r6Pyq8rfnr/F3Pxs5wh+x1Mwb5iHJ3z92WgK+S1kVuWCnvNGw12tkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyhLseza90rF/Nm+oa7fQc/2rbirhV+UKzc3XYJWd7c=;
 b=VOcCZC1imHDd4CxozKMj7q5RxwTq5RvWcZLG35CSJGg5KU+4pjM/JPPeEiYh5ryh5moYWI9JKdxW8M6il3bV8D0HktGQFrPsSJhORZdyIMSZDrBqp2dIF6imx8SvoPSl08Wn+OaD45xBGFDXONmLN1wJpG5OVhqxz4alx47H+Pc+FFl7XyC+c/fhhWPHPZWiZTBbBvjMf00canzcVRwJfiickKrLYqtOKyhEtYk+jzIiSE/Oc6k2VvCATnT2aeiGMcObjcgBg7O3c144B0XM05OjeukMi7Nzs2nvMAX6Uf+ta+HbEwjYzz7KnjvFJQQHw/giLJKcAVlQ0QIWK5UgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0031.namprd12.prod.outlook.com (2603:10b6:208:a8::44)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Wed, 14 Aug
 2019 19:53:47 +0000
Received: from BY2NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by MN2PR12CA0031.outlook.office365.com
 (2603:10b6:208:a8::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Wed, 14 Aug 2019 19:53:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT022.mail.protection.outlook.com (10.152.84.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 19:53:46 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 14:53:44 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] Add mode 2 GPU reset for RV2/Picasso
Date: Wed, 14 Aug 2019 15:53:31 -0400
Message-ID: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(346002)(396003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(126002)(70206006)(8676002)(5660300002)(50226002)(2906002)(8936002)(44832011)(4326008)(2616005)(476003)(70586007)(36756003)(81156014)(486006)(53936002)(81166006)(6916009)(478600001)(47776003)(2351001)(7696005)(316002)(4744005)(305945005)(186003)(86362001)(356004)(53416004)(6666004)(54906003)(336012)(50466002)(51416003)(48376002)(426003)(26005)(16586007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89984053-c0c4-4f73-8b40-08d720f11e7b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2706305C8436D6DE5CA9EE7DEAAD0@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gpa8Mu3KStpELg/hcYmd+r3U+eT+lXRWUtHZYG7lhFFnpu75Vyns4teJmu9NnYN3YfCtlTEI5PBSiph9++HMSXcf4NK/0gWM0qMd/Lcbwq5HX1v/EGNqzC+jWHFIoGWg0OKEVEtSyN07UDdRVf035Exw4+cLvBaX5XBd6Nt6o15hIOy6iY5FDENytdBPnCQMddKzor0HLmTKulP4MiIMYlyGVVrLoZrnu2TLzuGMhsZ/z4Eo0IJfigMxRsy/UPiKDA4uRHVIVFWjbzmwIvh/wC/YM3JDfmmCCZ2/xKrLvPJpyWRg2ihHyeDcPY+csiA9oKxziv4QNDj0r+1LYWlnra6+lHD5sCk/CykVdsJAHFFWCGchU58FgIMEUYxBPJjQJ6BWrhshFtTut5ninmeb0OLWi3qOv5RBQtDScnFLzkA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 19:53:46.5263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89984053-c0c4-4f73-8b40-08d720f11e7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyhLseza90rF/Nm+oa7fQc/2rbirhV+UKzc3XYJWd7c=;
 b=Zy1djIWJIwocnNhg6jXDWfLUsKCtJFUP8PKi+pL+s94NNho+5oi9UJPaI4CU8TdrAQY22N+CJFujCCcLiVRKxINlzSpQu/xU2LSGN9EMAjMlJ8BjE/8PM0VWVnhL3+v6sPo6VsP+rgHtTBHG6xScpEAchEwhM/J4DtHhOaOsZjQ=
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
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBhZGRzIG1vZGUgMiByZXNldCB0aHJvdWdoIFNNVSBmb3IgUlYyIGFuZCBQ
aWNhc3NvLgoKQW5kcmV5IEdyb2R6b3Zza3kgKDMpOgogIGRybS9hbWQvcG93ZXJwbGF5OiBGaXgg
bWVhbmluZyBvZiAweDFFIFBQU01DX01TRwogIGRybS9hbWQvcG93ZXJwbGF5OiBBZGQgc3VwcG9y
dCBmb3IgbW9kZTIgQVNJQyByZXNldC4KICBkcm0vYW1kZ3B1OiBVc2UgbmV3IG1vZGUyIHJlc2V0
IGludGVyZmFjZSBmb3IgUlYuCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMg
ICAgICAgICAgICAgICAgfCAyMSArKysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmggICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgICAgIHwgMjEgKysrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5j
IHwgIDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmgg
ICAgICAgICB8ICA5ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L3J2X3Bwc21jLmggICAgICB8ICAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
