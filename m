Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956F813E2
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 10:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2B889A92;
	Mon,  5 Aug 2019 08:04:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E01A89A92
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 08:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSk1jtDdZxOofeyUaysKaB87Q1mJW5XR4igiNQZ8SXzbps9abVHEsSz8Hcjd/71Yf0r23o32EwusWTqV8HUpz7GzJP/lp//4DAnZ4YLHITNSEvVH8bmsEBW740qS0UdzL7nPDphnM/4malcoNYhc/QjsYUJi+OQvHBtF1kCbN59iQUF56Us/GUQigydc5ahw/WrhzkEwzBAXKkaP7mU9clLPCKwbohf8WhjLiOQwu1/z9muzZTxoGr0gv5AuNhRKXvhiTIxzJ5d8CQ4FLjJcT7z+s4zJASEbkaWSU/D4q3lefTe/tv3QpdGyTabcRAC0RaEdffxdkJYQlJ/koQ6wZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWiuZBAzt0Lj+FSZ8PvAHeCGEut/pWgjkv220u5fQ4w=;
 b=kdsuBcN9IB/929a+g0FPsw1I6WwKvdCLiAlg2CR0xmj1TvT2CNKzRPr+exmcDI0yMXjRxy8+D4l6ZiFTHmRe1bmEGW5bHcvbrurQjadIR7D9YcEBEZK0utAmKrDAHvDaw7WpbaRhaUUswcr2P375S0YtwHN4+ruxYn5tB9CbUDo7ZJZrWUyjTDL6qwI5RSeJyFUMYikCo5MKmdrUTEnu4L0OsXHtKGWB55Du336bNxEqAw4Sk6hduZNYHVJIkNeReSNGxN/a3si3gCzKZsgWuQ9SNob5P93naUwMjV5wRMMi0ZPthaohIvcUcnQ610dz04Ru2SJu/iCxdYcrIh5GYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MWHPR12MB1613.namprd12.prod.outlook.com (2603:10b6:301:11::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15; Mon, 5 Aug
 2019 08:04:29 +0000
Received: from BY2NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14 via Frontend
 Transport; Mon, 5 Aug 2019 08:04:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT024.mail.protection.outlook.com (10.152.84.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Mon, 5 Aug 2019 08:04:28 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 5 Aug 2019
 03:04:27 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <xinhui.pan@amd.com>,
 <hawking.zhang@amd.com>
Subject: [PATCH] drm/amdgpu: update ras sysfs feature info
Date: Mon, 5 Aug 2019 16:04:08 +0800
Message-ID: <20190805080408.20770-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(428003)(199004)(189003)(86362001)(68736007)(26005)(186003)(50226002)(8936002)(81166006)(81156014)(8676002)(336012)(426003)(486006)(2616005)(2201001)(1076003)(126002)(305945005)(110136005)(6636002)(14444005)(51416003)(476003)(356004)(47776003)(6666004)(16586007)(7696005)(53416004)(5660300002)(316002)(2906002)(70206006)(70586007)(48376002)(478600001)(50466002)(4326008)(36756003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1613; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f30693d0-0b89-40f0-b1dd-08d7197b8a78
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1613; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1613:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1613FACE4A3198A351456D96B0DA0@MWHPR12MB1613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 01208B1E18
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: I9oRf5QnufDkAJcaVg/xSyRFe8CpS5fHBj7lVvfxHXj9QgC1XoQLooScLu38b3uji4qafheVJ70p4Skhiq/htA9i8YTbnJrFEoJ4zsGRw3NJdrLyEw4ibg14lIUhZ8dWTrBmdbkvhDUSFt09BOAPTfwbzZ8GMsZhF++9KHR5sPCrngH7a5orsoCQne9N+6xMq8/jjgVQ59vP4UEv5qaanT/f/o3AblxZN3cjugVWdnROXOx2vTwC5Z2Wmw2tRroJgpTgpwXp8sd1vSsFi2JUsfPg1D390chEx0JEWcYYmOwdlR+DA3IqN65TyKHYGacuVnkY0qFq5nF/eL0Gry+HzinFoj2gHHsm1YfNrVA6GXZEeSYYUeQpQyO80XCfv81e2HiHvpLUvmwzZj7bptTLrmoDXKMNtKKGykTiYLOhyxM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 08:04:28.9575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f30693d0-0b89-40f0-b1dd-08d7197b8a78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWiuZBAzt0Lj+FSZ8PvAHeCGEut/pWgjkv220u5fQ4w=;
 b=sF0Gwh8EMx/vExfDI1KZv7Q7e/M5kzKEwHNcQCayNit/8Rpm//U1dncpI2CU7MlxwqagzvHwtF4E+lPUXhTqCuK2bFCH/1cQuOyU77LZ7wxp0F+nE3UyL6lCuHMHNGnWcgFeQL9h8lyaNiyVIvwAxWLhcwWKR1ap8VbJrfIM+lk=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVtb3ZlIGNvbmZ1c2VkIHJhcyBlcnJvciB0eXBlIGluZm8KClNpZ25lZC1vZmYtYnk6IFRhbyBa
aG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMgfCAxNyArKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jCmluZGV4IGQyZThhODVmNmUzOC4uMzY5NjUxMjQ3YjIzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC03ODcsMjUgKzc4NywxOCBAQCBzdGF0aWMg
c3NpemVfdCBhbWRncHVfcmFzX3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2
LAogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7CiAJc3Ry
dWN0IHJhc19jb21tb25faWYgaGVhZDsKIAlpbnQgcmFzX2Jsb2NrX2NvdW50ID0gQU1ER1BVX1JB
U19CTE9DS19DT1VOVDsKLQlpbnQgaTsKKwlpbnQgaSwgZW5hYmxlZDsKIAlzc2l6ZV90IHM7Ci0J
c3RydWN0IHJhc19tYW5hZ2VyICpvYmo7CiAKIAlzID0gc2NucHJpbnRmKGJ1ZiwgUEFHRV9TSVpF
LCAiZmVhdHVyZSBtYXNrOiAweCV4XG4iLCBjb24tPmZlYXR1cmVzKTsKIAogCWZvciAoaSA9IDA7
IGkgPCByYXNfYmxvY2tfY291bnQ7IGkrKykgewogCQloZWFkLmJsb2NrID0gaTsKKwkJZW5hYmxl
ZCA9IGFtZGdwdV9yYXNfaXNfZmVhdHVyZV9lbmFibGVkKGFkZXYsICZoZWFkKTsKIAotCQlpZiAo
YW1kZ3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRldiwgJmhlYWQpKSB7Ci0JCQlvYmogPSBh
bWRncHVfcmFzX2ZpbmRfb2JqKGFkZXYsICZoZWFkKTsKLQkJCXMgKz0gc2NucHJpbnRmKCZidWZb
c10sIFBBR0VfU0laRSAtIHMsCi0JCQkJCSIlczogJXNcbiIsCi0JCQkJCXJhc19ibG9ja19zdHIo
aSksCi0JCQkJCXJhc19lcnJfc3RyKG9iai0+aGVhZC50eXBlKSk7Ci0JCX0gZWxzZQotCQkJcyAr
PSBzY25wcmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywKLQkJCQkJIiVzOiBkaXNhYmxlZFxu
IiwKLQkJCQkJcmFzX2Jsb2NrX3N0cihpKSk7CisJCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBB
R0VfU0laRSAtIHMsCisJCQkJIiVzIHJhcyBmZWF0dXJlIG1hc2s6ICVzXG4iLAorCQkJCXJhc19i
bG9ja19zdHIoaSksIGVuYWJsZWQ/Im9uIjoib2ZmIik7CiAJfQogCiAJcmV0dXJuIHM7Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
