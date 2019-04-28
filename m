Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A4CB5D4
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 12:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2799889142;
	Sun, 28 Apr 2019 10:25:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780083.outbound.protection.outlook.com [40.107.78.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7349289142
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 10:25:24 +0000 (UTC)
Received: from MN2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:208:a8::35)
 by CY1PR12MB0651.namprd12.prod.outlook.com (2a01:111:e400:c43c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12; Sun, 28 Apr
 2019 10:25:22 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by MN2PR12CA0022.outlook.office365.com
 (2603:10b6:208:a8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Sun, 28 Apr 2019 10:25:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Sun, 28 Apr 2019 10:25:21 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Sun, 28 Apr 2019
 05:25:20 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu:  Unmap CSA under SR-IOV in KFD path
Date: Sun, 28 Apr 2019 18:25:15 +0800
Message-ID: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39850400004)(376002)(346002)(2980300002)(428003)(199004)(189003)(16586007)(81166006)(81156014)(8936002)(14444005)(316002)(8676002)(53936002)(426003)(7696005)(77096007)(50226002)(51416003)(47776003)(305945005)(5660300002)(97736004)(336012)(26005)(70206006)(70586007)(126002)(2616005)(476003)(6916009)(486006)(72206003)(478600001)(68736007)(356004)(2906002)(50466002)(6666004)(36756003)(4326008)(186003)(48376002)(2351001)(86362001)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR12MB0651; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e559211a-2f84-42cc-856f-08d6cbc3d179
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY1PR12MB0651; 
X-MS-TrafficTypeDiagnostic: CY1PR12MB0651:
X-Microsoft-Antispam-PRVS: <CY1PR12MB06516085B9084ADDA7CC121DFE380@CY1PR12MB0651.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0021920B5A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jZSca5pepRheJS5UDjbKy2Wfx3DTPoim3+3mzJkTwwXclXf3b1rA/D20qfBxwUAeR+wF8yJWHsr8+rZaTKyCqd3KsdLLJbsE6L1PGzzm2OCng0NzrgC74/inRcwpaxRcq9y8dhwNZeArzIx4rqayfK+n0sySTA/IlNPSQiCW0mBXHLI01r2XS+Dz92xY7lugRIU8WRNnxrqRFNgKcuL6dw0zEkem/6NF3HyPJD62wackB7hLP1Fddcn3ZvuMiLu6sMvqBwCcd2ALPKhrbmf7bB8m5ehvdwv5v+RUJV3BKzEl593xKFLR0l8ha48uzIZDMVplnv+JlWVSDBrfUq/avkBcyFA2Sx+ahnX2NB05fxes29qCNq9JkOFVySSPXe7PG99AuO5XgzktVIqe+/YOwt5T0qS4iJ6g5YTcMaI4/8w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2019 10:25:21.0995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e559211a-2f84-42cc-856f-08d6cbc3d179
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB0651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLTIrQJY5bk35G1U3c6v761gb8T+SQPLKY4wCoJmVJc=;
 b=ilzuJ/HxqSRbxnMNZ+iDrCI1xzGx0UpR0rrWMbnb6ixtKkOJHLD0lcQyrleNxGBLGNPqNdSGAEk0QjmfiZkwcEwmlizRy1jxf9RMhe42qayoEU0dsK8RRQC2SjFHVdfRpdG9i4rJ+RNl04h1pWHXQxirlkpvt0QWvNMaWJYlv/k=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gYW1kZ3B1IG9wZW4gcGF0aCwgQ1NBIHdpbGwgYmUgbWFwcGVuZWQgaW4gVk0sIHNvIHdoZW4g
b3BlbmluZwpLRkQsIGNhbGxpbmcgbWRncHVfdm1fbWFrZV9jb21wdXRlICB3aWxsIGZhaWwgYmVj
YXVzZSBpdCBmb3VuZCB0aGlzClZNIGlzIG5vdCBhIGNsZWFuIFZNIHdpdGggc29tZSBtYXBwaW5n
cywgYXMgYSByZXN1bHQsIGl0IHdpbGwgbGVhZAp0byBmYWlsZWQgdG8gY3JlYXRlIHByb2Nlc3Mg
Vk0gb2JqZWN0CgpUaGUgZml4IGlzIHRyeSB0byB1bm1hcCBDU0EsIGFuZCBhY3R1YWxseSBDU0Eg
aXMgbm90IG5lZWRlZCBpbgpjb21wdXRlIFZGIHdvcmxkIHN3aXRjaAoKU2lnbmVkLW9mZi1ieTog
VHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDEwICsrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyAgICAgICAgICB8ICAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5kZXggNjk3Yjhl
Zi4uZTBiYzQ1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYwpAQCAtOTU2LDYgKzk1NiwxNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2
bV9hY3F1aXJlX3Byb2Nlc3Nfdm0oc3RydWN0IGtnZF9kZXYgKmtnZCwKIAlpZiAoYXZtLT5wcm9j
ZXNzX2luZm8pCiAJCXJldHVybiAtRUlOVkFMOwogCisJLyogRGVsZXRlIENTQSBtYXBwaW5nIHRv
IG1ha2Ugc3VyZSB0aGlzIFZNIGlzIGEgY2xlYW4gVk0gIGJlZm9yZQorCSAqICBjb252ZXJ0aW5n
IFZNCisJICovCisJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiBkcnZfcHJpdi0+Y3NhX3Zh
KSB7CisJCWFtZGdwdV9ib19yZXNlcnZlKGFkZXYtPnZpcnQuY3NhX29iaiwgdHJ1ZSk7CisJCWFt
ZGdwdV92bV9ib19ybXYoYWRldiwgZHJ2X3ByaXYtPmNzYV92YSk7CisJCWRydl9wcml2LT5jc2Ff
dmEgPSBOVUxMOworCQlhbWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPnZpcnQuY3NhX29iaik7CisJ
fQorCiAJLyogQ29udmVydCBWTSBpbnRvIGEgY29tcHV0ZSBWTSAqLwogCXJldCA9IGFtZGdwdV92
bV9tYWtlX2NvbXB1dGUoYWRldiwgYXZtLCBwYXNpZCk7CiAJaWYgKHJldCkKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwppbmRleCBkYTdiNGZlLi4zNjFjMmU1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCkBAIC0xMDY5LDcgKzEwNjksNyBAQCB2
b2lkIGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CiAJYW1kZ3B1X3ZtX2JvX3JtdihhZGV2LCBmcHJpdi0+cHJ0X3ZhKTsKIAotCWlmIChhbWRncHVf
c3Jpb3ZfdmYoYWRldikpIHsKKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIGZwcml2LT5j
c2FfdmEpIHsKIAkJLyogVE9ETzogaG93IHRvIGhhbmRsZSByZXNlcnZlIGZhaWx1cmUgKi8KIAkJ
QlVHX09OKGFtZGdwdV9ib19yZXNlcnZlKGFkZXYtPnZpcnQuY3NhX29iaiwgdHJ1ZSkpOwogCQlh
bWRncHVfdm1fYm9fcm12KGFkZXYsIGZwcml2LT5jc2FfdmEpOwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
