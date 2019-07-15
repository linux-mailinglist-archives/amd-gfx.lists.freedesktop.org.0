Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4169DCB
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E3189CB5;
	Mon, 15 Jul 2019 21:21:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EEF89CBA
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gF1t4tSlWL2PEMp0Edct+rqc4XG6lfk+0R/9RANJ72z8yxzm39gtDzOBVlqyOUPbxRm3f3gBajVWOkd7QGCyZUUmTvkYKhq5qFsAaawikY0RGntMc/VnIiT2iHS2b2KXi4yoRV1Hmg6yhzSBob6o46Grd/jrc2Ts0LJ0BtDswNixbZY9mbqDhvMwXuA8Wz7cthhpak84Mg3aMZ3JkX/vkbV8sveTBxNHcpVHwxTsxWf7ZHQAlyunuHNN0UJLrQFDmHALl5O8ghuoDDE91PcJht8L3ydfRiTa+u+SaeyhmPR3vJp4D5ti/JIR+MuPK7L6/abHsoEuntExPK5YtviL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K44ysjF3RAWUEbfecIz0asbiWi8gxADHhiioJP6lyI=;
 b=ODx6TftmR4t+L9va9kdN3e419pL+buoS1bzWHjR9OL8gSZ5NwnYwAQRj9c/noGqdOE0MR9vCwlsNq5nS928X3rP8tvCQXLl6pR9NZIgOu6/xkeo8bipftxeFBzIKToUGhn52At9LBeztj5T19YSJVenRPxLkW70e1v8kOsKB1ZFsL2+5BeCA0ij1zvyD1AXfivR8tRhVaVP4EgyAI+P5Ncqgi7weDY93WIFALXRtit08rqVXU61DRIIWKTtbp76rRS8oZkUmx2GmtsJjfj2XmtmnKtvnpanLsCvFOmmN7ulzAXs2UZSnS+XYR6iGTZcrycHSFHgvV9k+++vbFf2ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 BN8PR12MB3091.namprd12.prod.outlook.com (2603:10b6:408:67::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 21:21:50 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:49 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:32 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 57/87] drm/amd/display: Add DIG_CLOCK_PATTERN register
Date: Mon, 15 Jul 2019 17:20:19 -0400
Message-ID: <20190715212049.4584-58-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(189003)(199004)(50226002)(478600001)(8936002)(2351001)(336012)(86362001)(68736007)(186003)(8676002)(51416003)(2870700001)(76176011)(2876002)(126002)(54906003)(2616005)(11346002)(26005)(2906002)(446003)(305945005)(476003)(426003)(53936002)(49486002)(47776003)(48376002)(316002)(1076003)(4326008)(5660300002)(70586007)(356004)(6666004)(486006)(6916009)(36756003)(70206006)(81166006)(81156014)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3091; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f822e70c-24e3-4acb-5635-08d7096a7347
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3091; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3091:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30913E321802DF5FD6AC5E0282CF0@BN8PR12MB3091.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZKYORpyL/1v2rxPDjWujVhSMHvupaqqmEzoCArTkJBezJB5L3PnV09w4OquIX0qVjgB5n5vuafwrnGtJYQlnCI66FCVmbU61EvIIs51rQPBab2cFG66knxqwp8qCYGd90N9atjBQPnVecYQEEe4nyI74OWKkPzhdURg1aPSBz7JqmhpdtuNkL5/lEu6ROE+d7weSir7oqkyBHXdd8hJutowkyHzugmnHpJhaTX1VU4RY6PasgBldRDfFES5Acv3P/ebrqE+Qun10M+7itVbBn1rP1L8HUgZjqJLMysktFaAM+GNnJdtqvafoz77EtZ7sGd7Kr7QFe8K5NAXCVX1AAqoBNCtFzoSDlkky6PQ0KGMxlf246Otwrg038ih7A9PsLpEmSxKb/iF9UlWKP45l43qXsViEbbJtJ/gf+rf7Ing=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:49.9461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f822e70c-24e3-4acb-5635-08d7096a7347
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K44ysjF3RAWUEbfecIz0asbiWi8gxADHhiioJP6lyI=;
 b=Rug1n3e4IDMM9RRxK4hygWnDq3bom4rrDOgM4JWUTye+ClPhxxVNnyFnJEQVYwEhs2liwLrVC8FjotvgWWGGhIToab1JRiWX0T+Oe/6fJpQqj+xPITX9nEDYDWi8Gy6VFAa28NZtRaXrXKkw+VGRRSWGv9uCawbzj5aMJ/EsVgY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Nevenko Stupar <Nevenko.Stupar@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmV2ZW5rbyBTdHVwYXIgPE5ldmVua28uU3R1cGFyQGFtZC5jb20+CgpBZGQgdGhpcyBy
ZWdpc3RlciBmb3IgZnV0dXJlIHVzZQoKU2lnbmVkLW9mZi1ieTogTmV2ZW5rbyBTdHVwYXIgPE5l
dmVua28uU3R1cGFyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBWaXRhbHkgUHJvc3lhayA8dml0YWx5
LnByb3N5YWtAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgot
LS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuaCAg
ICB8IDEwICsrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX3N0cmVhbV9lbmNvZGVyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuaAppbmRleCBhYjBlYWQzYzNmNDYuLmY1ODVl
N2I2MjBjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX3N0cmVhbV9lbmNvZGVyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX3N0cmVhbV9lbmNvZGVyLmgKQEAgLTg5LDcgKzg5LDggQEAKIAlTUkko
RFBfVklEX1NUUkVBTV9DTlRMLCBEUCwgaWQpLCBcCiAJU1JJKERQX1ZJRF9USU1JTkcsIERQLCBp
ZCksIFwKIAlTUkkoRFBfU0VDX0FVRF9OLCBEUCwgaWQpLCBcCi0JU1JJKERQX1NFQ19USU1FU1RB
TVAsIERQLCBpZCkKKwlTUkkoRFBfU0VDX1RJTUVTVEFNUCwgRFAsIGlkKSwgXAorCVNSSShESUdf
Q0xPQ0tfUEFUVEVSTiwgRElHLCBpZCkKIAogI2RlZmluZSBTRV9EQ05fUkVHX0xJU1QoaWQpXAog
CVNFX0NPTU1PTl9EQ05fUkVHX0xJU1QoaWQpCkBAIC0xNzAsNiArMTcxLDcgQEAgc3RydWN0IGRj
bjEwX3N0cmVhbV9lbmNfcmVnaXN0ZXJzIHsKIAl1aW50MzJfdCBIRE1JX01FVEFEQVRBX1BBQ0tF
VF9DT05UUk9MOwogCXVpbnQzMl90IERQX1NFQ19GUkFNSU5HNDsKICNlbmRpZgorCXVpbnQzMl90
IERJR19DTE9DS19QQVRURVJOOwogfTsKIAogCkBAIC0yOTgsNyArMzAwLDggQEAgc3RydWN0IGRj
bjEwX3N0cmVhbV9lbmNfcmVnaXN0ZXJzIHsKIAlTRV9TRihEUDBfRFBfTVNBX1RJTUlOR19QQVJB
TTQsIERQX01TQV9WSEVJR0hULCBtYXNrX3NoKSxcCiAJU0VfU0YoRElHMF9IRE1JX0RCX0NPTlRS
T0wsIEhETUlfREJfRElTQUJMRSwgbWFza19zaCksXAogCVNFX1NGKERQMF9EUF9WSURfVElNSU5H
LCBEUF9WSURfTl9NVUwsIG1hc2tfc2gpLFwKLQlTRV9TRihESUcwX0RJR19GRV9DTlRMLCBESUdf
U09VUkNFX1NFTEVDVCwgbWFza19zaCkKKwlTRV9TRihESUcwX0RJR19GRV9DTlRMLCBESUdfU09V
UkNFX1NFTEVDVCwgbWFza19zaCksXAorCVNFX1NGKERJRzBfRElHX0NMT0NLX1BBVFRFUk4sIERJ
R19DTE9DS19QQVRURVJOLCBtYXNrX3NoKQogCiAjZGVmaW5lIFNFX0NPTU1PTl9NQVNLX1NIX0xJ
U1RfU09DKG1hc2tfc2gpXAogCVNFX0NPTU1PTl9NQVNLX1NIX0xJU1RfU09DX0JBU0UobWFza19z
aCkKQEAgLTQ2MCw3ICs0NjMsOCBAQCBzdHJ1Y3QgZGNuMTBfc3RyZWFtX2VuY19yZWdpc3RlcnMg
ewogCXR5cGUgSERNSV9EQl9ESVNBQkxFO1wKIAl0eXBlIERQX1ZJRF9OX01VTDtcCiAJdHlwZSBE
UF9WSURfTV9ET1VCTEVfVkFMVUVfRU47XAotCXR5cGUgRElHX1NPVVJDRV9TRUxFQ1QKKwl0eXBl
IERJR19TT1VSQ0VfU0VMRUNUO1wKKwl0eXBlIERJR19DTE9DS19QQVRURVJOCiAKICNpZiBkZWZp
bmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKICNkZWZpbmUgU0VfUkVHX0ZJRUxEX0xJU1Rf
RENOMl8wKHR5cGUpIFwKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
