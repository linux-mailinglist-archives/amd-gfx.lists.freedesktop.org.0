Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481363FAD
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 05:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886EA898E8;
	Wed, 10 Jul 2019 03:44:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5CF898E8
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 03:44:01 +0000 (UTC)
Received: from DM3PR12CA0063.namprd12.prod.outlook.com (2603:10b6:0:56::31) by
 MWHPR12MB1200.namprd12.prod.outlook.com (2603:10b6:300:9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Wed, 10 Jul 2019 03:43:59 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM3PR12CA0063.outlook.office365.com
 (2603:10b6:0:56::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Wed, 10 Jul 2019 03:43:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 10 Jul 2019 03:43:58 +0000
Received: from Build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 9 Jul 2019
 22:43:57 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] SWDEV-187506: drm/amdgpu: [Gibraltar][v320]VM-destroy3 (case
 29) failed 5/5
Date: Wed, 10 Jul 2019 11:43:37 +0800
Message-ID: <1562730217-1100-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(70206006)(336012)(426003)(47776003)(7696005)(2351001)(86362001)(2906002)(186003)(70586007)(81166006)(478600001)(26005)(53416004)(51416003)(81156014)(356004)(53936002)(14444005)(316002)(50466002)(6666004)(305945005)(50226002)(4326008)(5660300002)(126002)(2616005)(476003)(36756003)(486006)(48376002)(16586007)(8936002)(6916009)(8676002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1200; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09b9f6fc-3699-442e-eb2f-08d704e8d78c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1200; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1200:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1200C1C4027C1EF9A6AC0DB2EFF00@MWHPR12MB1200.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CR0RYhJSj6VgpX5PwpFb3BKLMLqwhYA5jXuyl9+TY70KXDY8yst24x5yzvdzQbzlrlBcQUHPl7VRKNLzpGM5PT7ON6SnH/BA3B+mteMr6a5spte8pVPRUUg0igBJecWEFq87/0HJBJbV03yhoD0Ii9uBK4SR8Ju6J6OMYQ7Svj8Cl2VMnt0tE2R6kWFUwedhem0cN7iS4As275JeTmZ3WmFX5Pml75oQOmf4iGIPtULxjRpmdeo3lNdvbpaN/ch/YstiugtzwJVdRPQYYAjJKu5cAxtzpsXwB1K6RCABel1z4Sn8pi3nF0UovnFGo6Q5/rJRHs7Pd4WG1cHXmLaQ1+Woc5fJirHag2wMSt21h9ircgLlSduCF01DU1PPq9TElkP/HRc4Mu7R4jR1b0SSs6LmqJ0qIrioIOrFctqesbw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 03:43:58.9393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b9f6fc-3699-442e-eb2f-08d704e8d78c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ASSyD+cZOy++JglXCFyaO4FMgjYd6PB+ZBZ4Q5gs+Q=;
 b=kICXfuaYVr50Wq5aDZlXqpJVh0wRXNV8vxyCCZHfD3iZaFk9ECFCXCr3bgsMltAL4bVdc/j+0UB1GchKZDMFGXySPZu9Hrfb+AZmFY0oMpcLSbzRuZG0GaeArIMsSBzxhfquw6pJDRl6SkN44nkeOyEbUDteWAG/aKvlVfKPC8g=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXNzdWU6IE9uIGhvc3QgUDUyMCB3aXRoIFMwM0ozMjI2QSBTQklPUyBwbGF0Zm9ybSwgcGFzc3Ro
cm91Z2ggYm90aApnZnggYW5kIGF1ZGlvIGRldmljZSB0byBWTSwgdGhlIGZpcnN0IHRpbWUgc3Rh
cnQgVk0gYWZ0ZXIgaG9zdCBib290dXAsCmRyaXZlciB3b3VsZSBsb2FkIGZhaWwuCgpSb290IGNh
dXNlOiBQYXNzdGhyb3VnaCBib3RoIGRldmljZXMgYWxsb3dzIFZGSU8gdG8gZG8gaG90IHJlc2V0
Cm9uIGJyaWRnZSwgdGhpcyByZXNldCBjbGVhcnMgcmVnaXN0ZXIgQklPU19TQ1JBVENIXzcgd2hp
Y2ggaXMgdXNlZApmb3IganVkZ2luZyBpZiBWQklPUyBoYXMgYmVlbiBwb3N0LiBTaW5jZSBpbiB0
aGUgZmlyc3QgdGltZSBkcml2ZXIKZG9lcyBub3QgZG8gQkFDTyByZXNldCB3aGVuIGxvYWRpbmcs
IFZCSU9TIHdvdWxkIGJlIHBvc3QgdHdpY2UuCgpTb2x1dGlvbjogV2hlbiBydW5uaW5nIGluIHBh
c3N0aHJvdWdoIG1vZGUsIGZvcmNlIGVuYWJsZSBCQUNPIHJlc2V0CmluIGV2ZXJ5IHRpbWUgbG9h
ZGluZyBkcml2ZXIuCgpOb3RpY2U6IFRoaXMgaXMgYSB3b3JrYXJvdW5kIGZvciBTV0RFVi0xODc1
MDYgaXNzdWUsIHBhc3N0aHJvdWdoIHR3bwpkZXZpY2VzIHRvIFZNIGlzIHJlcXVpcmVkLgoKU2ln
bmVkLW9mZi1ieTogSmVzc2UgWmhhbmcgPHpoZXhpLnpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYwppbmRleCA5ZDMzYmE0Li43OTAwOTlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKQEAgLTczOCwxNSArNzM4LDE2IEBAIHN0YXRpYyBib29sIHNvYzE1X25lZWRfcmVzZXRfb25f
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgc29sX3JlZzsKIAotCWlm
ICghYW1kZ3B1X3Bhc3N0aHJvdWdoKGFkZXYpKQotCQlyZXR1cm4gZmFsc2U7Ci0KIAlpZiAoYWRl
di0+ZmxhZ3MgJiBBTURfSVNfQVBVKQogCQlyZXR1cm4gZmFsc2U7CiAKIAkvKiBDaGVjayBzT1Mg
c2lnbiBvZiBsaWZlIHJlZ2lzdGVyIHRvIGNvbmZpcm0gc3lzIGRyaXZlciBhbmQgc09TCiAJICog
YXJlIGFscmVhZHkgYmVlbiBsb2FkZWQuCiAJICovCisKKwlpZiAoYW1kZ3B1X3Bhc3N0aHJvdWdo
KGFkZXYpKQorCQlyZXR1cm4gdHJ1ZTsKKwogCXNvbF9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAw
LCBtbU1QMF9TTU5fQzJQTVNHXzgxKTsKIAlpZiAoc29sX3JlZykKIAkJcmV0dXJuIHRydWU7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
