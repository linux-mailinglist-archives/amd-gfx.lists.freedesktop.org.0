Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816971C6E
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D06E2F7;
	Tue, 23 Jul 2019 16:04:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36BB6E2F7
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUQIE4cagaYQSpRpsfxhWXmyB5O8IFL+IVeG6mA+pz9OKZKFD8DiaZq5WNOsmVH69dwjKDjG3L9OsvAS8B8Wtme6eYcyKGPVTi5CQ9wyUgPQcdJLdiCHvBJowkdZH5NSbW8iuKxTxh/g0BioPj+lIypnoSO9zxO4UC3Lb50JeOaFjJqCjBZhSbcW5adctK0eXllfImtQ2VRSLZF7F0uxs6jZcDRDfMTxYEuGduPjopKmUeUScHppcMtkfCdxWXa91+bicG9r8osULR/wrceKpzXAEYrOg1W24cqOtLstbaA4zB7Qd6UfnQ6xkQcLVtO7F4LqW3tVwC23FaEcmlR5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk4Vin61gVuT+omQ70DQrL1pjre55RpUPcfePVotpYI=;
 b=nCdCKKa+yxOYFx/K5kBqQzNYe8XkYQThscDkSwdsJ61rXx/8IhSKt/Cc3XaDcCnh91UkoeB/Qcf6sifD3ubnyXXXbNb8dAhXwdAu6guZggWdjPuxBxZZYfZysDBvf8CVLx1VLjcRB6Jr0CTN3FLw6/iy3JlXdfKb+nYqVCgsqNU6F46e0seEHUAAoJ5lEPZudG7Al7rfLNzYsgxbftDdQHAX26rOfKKdGrgLvFf0vcsNr1NghYJJBQ0YTU9Py90w1xbIUIs5b2bulwb+StSkQRfytIURzsk0q0enYEvdA2bAxCQqbYgV1SfKRIJ8ZJ0KinWpspw0CzB61iQxC5GiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by BN6PR12MB1299.namprd12.prod.outlook.com (2603:10b6:404:1d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 16:04:47 +0000
Received: from DM3NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Tue, 23 Jul 2019 16:04:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT059.mail.protection.outlook.com (10.152.82.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 16:04:46 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 11:04:46 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd: enable S/G for RAVEN chip
Date: Tue, 23 Jul 2019 12:04:11 -0400
Message-ID: <1563897851-11501-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(70586007)(51416003)(70206006)(6916009)(7696005)(36756003)(6666004)(356004)(68736007)(26005)(53416004)(5660300002)(54906003)(81166006)(186003)(4326008)(50466002)(2906002)(426003)(81156014)(48376002)(11346002)(53936002)(478600001)(16586007)(8676002)(486006)(47776003)(316002)(50226002)(8936002)(476003)(86362001)(126002)(336012)(44832011)(2351001)(446003)(76176011)(2616005)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1299; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa5daa4-3c67-48b8-f00d-08d70f877b8c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1299; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1299:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12998661870E4326145E6E95EAC70@BN6PR12MB1299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:71;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dd13Rh2bAEtcywWNGl3i3UvE/N6dlWC10mXGDftYhfkXaW4Ni/9rNUhPgldodtYwfsNqMg93/G6Y1GRRDCp9AqbrTA3gozjtP/7tKHWGZA7QWNR3lezda4Rs809ETp/xsUKknneu+3BAtYVFIrHa6vwnCtYCZtjzUKuX4Dwahm2vcfgtS4l+xyrUsACGV94rB++KcD5ZwqXNkdioRUSwkZZS5nbxB2wJTLAuPZUXkpJqKeD/HDMe4jXoQlMSfmsNitRSFLO56TMYP0Uimbvg6IHrTfIa9qqB+z+P9sou5Ni1Q20JZ04VlZcRKAfmmlcJ4TAXnsHXtLIF//+OOuXW6ZNzwEH+3KJNXvpWaPCj9G2j8Zvhs/WV2KtWwDGwtKcq8gtq/XlCIhySbMKZjlpj3bZFp07Ay6Iw/gsKcziBxa4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 16:04:46.2849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa5daa4-3c67-48b8-f00d-08d70f877b8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk4Vin61gVuT+omQ70DQrL1pjre55RpUPcfePVotpYI=;
 b=fZKPFzu7ygLqYRBtUDGO5U8UQattS1fYz+IGrZVvF+w1cnfkv+2lLUhsNhio5YZrjfg0kKjVrux4oxtDstFgWaWn+7A7RMABAvF33FNz0MhHcHhqL0U1JwLMBFlf1YWD68/g1IJetv4TtxRlMhYLK1KvJAotIFJD1PwklW9Jnsk=
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
Cc: Alexander.Deucher@amd.com, hersenxs.wu@amd.com, Christian.Koenig@amd.com,
 shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KCmVuYWJsZXMgZ3B1X3ZtX3N1cHBv
cnQgaW4gZG0gYW5kIGFkZHMKQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21h
aW4KCkNoYW5nZS1JZDogSWYzNDMwMGJlYWE2MGJlMmQzNjE3MGI3YjViMDk2ZWM2NDQ1MDJiMjAK
U2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jICAgICAgIHwgMiArLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCmluZGV4IDc2N2VlNjk5Li4zZDA0NzMw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKQEAgLTQ5
OCw3ICs0OTgsNyBAQCB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl1aW50MzJfdCBkb21haW4gPSBBTURHUFVfR0VN
X0RPTUFJTl9WUkFNOwogCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQykKLQlpZiAoYWRl
di0+YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2ljX3R5cGUgPCBDSElQX1JB
VkVOICYmCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNp
Y190eXBlIDw9IENISVBfUkFWRU4gJiYKIAkgICAgYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVICYm
CiAJICAgIGFtZGdwdV9kZXZpY2VfYXNpY19oYXNfZGNfc3VwcG9ydChhZGV2LT5hc2ljX3R5cGUp
KQogCQlkb21haW4gfD0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMmQ1MGVlYS4uYTgy
MjRhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jCkBAIC02ODYsNyArNjg2LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkgKi8KIAlpZiAoYWRldi0+ZmxhZ3MgJiBBTURf
SVNfQVBVICYmCiAJICAgIGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYKLQkgICAg
YWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTikKKwkgICAgYWRldi0+YXNpY190eXBlIDw9IENI
SVBfUkFWRU4pCiAJCWluaXRfZGF0YS5mbGFncy5ncHVfdm1fc3VwcG9ydCA9IHRydWU7CiAKIAlp
ZiAoYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayAmIERDX0ZCQ19NQVNLKQotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
