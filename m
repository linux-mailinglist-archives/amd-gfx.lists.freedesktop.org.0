Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8269DD1
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C64789CF4;
	Mon, 15 Jul 2019 21:21:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E56A89CC9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+jcp3LPjnYXYFfh4L4Psz85QjjQGDkZzO8VXBDIM6Txov47/qfvE5MdaeRfKGdTF39f+hnMAEmyFZFPygyNe2wT1UvX4L/1NXj5qQ+r3lgB3pnC2aynFD/zizn1BDwqYk9TQT4GzQ3gmoAl+CF3Pa7WXF4IuoD5GHIbe82FMuumsDpQGJj2sR83QKGeyzh51qGqzd+Lw7MMbQxaAorpzWnlW9kEOMS6USa25NYiJzv1rlyyhCBQmXx7KDpMDp7lba3WSFEQyThBPWc6vhlNoWpY7LUC+LBcsBVEJFsI+en2jq/1JRy3s49gNMJzexkUJmn9W2AugAlf9wuiNK1DTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWmms0YH0xH/zF03B4+G6jjcs042gcKAytTNBGPUp/E=;
 b=U3mXZJVmZ11N5mVGqd0vlrtMr/rt2xfg8qJXs8ZWUmhxg25gUOtoaiP3VDdoBjGdhwfnYInWiixDu2vZ3CKorR2namEEgvZP34+xyuhs5sfN1d6Ij/F6win4toM46U3ynvBttRLzenYb219ABlYvun/7zTslLKxFYARCX6aiy4quPvIgmhbN/QJc+b/n+tiyh0fkfGBm+gVi0yX+frwMhX+nUbwJlWQk6nwGwK+e9Siv5MqA1ZjGOUd2RaH0KHkFAgE92vcSKTbZklInv8VajIQcYSjMakeA+brg3M/3MAdWKu0wEFxvfLKb1JrtT/mNfEaBcpu7hqKiENXcQhfxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 BN8PR12MB3091.namprd12.prod.outlook.com (2603:10b6:408:67::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 21:21:51 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:33 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 59/87] drm/amd/display: Fixes for some MPO cases
Date: Mon, 15 Jul 2019 17:20:21 -0400
Message-ID: <20190715212049.4584-60-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(189003)(199004)(50226002)(478600001)(8936002)(2351001)(336012)(86362001)(68736007)(186003)(8676002)(51416003)(2870700001)(76176011)(2876002)(126002)(54906003)(2616005)(11346002)(26005)(2906002)(446003)(305945005)(476003)(426003)(53936002)(49486002)(47776003)(48376002)(316002)(14444005)(1076003)(4326008)(5660300002)(70586007)(356004)(6666004)(486006)(6916009)(36756003)(70206006)(81166006)(81156014)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3091; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7bf2932-6f3c-4c4e-c454-08d7096a73e6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3091; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3091:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30910698329C1EE3A0D63BD782CF0@BN8PR12MB3091.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 04OdjJb1OpJVUyja0ARA+SJFBEmHlE41AP9KfZ3Z7bjddoFORIfj+AzNwvyi1QtaqWXh635eTCA60H9qi4F2/dFA9YpIyNtYsIed1QArvidmvHMD5uFYcbAFXBHmMXUxZlhL1pLo4acd5CQG5vt+06Lafy1ZUpvgDOsHMiso8WG5bx0LoABteWiKaUHl+nflGZONvN5YgYtMJY/TQiQAY0Bg+wq878b4Xasuq5bzjRuIiut4Bo9W0BdzLknAXZ+HIrSpiEExlD6i1S/X051Z8p5pwg4C14ihFwc7pIM4FCkMIkUN0gGyFsRjSW3xnF1gqaYSUdC3bg42ZzmovAjmpJxIsQ2mnUHnjGGl87z4hHUJxEykMFz6lbJzL3H2auiZyCCXHfzB615rVMwkztRoxKP0vm4sG/GT31eM6G/tq4k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:50.9869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bf2932-6f3c-4c4e-c454-08d7096a73e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWmms0YH0xH/zF03B4+G6jjcs042gcKAytTNBGPUp/E=;
 b=rw9w5I7TVln02z6dqZ6mFpnEqkYayov1dSSYQD6ZAVLBCzRy1/odp5AALeCnDCV0n4naLo5J4ZLcAdBLQXYJMgM92HDKs8XsDQshNftzsCsEoyt3V9Et8hpnde+l9+DE+D55lq44GCXy19tvbe80gFuGMEawDfgf0/Xs2ZRarCQ=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKW1doeV0KQWxwaGEg
Y291bGQgYmUgaW1wcm9wZXJseSBhcHBsaWVkIChvbmx5IGFmZmVjdGluZyBoYWxmIHRoZQpmcmFt
ZSkgZm9yIHNvbWUgc291cmNlIHBpeGVsIGZvcm1hdHMuCgpbSG93XQpDaGFuZ2UgaG93IGFscGhh
IGlzIGVuYWJsZWQgaW4gTVBDL0RQUCBMQiBhbmQgY2hhbmdlIHRoZQpib3R0b20gcGxhbmUgYmxl
bmQgbW9kZSBpbiBNUEMuCgpTaWduZWQtb2ZmLWJ5OiBJbHlhIEJha291bGluIDxJbHlhLkJha291
bGluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0
eXVzaGtpbkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX21wYy5jICAgfCAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9t
cGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9tcGMuYwpp
bmRleCAwYmNhMDExZWQ3YzkuLjRmN2ExMDM5MGM1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX21wYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9tcGMuYwpAQCAtMjExLDcgKzIxMSw3IEBAIHN0
cnVjdCBtcGNjICptcGMxX2luc2VydF9wbGFuZSgKIAl9IGVsc2UgewogCQluZXdfbXBjYy0+bXBj
Y19ib3QgPSBOVUxMOwogCQlSRUdfU0VUKE1QQ0NfQk9UX1NFTFttcGNjX2lkXSwgMCwgTVBDQ19C
T1RfU0VMLCAweGYpOwotCQlSRUdfVVBEQVRFKE1QQ0NfQ09OVFJPTFttcGNjX2lkXSwgTVBDQ19N
T0RFLCBNUENDX0JMRU5EX01PREVfVE9QX0xBWUVSX1BBU1NUSFJPVUdIKTsKKwkJUkVHX1VQREFU
RShNUENDX0NPTlRST0xbbXBjY19pZF0sIE1QQ0NfTU9ERSwgTVBDQ19CTEVORF9NT0RFX1RPUF9M
QVlFUl9PTkxZKTsKIAl9CiAJUkVHX1NFVChNUENDX1RPUF9TRUxbbXBjY19pZF0sIDAsIE1QQ0Nf
VE9QX1NFTCwgZHBwX2lkKTsKIAlSRUdfU0VUKE1QQ0NfT1BQX0lEW21wY2NfaWRdLCAwLCBNUEND
X09QUF9JRCwgdHJlZS0+b3BwX2lkKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggMmFlZTY2M2YxMzQ0Li41MzFhZDQ0Njg0
NTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5jCkBAIC0xODM4LDcgKzE4MzgsNyBAQCBzdGF0aWMgdm9pZCBkY24yMF91cGRhdGVf
bXBjYyhzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogewogCXN0cnVj
dCBodWJwICpodWJwID0gcGlwZV9jdHgtPnBsYW5lX3Jlcy5odWJwOwogCXN0cnVjdCBtcGNjX2Js
bmRfY2ZnIGJsbmRfY2ZnID0geyB7MH0gfTsKLQlib29sIHBlcl9waXhlbF9hbHBoYSA9IHBpcGVf
Y3R4LT5wbGFuZV9zdGF0ZS0+cGVyX3BpeGVsX2FscGhhICYmIHBpcGVfY3R4LT5ib3R0b21fcGlw
ZTsKKwlib29sIHBlcl9waXhlbF9hbHBoYSA9IHBpcGVfY3R4LT5wbGFuZV9zdGF0ZS0+cGVyX3Bp
eGVsX2FscGhhOwogCWludCBtcGNjX2lkOwogCXN0cnVjdCBtcGNjICpuZXdfbXBjYzsKIAlzdHJ1
Y3QgbXBjICptcGMgPSBkYy0+cmVzX3Bvb2wtPm1wYzsKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
