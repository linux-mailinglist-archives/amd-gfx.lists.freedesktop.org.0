Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB68DF07
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560816E83F;
	Wed, 14 Aug 2019 20:40:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53DB6E83F
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5sA/xzRy6jI/Cb9USxuWWNav3q4QR/ipO6dts9s97iOx3EdmhkwSylZK9JNdoL5pH9Ul0s3ejui7n0dBDaqEfWBloCE8V3xdOncY/EX/cXYxFY8iVzdxcr8GbZODSZL+6O0mXHxRsO/+TQOob99bt2hm+okeezbbpp81obsriuCI1WvilfBSo/nwUrG6Cu7Nm7E2bYUy+8vvpHBfoTGSlHbMOSY9mwBClSZ7dU1Uwaf1PPShGHoP72bea+3AoAzpK68OX6WwEIIoEdrtgjodxfAF0RUJVxu53QOvE+O8JGc4v/L6koaPeJgH9v8QejOjojmccJAV+YDLb1AS4Jajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvqhfjBF1kwnxJIR9n9412qdD/tO3uYNZkkeQEcqtCg=;
 b=La4SrGwOFEs/+YDnHm0m+nZmJWl/l4lxzBR3vFy0IXOJMIDDpTXWnuFxlQRAkQgq/sGHXZ3djRTlPBeWQJhWcASwL14B0tOQn3Xnc/B74gsbb8cOD6fQ+mZ28tgYyQR9GsgRQEOAq+VlvuO4vJ7yHnasx738gd/WmwH7Hn6IMUCnl9DAa2IMBOjBz5Qtz8dJ2shrUuxMJhvcKlR91vnyOzX7nABRUaqXObXRDHvvOgaYkXbpHl8rI0T1wuKJsmvoEK2EEx7N8UUQYrNNDuBCiUAZDUTXft716xZI5Z0ha0we8MfmgnkbAxFTKh88FNVib+ROFUqlhV1yQHYpXF8KQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0106.namprd12.prod.outlook.com (2603:10b6:802:21::41)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.23; Wed, 14 Aug
 2019 20:40:40 +0000
Received: from CO1NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by SN1PR12CA0106.outlook.office365.com
 (2603:10b6:802:21::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Wed, 14 Aug 2019 20:40:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT007.mail.protection.outlook.com (10.152.80.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 20:40:39 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 15:40:38 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/5] drm/amd/powerpay: Implement mode2 reset callback for
 SMU10
Date: Wed, 14 Aug 2019 16:40:15 -0400
Message-ID: <1565815217-9533-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(2351001)(6666004)(81166006)(44832011)(186003)(7696005)(48376002)(26005)(50466002)(76176011)(11346002)(2616005)(53416004)(476003)(126002)(51416003)(2906002)(316002)(53936002)(4326008)(50226002)(16586007)(81156014)(356004)(54906003)(486006)(8936002)(478600001)(70586007)(86362001)(305945005)(36756003)(70206006)(5660300002)(426003)(446003)(6916009)(8676002)(336012)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fca41692-aa8f-4fc5-2ce3-08d720f7ab51
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718B2CAF971E0CD67E35A24EAAD0@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IwdslItQwgeCDF6CXTsg9OZ2ZD5rOvvzVh8dqSSphrSXPXJUnxcEN5hG3Px4ilfmBMZWUyFFi+fcadG3CDc3WqZFtTOm1Is3E8UbZTZ5f+u4XJ8Winx69+Dnk1ih5I5GM0eU7j2ng2EoD42Q3r9zCxsOeIbD0Tv++CWMPC92XPa0uByXrolENSevgr2pCulxdZEMmvWuxyTSjriS3jJYGZuKduW3MoxA0/sdvIpr9D3/CdouEM9UhISmL0405gmghh58F4C2TsTznIFlov3CyEaAEeozgRYq/NGnqYREGm5UnDA4I0bZjo430dvahejTv9h/nsrbuJfhSTsdySj7ncYS1n7p7EOqvw/WL0V0BFxcu58hmj34K4QRsOeuQKB6kXgpN9SUOyOkADdJGM6PB+xCp88HkNWfrvyhSjYamfY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 20:40:39.7067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fca41692-aa8f-4fc5-2ce3-08d720f7ab51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvqhfjBF1kwnxJIR9n9412qdD/tO3uYNZkkeQEcqtCg=;
 b=KYJ5lN0MJAgh27EqNqu93fNNdZt4mQFvxU5xwdu46tYkLKg4fdLgdQJlEB7+g6RcqjLZ25gw+BNiEGlXsHBD1ZFHBkZ+/VXi5uMiVbLEehBFmGEQNzemkODBGMpqIVkJbl3CzcPaWRMoD4Z6Uc4wiTS/5gRb3RK4yiSpFsSKI9A=
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

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3Iu
YyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCmluZGV4IDE4
ZTc4MGYuLjExMTU3NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3NtdTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3Ivc211MTBfaHdtZ3IuYwpAQCAtMTMxMSw2ICsxMzExLDEyIEBAIHN0YXRpYyBpbnQgc211
MTBfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBsb25nICpp
bnB1dCwgdWluCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgc211MTBfYXNpY19yZXNldChz
dHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBlbnVtIFNNVV9BU0lDX1JFU0VUX01PREUgbW9kZSkKK3sK
KwlyZXR1cm4gc211bV9zZW5kX21zZ190b19zbWNfd2l0aF9wYXJhbWV0ZXIoaHdtZ3IsCisJCQkJ
CQkgICBQUFNNQ19NU0dfRGV2aWNlRHJpdmVyUmVzZXQsCisJCQkJCQkgICBtb2RlKTsKK30KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBwcF9od21ncl9mdW5jIHNtdTEwX2h3bWdyX2Z1bmNzID0gewog
CS5iYWNrZW5kX2luaXQgPSBzbXUxMF9od21ncl9iYWNrZW5kX2luaXQsCkBAIC0xMzU1LDYgKzEz
NjEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwX2h3bWdyX2Z1bmMgc211MTBfaHdtZ3JfZnVu
Y3MgPSB7CiAJLnNldF9oYXJkX21pbl9mY2xrX2J5X2ZyZXEgPSBzbXUxMF9zZXRfaGFyZF9taW5f
ZmNsa19ieV9mcmVxLAogCS5nZXRfcG93ZXJfcHJvZmlsZV9tb2RlID0gc211MTBfZ2V0X3Bvd2Vy
X3Byb2ZpbGVfbW9kZSwKIAkuc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSA9IHNtdTEwX3NldF9wb3dl
cl9wcm9maWxlX21vZGUsCisJLmFzaWNfcmVzZXQgPSBzbXUxMF9hc2ljX3Jlc2V0LAogfTsKIAog
aW50IHNtdTEwX2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3bWdyICpod21ncikK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
