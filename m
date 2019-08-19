Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3EE926EE
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2746E167;
	Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426AD6E15D
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTe3XbSm0EDXSKbY12xxEv3515VnUgzQJnYgvNytufQoc9f9+gUWDvW9X8ZgNQyaWDZ0dEF/MaLvteHRHORc6jalKxPNPYIAmsgSypYtuECwx9l7B2jYQzhQ6msDQzPI4Yh/kAfPJAgttT7OkFvn/Ej1ZeHwYPQdscfUJ6EkfBrj7pgA8XZW2gXl4fBhqHdR0O8G9e04bamDItmCNtrcOJw5VKMMZiV0G46FWLrh6rpRlrYjZ4SSosJA010E6t65c7Wtl3xsrCBCdgPv2rAV6I7WaEp3Ec5yHM7j4F/awDbUVj/XmpGyrcjR9ItwXOf62AB2AEsndX3nR7GdAFxPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxzS1BrblF4HygiDsP7WKkmfu2X5sDmdpRGe8Hr1iTw=;
 b=Mkrl1ygWSsn13pM06S8/K2PlIYs/jcRwBFhGMUfFIvjKlfSqrMKvBY2LKgzBMrEECwc/QtX0q/xganSxdPtnP1J7qDQjp2pix4SSKimi6Rb56onpx60NnFIBlKYho605ph+8Ub7idZaUnk3ZQa/2sh0lx6XntVAqrnEfAYJDPoiFTxOYN4H7BSfovrppHGGpSqUDNoPDpns9mvauVg4LNiR748kAerXF4Nh2sWFlqYBf8peNAOlvO3rkUeGBURZlVIf4a105aR+OixQsVbq7qKTHlVg/BeyPbJbI/78GX8bFsgxFKwrxyseheDv7kuUC6raqbQVzvee8mLlYJLGYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by DM5PR12MB1273.namprd12.prod.outlook.com (2603:10b6:3:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:35:54 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:53 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/36] drm/amd/display: fix stuck test pattern on right half
 of display
Date: Mon, 19 Aug 2019 10:34:57 -0400
Message-ID: <20190819143515.21653-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(70206006)(47776003)(86362001)(2906002)(305945005)(1076003)(5660300002)(53416004)(2351001)(36756003)(16586007)(186003)(50466002)(48376002)(81156014)(76176011)(8676002)(81166006)(8936002)(478600001)(14444005)(50226002)(53936002)(126002)(2616005)(356004)(6666004)(446003)(476003)(11346002)(486006)(336012)(316002)(426003)(4326008)(6916009)(51416003)(26005)(7696005)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1273; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4812bfa-2cea-459a-4173-08d724b28a43
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1273; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1273:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1273134E3E3015D470C1AFDAF9A80@DM5PR12MB1273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rLlF5bGMZa7jFqQ5RJi4Bjw0kvlCvNKZ8jhpUcxlVeJXnnnhZAzzFCNQc1lD/phV3S/jBFnfozBDAGavV7AIzTtOntvA0rTIadYxNkBqjbhYNEkAk9SQkqjux/zC0+fJO4NVZYdbqmpElM7SnpSdYeepGhti3kkKppMB0dtu2BQPQ5z4YqP5m14GFWg2uukb6ruavAspXgRUXfjwWGgthlNE4nr3oR1Spmph0MdJFzkDnYRhczS0bjxKxKvdLleeSFkqiRZkwc743D7iyWSZQNuQoXTlgZC5mf9PqnA4LN4E1p+cMlk6G0T4ANBQ2uCNNTOo+NMtPn388YYOtTmoyIJF1GYtzb/eUZ0C48ssUaXcMLb7dDEILfxBNG4wmpCr4lvceFUwc9MhHA3OwQfWKGKNGh4GU77NH0FhXlkedTA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:53.7065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4812bfa-2cea-459a-4173-08d724b28a43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxzS1BrblF4HygiDsP7WKkmfu2X5sDmdpRGe8Hr1iTw=;
 b=bxt1fEjJPHCnzUsiqJIgyCxa66B+UQcX6Ep1nKPjocg9+6POiP0kVJsW/ObrVgY2wZwukoMMid4813YBiaNePtwVVQD1kzqVvaVbfvIdHD4+SCAa2AvmyBfGed8/EZ2oZShsfKVUOeYlNBX5DAN+pb+kVPkIpHNOkcK0r770TOE=
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
Cc: Zi Yu Liao <ziyu.liao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+Cgpbd2h5XQpXaXRoIHZpc3VhbCBj
b25maXJtIGVuYWJsZWQsIGRpc3BsYXlzIHdoZXJlIE9ETSBjb21iaW5lIGlzIGVuYWJsZWQKaGFz
IGEgdGVzdCBwYXR0ZXJuIHN0dWNrIG9uIHRoZSByaWdodCBoYWxmIG9mIHRoZSBkaXNwbGF5IGV2
ZW4KdGhvdWdoIHRoZSBkaXNwbGF5IGlzIHVuYmxhbmtlZC4KCltob3ddCkFkZCBhIGNvbmRpdGlv
biB0byBub3Qgc2hvdyB0aGUgY29sb3VyIHJhbXAgdGVzdCBwYXR0ZXJuIHdoZW4gdGhlCmRpc3Bs
YXkgaXMgdW5ibGFua2VkLgoKU2lnbmVkLW9mZi1ieTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBFcmljIFlhbmcgPGVyaWMueWFuZzJAYW1kLmNvbT4KQWNrZWQt
Ynk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCA0
YTc0YTRmYjNhYjkuLjMxYTk4NTg1OGJhZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKQEAgLTg5Miw3ICs4OTIsNyBAQCB2b2lk
IGRjbjIwX2JsYW5rX3BpeGVsX2RhdGEoCiAJZm9yIChvZG1fcGlwZSA9IHBpcGVfY3R4LT5uZXh0
X29kbV9waXBlOyBvZG1fcGlwZTsgb2RtX3BpcGUgPSBvZG1fcGlwZS0+bmV4dF9vZG1fcGlwZSkg
ewogCQlvZG1fcGlwZS0+c3RyZWFtX3Jlcy5vcHAtPmZ1bmNzLT5vcHBfc2V0X2Rpc3BfcGF0dGVy
bl9nZW5lcmF0b3IoCiAJCQkJb2RtX3BpcGUtPnN0cmVhbV9yZXMub3BwLAotCQkJCWRjLT5kZWJ1
Zy52aXN1YWxfY29uZmlybSAhPSBWSVNVQUxfQ09ORklSTV9ESVNBQkxFID8KKwkJCQlkYy0+ZGVi
dWcudmlzdWFsX2NvbmZpcm0gIT0gVklTVUFMX0NPTkZJUk1fRElTQUJMRSAmJiBibGFuayA/CiAJ
CQkJCQlDT05UUk9MTEVSX0RQX1RFU1RfUEFUVEVSTl9DT0xPUlJBTVAgOiB0ZXN0X3BhdHRlcm4s
CiAJCQkJc3RyZWFtLT50aW1pbmcuZGlzcGxheV9jb2xvcl9kZXB0aCwKIAkJCQkmYmxhY2tfY29s
b3IsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
