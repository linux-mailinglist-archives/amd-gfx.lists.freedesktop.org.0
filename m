Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC7C140F
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Sep 2019 11:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1307F6E2E3;
	Sun, 29 Sep 2019 09:21:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700086.outbound.protection.outlook.com [40.107.70.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE2F6E2E3
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Sep 2019 09:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx4OLD3dgei6wAjLrEdCcRiYnVIKlXeud1eHe/2Pn1mjh4C/qMcUCIFqfUPR5sSEaxTSvP7uz5sofhndp7Vogp79H4u4WI7EzAJ9SsW1XLRH4NnvjI3/6yBA7FjeLn2e04VIW3AgMmM8RyVTS8AM5KEcUPGWPVmP2mdvB9ZIk60pH2df6c2tGGP8IdJ2dGMXqJvckMkue64K18LU3Ac+FkeErAtWOQA4I2AGWVuUxKiNaGPTmI22GpvzIEi2JeFrgLo0eZ8+r7AoVXmJJEG0lV6MNDaEAFnkzS3jfAPzpy2zCStTCCwy9ZicHjPMR7dY98UZmsqSi8EffKNwldflAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEYT4K7AE+L3Ck78QFSUbH84csnD7m99Uxj/2M6a11A=;
 b=YgykXrKhhomBBvLhGtKOB/dgyE38QIAa+VTBVskzb9YQpWq55/BEoiacnNQC2J7IDwi5XkErc+kC+CoaQbXfTDRlx12B4HiKG2AXlKFTJwSCRBn0MvviMMZHPl2kQIm5RBeEHw8Fvt6JS2uU4K7yqcPNdyNd0iGEOpuajx6GuC/BJ5qaptcQa9+rUFa5aD27XEaXZ21jojkGXApAGNRMZ25MJ9r/Mzn8v0ssH3w6ehPnIqq4pg778LRLX89+648PUMt2Byu/ynyuFw787iWKQoWH3a5VnD8vy474cw1QC2i8AkLDm7HEfSbYpCqk2iMsV73YFHeJS8SbHV/KgfEf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0096.namprd12.prod.outlook.com (2603:10b6:0:55::16) by
 CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Sun, 29 Sep 2019 09:21:24 +0000
Received: from CO1NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0096.outlook.office365.com
 (2603:10b6:0:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Sun, 29 Sep 2019 09:21:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT041.mail.protection.outlook.com (10.152.81.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 09:21:24 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 29 Sep 2019 04:21:23 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: Protect backend resource when unload driver
Date: Sun, 29 Sep 2019 17:20:56 +0800
Message-ID: <1569748856-19532-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
References: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(428003)(189003)(199004)(305945005)(36756003)(51416003)(186003)(14444005)(478600001)(70586007)(50466002)(8676002)(81156014)(81166006)(5660300002)(70206006)(486006)(426003)(26005)(356004)(7696005)(76176011)(2906002)(48376002)(446003)(86362001)(126002)(6666004)(11346002)(47776003)(50226002)(316002)(8936002)(2616005)(53416004)(6916009)(54906003)(16586007)(336012)(4326008)(2351001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4119; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eb0c2bf-13ca-4ea5-de65-08d744be6643
X-MS-TrafficTypeDiagnostic: CH2PR12MB4119:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4119E5D00A2ABED183C03BC1EF830@CH2PR12MB4119.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 017589626D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bXI4XKBV/1tyhvH0cgASGthkkgudXKZaKu0/9wLkSq1nmBQEPtSqqTuxfpwcztDp1fsFV41vX31xCGn16oDGNeWJhe6sK3zXDXafJf6E70LDKpnY4BdPYP9ZY5iF02bi/b8Gd8OBfAekU21UjJ/5zFA44MxwpkOTCVSB9O8mCmX1SnsM8HiMduZJ3hp2CEXRE92ySYwRKywzWE6P/1kIApwmy3GQqIExWdVnnjKEdbEOVhapWOZkWk8bOpDZZC+OQDV/MVqscBOxp9/kDXOYX61eNJjvJKfDop5b7OoqwifX7V06OPDkIx/XfCeB5Yfrq4oRXBXIvC4uw0vP4WXKLsoefdKTN5B3QsXNd5mtP4tGYJmnMYWu7x6FUC01meMO9VTalQtFgRk/AcPZqDZLzO87TvZVl63xLM8LTrMliDU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 09:21:24.4411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb0c2bf-13ca-4ea5-de65-08d744be6643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEYT4K7AE+L3Ck78QFSUbH84csnD7m99Uxj/2M6a11A=;
 b=1WRaV3S7Q+ZCqIqZqBsVlCUgUergfM2j8dEIwyuef0QkUe62xmjYmmVcJ7xViYjNLnnhPW8+wQ/DFiPlByDPwlj3PwaqJfSx/N4dPRJBtuay3jsxwfVhOXpim4GBsvStD1H5JW1xak67htq6in2gr2LkFLd44HXZTb7XwgehTbs=
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

RnJvbTogSmVzc2UgWmhhbmcgPFpoZXhpLlpoYW5nQGFtZC5jb20+CgpHdWVzdCBkcml2ZXIgY2Fu
IGJlIHVubG9hZGVkIHdoaWxlIGVuZ2luZXMgc3RpbGwgdXNpbmcgc29tZQpiYWNrZW5kIHJlc291
cmNlcy4gVGhhdCB3b3VsZCBsZWFkIHRvIHVzZSBhZnRlciBmcmVlIGFuZCB0aGVuCmNhdXNlIGd1
ZXN0IGRyaXZlciBmYWlsZWQuCgpOZWVkIHRvIGFkZCBtdXRleCBsb2NrIGJlZm9yZSBiYWNrZW5k
IHJlc291cmNlcyBmcmVlIHRvIG1ha2UKc3VyZSBub2JvZHkgaXMgdXNpbmcgaXQuCgpOZWVkIHRv
IGNoZWNrIGJhY2tlbmQgZGF0YSBhdmFpbGFibGlsaXR5IGJlZm9yZSBWQ0UvVVZEIGVudGVyCnBv
d2VyZ2F0aW5nIG1vZGUsIGlmIGJhY2tlbmQgcmVzb3VyY2VzIGhhdmUgYmVlbiBmcmVlLCB0aGVu
CnNraXAgZW50ZXJpbmcgcG93ZXJnYXRpbmcuCgpDaGFuZ2UtSWQ6IElmN2Y5MzIyMWRkZWNjNTc4
ODg0ZGM5ZTk5YTUyZjIyYTQzZTE2YjA3ClNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4
aS56aGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9w
b3dlcnBsYXkuYyAgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTEwX2h3bWdyLmMgfCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93
ZXJwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMK
aW5kZXggZmE4YWQ3ZC4uYzMyYjJkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZF9wb3dlcnBsYXkuYwpAQCAtMTM0LDcgKzEzNCw5IEBAIHN0YXRpYyBpbnQgcHBfaHdf
ZmluaSh2b2lkICpoYW5kbGUpCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBoYW5kbGU7
CiAJc3RydWN0IHBwX2h3bWdyICpod21nciA9IGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7CiAK
KwltdXRleF9sb2NrKCZod21nci0+c211X2xvY2spOwogCWh3bWdyX2h3X2ZpbmkoaHdtZ3IpOwor
CW11dGV4X3VubG9jaygmcHBfaHdtZ3ItPnNtdV9sb2NrKTsKIAogCXJldHVybiAwOwogfQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwpp
bmRleCBkMDg0OTNiLi5lNTFmZmRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwpAQCAtNDYxOSw2ICs0NjE5LDkgQEAgc3RhdGlj
IHZvaWQgdmVnYTEwX3Bvd2VyX2dhdGVfdmNlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGJvb2wg
YmdhdGUpCiB7CiAJc3RydWN0IHZlZ2ExMF9od21nciAqZGF0YSA9IGh3bWdyLT5iYWNrZW5kOwog
CisJaWYgKCFkYXRhKQorCQlyZXR1cm47CisKIAlkYXRhLT52Y2VfcG93ZXJfZ2F0ZWQgPSBiZ2F0
ZTsKIAl2ZWdhMTBfZW5hYmxlX2Rpc2FibGVfdmNlX2RwbShod21nciwgIWJnYXRlKTsKIH0KQEAg
LTQ2MjcsNiArNDYzMCw5IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9wb3dlcl9nYXRlX3V2ZChzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyLCBib29sIGJnYXRlKQogewogCXN0cnVjdCB2ZWdhMTBfaHdtZ3Ig
KmRhdGEgPSBod21nci0+YmFja2VuZDsKIAorCWlmICghZGF0YSkKKwkJcmV0dXJuOworCiAJZGF0
YS0+dXZkX3Bvd2VyX2dhdGVkID0gYmdhdGU7CiAJdmVnYTEwX2VuYWJsZV9kaXNhYmxlX3V2ZF9k
cG0oaHdtZ3IsICFiZ2F0ZSk7CiB9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
