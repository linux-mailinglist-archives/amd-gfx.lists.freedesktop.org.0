Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701169DDF
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5DB89D5F;
	Mon, 15 Jul 2019 21:22:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720069.outbound.protection.outlook.com [40.107.72.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A27589D46
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZf1NeOzAgbqx/iH+x/2hOormq5ZRMQGQeyqjbcUH9ahqJevdw1WetvIQ/lV+/KHGO0Sc4gObpDIoTRt+iemy7Ixr6TXhcroq/3KeDIToaKKT8M+zZZbmxs5oqzMjJTTkAgRv7+ZMahk21XEdGte5ELibu0pkV3jEILRBrC1tM0o0U5uHsq9Zo0rsdVyKzQ7VWNdNJYzee/6kE6P6h6zD0EzKQ3HDXOtq4eqTTNblWHHQK8UyIIPVFknlImCkRAR5xeBAE6BKPp+mQYGq+PSBo9pjhfLRAkjTtDJGgPxvJNB1vnQcsxzrv12O3Pjb3FvLN4gxtE+IUg+w0pomAfJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XyCLvH9rtyPaavhEqMAOqH5gBIKiRtoUMRyQlyE7Zs=;
 b=ZnKcwiooz5TZD51bYafN9NpCmKyqwZTdF7AxHvNIZbocDGxkCEkMTABqHhUmnvN/DQpMbX7xFz4WT9zFprPtahlazDK9IzpIgDOuAARRZQ5ucGrv5Nv93ztgTFuEv5ZkPSvxJcXG/TtqDBNbGFbqU/xvWr2e87VJRgin9hWQBai13BuhZBwPOsZ0xQ0y4Z6A2vulJ1Y9m7nuitb2FHqx5ZlsZUfWumJlgsF6sgfE6xLgnGoIpOYrMX9i4Ccqsup9kCMZNEIWULvpoBNoReLrE6O1EJiLy5QTNrY0JkV7tPIeJjB+rVlLuhBaDbwImugnUxND63JxFyYaj5ISnaLoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=amdcloud.onmicrosoft.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MN2PR12MB3343.namprd12.prod.outlook.com (2603:10b6:208:c2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:59 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:58 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:38 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 73/87] drm/amd/display: Only enable audio if speaker
 allocation exists
Date: Mon, 15 Jul 2019 17:20:35 -0400
Message-ID: <20190715212049.4584-74-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(76176011)(26005)(2906002)(49486002)(2876002)(70586007)(70206006)(5660300002)(47776003)(356004)(6666004)(336012)(1076003)(186003)(68736007)(51416003)(53936002)(2351001)(14444005)(36756003)(305945005)(446003)(6916009)(8936002)(81166006)(81156014)(50466002)(50226002)(8676002)(478600001)(2616005)(48376002)(126002)(426003)(11346002)(476003)(4326008)(54906003)(486006)(2870700001)(86362001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3343; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0123c6c-7175-4cad-0b9c-08d7096a7890
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3343; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3343:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3343E848EB2F4ACEE019425C82CF0@MN2PR12MB3343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VzkQjRnZ5z7ySLDRDO8MLhJN5L0N9GSAM9OMx9yPJPAhTZxCWDYrKMEA6MyoqZCDnvOsFjjsvg7m3+onH+oeftE+o2pKn2hoCY/6hteGZnWx1hU0/1WBb/AZOzJib76HxRg/zTyyA6kFB2V78fjAxLm4jlrT+KX73F3pJrPEJ7jTwIblPUXGikMZgVhbyHGYAjbbLwS0sxvknvh+iQ1LMoDxCzG05IVEOD7dP2JfFHi5ehsCq6SU+/B5Zun3Jjacbwmg0gSpqlOKDdHEKaQdSh8BRWZgPW1DftAPq14+6nfM1oXK0SP4Qtv0N1xj9PrpQZRwVpUeSGZ3atDt3Rhh5ZxU/m4UYfLVhpq5pDL/rwZxTyxzr2PoL731X+SHtni1dVBu4tjYVlhyJlivjp3UpCxKgOifdoloIBuGJ1A7kxQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:58.8212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0123c6c-7175-4cad-0b9c-08d7096a7890
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XyCLvH9rtyPaavhEqMAOqH5gBIKiRtoUMRyQlyE7Zs=;
 b=TqXQuqUTBSJ5vnje9vp+j+9Ze74hcCueSZCjJiW8HeqYzI8ncxOX34Wd8s83S2/nF7QVcuF0VwEcV97hH7ouAWAbskiZ3+hWK1JR3+FWTFH0tPmezMWM55ljfrazyUw1eK0lVRimw6RfYJL3Hq6Hz+X+K4yc8w1X/yo3XUMwdGg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; amdcloud.onmicrosoft.com; dkim=none (message not
 signed) header.d=none;amdcloud.onmicrosoft.com; dmarc=permerror action=none
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFtZC5jb20+CgpbV2h5XQoKSW4gZG1faGVscGVy
c19wYXJzZV9lZGlkX2NhcHMsIHRoZXJlIGlzIGEgY29ybmVyIGNhc2Ugd2hlcmUgbm8gc3BlYWtl
cnMKY2FuIGJlIGFsbG9jYXRlZCBldmVuIHRob3VnaCB0aGUgYXVkaW8gbW9kZSBjb3VudCBpcyBn
cmVhdGVyIHRoYW4gMC4KRW5hYmxpbmcgYXVkaW8gd2hlbiBubyBzcGVha2VyIGFsbG9jYXRpb25z
IGV4aXN0cyBjYW4gY2F1c2UgaXNzdWVzIGluCnRoZSB2aWRlbyBzdHJlYW0uCgpbSG93XQoKQWRk
IGEgY2hlY2sgdG8gbm90IGVuYWJsZSBhdWRpbyB1bmxlc3Mgb25lIG9yIG1vcmUgc3BlYWtlciBh
bGxvY2F0aW9ucwpleGlzdCAoc2luY2UgZG9pbmcgdGhpcyBjYW4gY2F1c2UgaXNzdWVzIGluIHRo
ZSB2aWRlbyBzdHJlYW0pLgoKU2lnbmVkLW9mZi1ieTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+CkFja2VkLWJ5OiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5kZXggYzVhNzQwODIxYzBlLi40M2JiNGM5MzNkYTcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291
cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3Vy
Y2UuYwpAQCAtMTk5OSw3ICsxOTk5LDcgQEAgZW51bSBkY19zdGF0dXMgcmVzb3VyY2VfbWFwX3Bv
b2xfcmVzb3VyY2VzKAogCS8qIFRPRE86IEFkZCBjaGVjayBpZiBBU0lDIHN1cHBvcnQgYW5kIEVE
SUQgYXVkaW8gKi8KIAlpZiAoIXN0cmVhbS0+Y29udmVydGVyX2Rpc2FibGVfYXVkaW8gJiYKIAkg
ICAgZGNfaXNfYXVkaW9fY2FwYWJsZV9zaWduYWwocGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKSAm
JgotCSAgICBzdHJlYW0tPmF1ZGlvX2luZm8ubW9kZV9jb3VudCkgeworCSAgICBzdHJlYW0tPmF1
ZGlvX2luZm8ubW9kZV9jb3VudCAmJiBzdHJlYW0tPmF1ZGlvX2luZm8uZmxhZ3MuYWxsKSB7CiAJ
CXBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvID0gZmluZF9maXJzdF9mcmVlX2F1ZGlvKAogCQkm
Y29udGV4dC0+cmVzX2N0eCwgcG9vbCwgcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYy0+
aWQpOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
