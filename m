Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F085884DD
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0B56EEA4;
	Fri,  9 Aug 2019 21:38:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850B6EEA4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxeQuN78pJ5i24PO16d1c+ITGnwD9Ipbub7qJto4se90hampzk6If6sdSka70AczBgo0PmCHqBH0Sc7u+xfjP2ruEMDG8zGs8eS+0eJqORoSBqf62oIJXHwcGX/x4BTaVmnbC0koNuIeFJc6aQ2+2tg6I8Dav2Ug0ALQvEsQCKxB16jo784c0jeC+tWR/sRNd49JZfBKYbU9v+5pHippvEXCqbOQIyDDnWe0RytJnf0eKA0+Ic0kMelk6p2H4gSxKEpQzb1me3b3L8w4hQri19HfXVGexDbJ/6iKu71haydYxb7R96USoWJiQitWOvbiOsKR7pKKCey7CWISpqJcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkyN+MQ41BXQ17hGcAgxwFmalGykB+jq1aC+zcl9s+8=;
 b=CBduYXa8/HkiH9EuLcndZawch/nICo8hlxT8B6hnTrwATGX4P/z1hUeZAbUnHUu6O1bVt5BIZ6MoSouDqp/YUKdv3HyTVpTxYVxhLxlrRSsr8Wbl34GtSsxLA8rjPX1f6vuRa8bl4wvYxUGMH89loNIc4iwqif/nAU6Hej6DIQ9h9nPbzZRR30/ZlhBlwqNQDlrOXcn96jxdxYLRtHZPYd1Mp7KmYjr3MK+6JiYRegWZUd3fxz4WU2gR+LaJi69rP17QgBZUnNKTd5sePEmHaFMNOl2BfYQT4HgompGrS3YDrl5kzK/55di3CHivM2b8DAiOpFc7jIwR13159FmkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0043.namprd12.prod.outlook.com (2603:10b6:903:129::29)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Fri, 9 Aug
 2019 21:38:14 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by CY4PR12CA0043.outlook.office365.com
 (2603:10b6:903:129::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:07 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/49] drm/amd/display: reset drr programming on pipe reset
Date: Fri, 9 Aug 2019 17:36:56 -0400
Message-ID: <20190809213742.30301-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(376002)(346002)(2980300002)(428003)(199004)(189003)(8936002)(47776003)(2906002)(2870700001)(1076003)(2876002)(305945005)(50226002)(356004)(5660300002)(8676002)(6666004)(48376002)(2351001)(11346002)(446003)(49486002)(51416003)(76176011)(6916009)(86362001)(50466002)(126002)(81166006)(53936002)(486006)(2616005)(476003)(336012)(4326008)(70586007)(81156014)(426003)(70206006)(478600001)(36756003)(26005)(316002)(54906003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65196f65-d88d-4442-c418-08d71d11e236
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1268A3F82567408FA701395482D60@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 37nSypgCk/H8KSIyzTnkaKNrm/VeWZhWPCvs4TvGSfo+aJfP9GVtakGm+a+dx2vWCjKfWvq9SEkw7iB/DfEZdpz6k7voLyadFrOp67EpPcjmffAfTUuZPwE4M1mklmHFt2BBmR0xKpVQZIIoTttEDIYyghIawYSrzz37EdoEQal90VcKWUVjFgIy2Y+kSuCPNTdE6278YNwMZVPGUgIRjxBc+YmAMj1NAg/3OzwqkRed1hggBMU3v3MGQklqh//0kXJZ0XAyCJ5OrO71hL/1byKWPCoYgxpEtSVTov+56o9rE22v5kbATQRCObbNtUOIfySnPNIGClqQvHEGC4Yb34L3nXQkDzlyMuAtOkFj1Py47Ofgyzgt8PyP0mzo175g0wetMhSvGWgq5vsuxH56wtaiO1p1QVmMGXTcyd6SQIg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:14.1442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65196f65-d88d-4442-c418-08d71d11e236
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkyN+MQ41BXQ17hGcAgxwFmalGykB+jq1aC+zcl9s+8=;
 b=lInLQOELjTykxtLkBku/iCjYrVtgMUUevfMz7ae6McVZjx3LiDWcGvFXSvRr71diHDGi4Oq7wksRIEvik0Z9RfEXclST7FLoipqr5I/+AKuDpDrq/xsCrl9cBiBijhusqpdQPR+rJDP4A/e8as73v0qjb0Q3lAN79ZrYa5Ys1zY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpkcnIgaXMgc3Rp
bGwgZW5hYmxlZCBhZnRlciBkcml2ZXIgaXMgdW5sb2FkZWQgY2F1c2luZyBibGFjayBzY3JlZW4K
Cltob3ddCmRpc2FibGUgZHJyIGR1cmluZyBwaXBlIHJlc2V0LgoKU2lnbmVkLW9mZi1ieTogV2Vu
amluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4u
TGVpQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMg
fCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmMgICAgICAgIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19z
ZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9o
d19zZXF1ZW5jZXIuYwppbmRleCA5NmFhZTE5YzNkNmMuLjhlMWRlNDIzZTU2NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19z
ZXF1ZW5jZXIuYwpAQCAtODIyLDYgKzgyMiw5IEBAIHN0YXRpYyB2b2lkIGRjbjEwX3Jlc2V0X2Jh
Y2tfZW5kX2Zvcl9waXBlKAogCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+ZnVuY3MtPmRpc2Fi
bGVfY3J0YyhwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zyk7CiAKIAkJcGlwZV9jdHgtPnN0cmVhbV9y
ZXMudGctPmZ1bmNzLT5lbmFibGVfb3B0Y19jbG9jayhwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zywg
ZmFsc2UpOworCQlpZiAocGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmZ1bmNzLT5zZXRfZHJyKQor
CQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmZ1bmNzLT5zZXRfZHJyKAorCQkJCQlwaXBlX2N0
eC0+c3RyZWFtX3Jlcy50ZywgTlVMTCk7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IGRjLT5yZXNf
cG9vbC0+cGlwZV9jb3VudDsgaSsrKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCAzOGIzYzg5YjJhNTkuLjI3ZDE0MzQxOGNj
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKQEAgLTE4MzQsNiArMTgzNCwxMCBAQCBzdGF0aWMgdm9pZCBkY24yMF9yZXNldF9i
YWNrX2VuZF9mb3JfcGlwZSgKIAkJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+
c2V0X29kbV9ieXBhc3MpCiAJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+ZnVuY3MtPnNldF9v
ZG1fYnlwYXNzKAogCQkJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50ZywgJnBpcGVfY3R4LT5zdHJl
YW0tPnRpbWluZyk7CisKKwkJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+c2V0
X2RycikKKwkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+c2V0X2RycigKKwkJCQkJ
cGlwZV9jdHgtPnN0cmVhbV9yZXMudGcsIE5VTEwpOwogCX0KIAogCWZvciAoaSA9IDA7IGkgPCBk
Yy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkrKykKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
