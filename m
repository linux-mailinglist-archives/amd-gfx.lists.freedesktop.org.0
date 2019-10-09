Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863BD1A8B
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA7D6EA6B;
	Wed,  9 Oct 2019 21:06:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639646EA5A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6tTs6TeKtfvq2cqwMwuzJc7+9DCDYcMMSxPBoXuop5JFS54zfphi6gs+53bS8KjEogA0feP3SztDeAtTSUMofphl+kDXK1bLoB7vzvNiXnmIcIE3ZTQr6cw5g7cDyJYBBA6oiPrp99TwqEIzBc+9RNzwxwMpmba9wPPI0vhHFbwT/1grEbVlUQ6C7+lCUskq8+d50ArH655B3q8aTUEy9OJIOsb4Y8zmEt9goZ4iXz0LCm7+QkBrH/dAuFD/TLcTCpngJjk8EqY+oUmuH4+loEZ+m8OotMcSJ6g2f6IQvfy9rD074eW6fd805SdPKO6/go6y/V5EM7rsSY9hAE9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3msces00inZ3Fl77awXgw2MilSRHCTJxyS0kjKJEsw=;
 b=UinZLlI9qB16b1tvV/sI18KGFrwrllUN9lf3+RwoZd4HokEl91l0zva7Ou3KPe5DenAht4R5et44ck5loMakTnRk3LGN6qAKRcstg79yrpbNjxkM770p/jrTKO+jFu99jdRAQYIg8DYjhdzC+V/kVgj4CbDf9XTcG9F3ZSP52wlbrf6kXWvL50nTRhcUZSWMTLrlV++1QfBFkJqXQ0F96YIuEMK/JoJVoja1FiriDAS/4z2bKEWXX6gq1fKVUGUvBpviV3mqV+R4P1YrdpPkvSnqFIFomHx2ZmjeTx0YKCwA6mEOTc1L7f9iHTgkPvCTC3gGSrlSWUOKBoPDHOPg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by CY4PR12MB1493.namprd12.prod.outlook.com (2603:10b6:910:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 21:06:25 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:25 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:24 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/26] drm/amd/display: Temporary workaround to toggle
 watermark setting
Date: Wed, 9 Oct 2019 17:05:58 -0400
Message-ID: <20191009210613.17929-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(428003)(199004)(189003)(186003)(54906003)(4326008)(8936002)(14444005)(16586007)(316002)(76176011)(70586007)(70206006)(486006)(6916009)(36756003)(478600001)(50466002)(26005)(86362001)(50226002)(81156014)(126002)(5660300002)(6666004)(476003)(7696005)(11346002)(356004)(81166006)(2906002)(47776003)(8676002)(51416003)(48376002)(446003)(336012)(1076003)(305945005)(53416004)(426003)(2616005)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1493; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1e66b8-59e6-48df-51c6-08d74cfc8bca
X-MS-TrafficTypeDiagnostic: CY4PR12MB1493:
X-Microsoft-Antispam-PRVS: <CY4PR12MB14933AC019F5F0FBA7535716F9950@CY4PR12MB1493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbXRN7vRpXVwEvpTGGTTfJyAL8ZcSbsCM2W5dS43S5Skz1aOongk0gsuLjWGjKOgejAUWc3xKmHFQ1mG+Jr8M2oycuf/TJN/iT6X6B/73BE7e8rKPgf6lyvP7UyQ+ttnbtLpr3lc6vwnKbughOb+zNffAfcTrc9QSNe1GSTGE/VJgTawqD8/8qW5eHwP58O+GTlc3Zp40fazj+BxWBrg8L1KLsCGzn0/GE+VDPoK89ud96BLO3YiEsnXXYGoOe4ssto+Y2gPirRxtthOYeMAvCXI2PiMYkfhfVNg0LZ5i5fr5eQ1qFVaHP4TP9fuA1aPeeIIJrAWx2mHpKMHGYWBomd8iSxM1w07PzwXtkMGw6CbDKbv5G/wauRISvPLEci6ayN4Kax8tLSSFtYyCAS1JjzPq+vTthk8vSt8ue9sIGU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:25.5605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1e66b8-59e6-48df-51c6-08d74cfc8bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3msces00inZ3Fl77awXgw2MilSRHCTJxyS0kjKJEsw=;
 b=Ub0viLljPUmsCFF2zMm71kfqJs5k0zAq73b8rrQAOCIXI0M0HVEcqo+m3Vs3eiW9GHnKH/IfIcIrk91XKFLGQMhcS9QSlAzl+Dkl1fUp5psfgEcTeyT2/ZxIvlMwQjvnMRzILAMdtcTqd/yioHNkfG8J6BGD9NGsW02ac7esAC8=
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
Cc: sunpeng.li@amd.com, Lewis Huang <Lewis.Huang@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpXYXRlcm1hcmtz
IG5vdCBwcm9wYWdhdGVkIHRvIERDSFVCUCBhZnRlciBpdCBpcyBwb3dlcmVkIG9uCgpbSG93XQpB
ZGQgdGVtb3ByYXJ5IGZ1bmN0aW9uIGFwcGx5X0RFRENOMjFfMTQ3X3dhIHRvIGFwcGx5IHdtIHNl
dHRpbmdzIGZvciBSZW5vaXIKClNpZ25lZC1vZmYtYnk6IExld2lzIEh1YW5nIDxMZXdpcy5IdWFu
Z0BhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpB
Y2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAg
fCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJi
dWIuYyAgIHwgOSArKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MS9kY24yMV9yZXNvdXJjZS5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2h3L2RjaHViYnViLmggICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHdzZXEuYwppbmRleCBjZTI1MzA1MDllMTIuLjYyMjlhOGNhMDAxMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKQEAgLTE1
MzMsNiArMTUzMywxMCBAQCBzdGF0aWMgdm9pZCBkY24yMF9wcm9ncmFtX2Zyb250X2VuZF9mb3Jf
Y3R4KAogCQkJCW1zbGVlcCgxKTsKIAkJfQogCX0KKworCS8qIFdBIHRvIGFwcGx5IFdNIHNldHRp
bmcqLworCWlmIChkYy0+aHdzZXEtPndhLkRFR1ZJRENOMjEpCisJCWRjLT5yZXNfcG9vbC0+aHVi
YnViLT5mdW5jcy0+YXBwbHlfREVEQ04yMV8xNDdfd2EoZGMtPnJlc19wb29sLT5odWJidWIpOwog
fQogCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9k
Y24yMV9odWJidWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24y
MV9odWJidWIuYwppbmRleCBmZGZiZGViMzI0NTkuLjIyMzJjY2YxNGJkZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYwpAQCAt
NjE2LDYgKzYxNiwxNCBAQCB2b2lkIGh1YmJ1YjIxX3dtX3JlYWRfc3RhdGUoc3RydWN0IGh1YmJ1
YiAqaHViYnViLAogCQkJRENIVUJCVUJfQVJCX0FMTE9XX0RSQU1fQ0xLX0NIQU5HRV9XQVRFUk1B
UktfRCwgJnMtPmRyYW1fY2xrX2NoYW5hZ2UpOwogfQogCit2b2lkIGh1YmJ1YjIxX2FwcGx5X0RF
RENOMjFfMTQ3X3dhKHN0cnVjdCBodWJidWIgKmh1YmJ1YikKK3sKKwlzdHJ1Y3QgZGNuMjBfaHVi
YnViICpodWJidWIxID0gVE9fRENOMjBfSFVCQlVCKGh1YmJ1Yik7CisJdWludDMyX3QgcHJvZ193
bV92YWx1ZTsKKworCXByb2dfd21fdmFsdWUgPSBSRUdfUkVBRChEQ0hVQkJVQl9BUkJfREFUQV9V
UkdFTkNZX1dBVEVSTUFSS19BKTsKKwlSRUdfV1JJVEUoRENIVUJCVUJfQVJCX0RBVEFfVVJHRU5D
WV9XQVRFUk1BUktfQSwgcHJvZ193bV92YWx1ZSk7Cit9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aHViYnViX2Z1bmNzIGh1YmJ1YjIxX2Z1bmNzID0gewogCS51cGRhdGVfZGNodWIgPSBodWJidWIy
X3VwZGF0ZV9kY2h1YiwKQEAgLTYyNyw2ICs2MzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGh1
YmJ1Yl9mdW5jcyBodWJidWIyMV9mdW5jcyA9IHsKIAkud21fcmVhZF9zdGF0ZSA9IGh1YmJ1YjIx
X3dtX3JlYWRfc3RhdGUsCiAJLmdldF9kY2h1Yl9yZWZfZnJlcSA9IGh1YmJ1YjJfZ2V0X2RjaHVi
X3JlZl9mcmVxLAogCS5wcm9ncmFtX3dhdGVybWFya3MgPSBodWJidWIyMV9wcm9ncmFtX3dhdGVy
bWFya3MsCisJLmFwcGx5X0RFRENOMjFfMTQ3X3dhID0gaHViYnViMjFfYXBwbHlfREVEQ04yMV8x
NDdfd2EsCiB9OwogCiB2b2lkIGh1YmJ1YjIxX2NvbnN0cnVjdChzdHJ1Y3QgZGNuMjBfaHViYnVi
ICpodWJidWIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IGUzOTk2MWQwZjI0ZS4uNWUxNWY4MDBhOWYxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVz
b3VyY2UuYwpAQCAtMTQ2OCw2ICsxNDY4LDcgQEAgc3RhdGljIHN0cnVjdCBkY2VfaHdzZXEgKmRj
bjIxX2h3c2VxX2NyZWF0ZSgKIAkJaHdzLT5yZWdzID0gJmh3c2VxX3JlZzsKIAkJaHdzLT5zaGlm
dHMgPSAmaHdzZXFfc2hpZnQ7CiAJCWh3cy0+bWFza3MgPSAmaHdzZXFfbWFzazsKKwkJaHdzLT53
YS5ERUdWSURDTjIxID0gdHJ1ZTsKIAl9CiAJcmV0dXJuIGh3czsKIH0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZGNodWJidWIuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZGNodWJidWIuaAppbmRleCBhNjI5NzIxOWQ3
ZmMuLmM4MWExN2FlYWEyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9kY2h1YmJ1Yi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvZGNodWJidWIuaApAQCAtMTQ3LDYgKzE0Nyw3IEBAIHN0cnVjdCBodWJidWJfZnVu
Y3MgewogCWJvb2wgKCppc19hbGxvd19zZWxmX3JlZnJlc2hfZW5hYmxlZCkoc3RydWN0IGh1YmJ1
YiAqaHViYnViKTsKIAl2b2lkICgqYWxsb3dfc2VsZl9yZWZyZXNoX2NvbnRyb2wpKHN0cnVjdCBo
dWJidWIgKmh1YmJ1YiwgYm9vbCBhbGxvdyk7CiAKKwl2b2lkICgqYXBwbHlfREVEQ04yMV8xNDdf
d2EpKHN0cnVjdCBodWJidWIgKmh1YmJ1Yik7CiB9OwogCiBzdHJ1Y3QgaHViYnViIHsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
