Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129D6661A
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 07:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9AA6E2C0;
	Fri, 12 Jul 2019 05:22:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94A06E2C0
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 05:22:55 +0000 (UTC)
Received: from SN1PR12CA0059.namprd12.prod.outlook.com (2603:10b6:802:20::30)
 by BN8PR12MB3089.namprd12.prod.outlook.com (2603:10b6:408:67::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Fri, 12 Jul
 2019 05:22:50 +0000
Received: from DM3NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by SN1PR12CA0059.outlook.office365.com
 (2603:10b6:802:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Fri, 12 Jul 2019 05:22:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT064.mail.protection.outlook.com (10.152.83.1) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 12 Jul 2019 05:22:48 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 12 Jul 2019
 00:22:47 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix memory allocation failure check V2
Date: Fri, 12 Jul 2019 13:22:42 +0800
Message-ID: <20190712052242.20369-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(36756003)(2351001)(4326008)(2870700001)(7696005)(51416003)(126002)(486006)(316002)(44832011)(476003)(186003)(2906002)(26005)(2616005)(53416004)(426003)(336012)(50466002)(48376002)(6916009)(53936002)(8676002)(305945005)(478600001)(8936002)(81156014)(356004)(6666004)(5660300002)(14444005)(86362001)(70206006)(70586007)(50226002)(68736007)(1076003)(47776003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3089; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b26ed434-63e5-4f7e-d802-08d70688faa7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3089; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3089:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30897B1B61ECA3D57377C481E4F20@BN8PR12MB3089.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 00963989E5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1MGMHTJtrVyC7M3PR67SxfFKndRlTHeWcVKfgCXDlCcIiuBHB1To2dCEDxgkF3VLYKzICzBnAq2FuvFjB6zYedd9jAkiHWOsI8f6gEMK3rt54JFFVZGkfxuNq3BXsWrfk7al0J5MveI+gGtrjy6CPaUouCDDhWW3E4AlbAeJ90leB/7oD9WV/DmxdFp5sZg1UmcADiJqK7YmXzsCdgyoJ5nAZiupvgBw3jdJAzn9SG8LEhgu2n5V0Y87X7/ZMpKB6C5qIritPfqWv2XASjfHOcwr8L4IxxGUowDWNriJPvSCIqNBjOkEtbinHm6c1G23ZsYg0eKmp31PbtUIGTTIkiYyBacnnhx1o9jjduFXNfVi8h/VIriIr9W/SO5JJD2k7QoWq9ty4Aq/zPq6cqOiYGltFVXXrbXt/eHj9SEP49o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2019 05:22:48.5771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b26ed434-63e5-4f7e-d802-08d70688faa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuELQrqS/1tNAWXwgyPmspO0nhisGfvUeFtHjxqUZ6E=;
 b=dSqWHdrcE7g5psXsJDZWij39e+AbqNKelK7I0NC11/7+jxnahSKWmXOoKFjp8qT/CgpuD3bk6Rl+Q2Gver8JQgcfUkme/LtRc+gbk5aBGHK7kW1SMedzppvQscRL0raUz6oFlu+PHXuygsDyKtOH0YxmQo7IDcsdQ0A+b6G58VI=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgY2hlY2suCgotIFYyOiBmaXggb25lIG1vcmUg
c2ltaWxhciBlcnJvcgoKQ2hhbmdlLUlkOiBJMDEyYjA4MmE3YTJiOTI5NzNhNzZkYjgwMjk4OTdm
YjRhMzQ0MTY5NApTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggMWZjMzY3MzA3YWMwLi5j
ODI2ZTY1NDMwYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Zl
Z2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0
LmMKQEAgLTMxOSw3ICszMTksNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF90YWJsZXNfaW5pdChzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGVzKQogCSAgICAgICAg
ICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwogCiAJc211X3RhYmxlLT5tZXRyaWNzX3Rh
YmxlID0ga3phbGxvYyhzaXplb2YoU211TWV0cmljc190KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKHNt
dV90YWJsZS0+bWV0cmljc190YWJsZSkKKwlpZiAoIXNtdV90YWJsZS0+bWV0cmljc190YWJsZSkK
IAkJcmV0dXJuIC1FTk9NRU07CiAJc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgPSAwOwogCkBAIC0x
NTAyLDcgKzE1MDIsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9zZXRfZGVmYXVsdF9vZDhfc2V0dHRp
bmdzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCiAJb2Q4X3NldHRpbmdzID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IHZlZ2EyMF9vZDhfc2V0dGluZ3MpLCBHRlBfS0VSTkVMKTsKIAotCWlmIChv
ZDhfc2V0dGluZ3MpCisJaWYgKCFvZDhfc2V0dGluZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCiAJ
c211LT5vZF9zZXR0aW5ncyA9ICh2b2lkICopb2Q4X3NldHRpbmdzOwotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
