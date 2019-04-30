Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898171017B
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DC189226;
	Tue, 30 Apr 2019 21:09:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730072.outbound.protection.outlook.com [40.107.73.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D670B8923D
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:57 +0000 (UTC)
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by BY2PR12MB0647.namprd12.prod.outlook.com (2a01:111:e400:52e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Tue, 30 Apr
 2019 21:09:55 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/20] drm/amd/display: add SW_USE_I2C_REG request.
Date: Tue, 30 Apr 2019 17:09:09 -0400
Message-ID: <20190430210938.32335-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(48376002)(8936002)(53416004)(50466002)(72206003)(53936002)(478600001)(70586007)(476003)(1076003)(2616005)(11346002)(486006)(86362001)(47776003)(6666004)(126002)(446003)(81156014)(81166006)(8676002)(14444005)(356004)(2351001)(50226002)(68736007)(26005)(305945005)(336012)(186003)(426003)(70206006)(77096007)(4326008)(16586007)(6916009)(36756003)(76176011)(51416003)(2906002)(316002)(5660300002)(7696005)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR12MB0647; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f27afa4-9344-4532-aa71-08d6cdb031c9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BY2PR12MB0647; 
X-MS-TrafficTypeDiagnostic: BY2PR12MB0647:
X-Microsoft-Antispam-PRVS: <BY2PR12MB06474CFE5FD74DA6E90CF7B2F93A0@BY2PR12MB0647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Wb7VeivgrLz2RYnIz50NOeMSodpPfbilhpzUtygYZvfKb7dKkZcL22MLEqRCBnZwMH2YbZCO/H0EPqUe+xx7du8p1BoN5f3FjGkYzY+4TpY3LxmEf0VdaGFMzLiA0vUqDoOyWEDKi2yt7kwZzNF24TbxEVNAW+fVO53AsgXy61NYpy7j6UsMHAZ6o7qRZBlU/YAd1sWdKSsA1XoULrS3aL6qMMH9W55CCQx2xjgDmFBZCXHuHYTbXhPaxRFcmnyHLz40Gob57fivpPBn4bOf50L20MAm4GvqfYAkJMYYBI+4XmopNw3CS/WaC7zT56Kp5ammZFr//lZbnRZc1z5xNNamAeWu+3KBnEof+2aIwENgaUl6fAU3OunG6CjmdIG9BF8JAUCHLs5mAbyDpyLFyuR/KDBlZKN4Ve1RbUBojVg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:55.0850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f27afa4-9344-4532-aa71-08d6cdb031c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR12MB0647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YAY1en7tHKPLC/Y+htJ3bGRPVvswrtDu68lvNaZnyA=;
 b=HLdi9jRsbwduD1J55Co6w1XfBcaQJnDlCj8GLxC9SoX74bmBYxefLPOjHfLgoZKs7wqZSfIQeOpTQsbjI+njwIFXgIoEzZGP34Mbe6oMDrmFcGNZ1MW9dMG3W3pPqCYTKIaEOBMkhZ3u3SOqS2fvDgR/p/QaIHQa/rFmVa9P1wA=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
VGhpcyBpcyBmb3IgRENfSTJjIGFyYml0cmF0aW9uIHVzZSBiZXR3ZWVuIEhXIHVzZS9TVyB1c2Ug
YW5kIERNQ1UgdXNlLgoKQ2hhbmdlLUlkOiBJNDRmZDk4YzBlMGZmOTFiYjcxZGFjOGE5YzU3YjUw
Y2Y2ZWM1OTIxZgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6
IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jIHwgNyArKysrKy0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuaCB8IDMgKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jCmluZGV4IGNkMjYx
NjFiY2M0ZC4uNTI2YWFiNDM4Mzc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9pMmNfaHcuYwpAQCAtMjY4LDYgKzI2OCw4IEBAIHN0YXRpYyBib29sIHNl
dHVwX2VuZ2luZSgKIAlzdHJ1Y3QgZGNlX2kyY19odyAqZGNlX2kyY19odykKIHsKIAl1aW50MzJf
dCBpMmNfc2V0dXBfbGltaXQgPSBJMkNfU0VUVVBfVElNRV9MSU1JVF9EQ0U7CisJLyogd2UgaGF2
ZSBjaGVja2VkIEkyYyBub3QgdXNlZCBieSBETUNVLCBzZXQgU1cgdXNlIEkyQyBSRVEgdG8gMSB0
byBpbmRpY2F0ZSBTVyB1c2luZyBpdCovCisJUkVHX1VQREFURShEQ19JMkNfQVJCSVRSQVRJT04s
IERDX0kyQ19TV19VU0VfSTJDX1JFR19SRVEsIDEpOwogCiAJaWYgKGRjZV9pMmNfaHctPnNldHVw
X2xpbWl0ICE9IDApCiAJCWkyY19zZXR1cF9saW1pdCA9IGRjZV9pMmNfaHctPnNldHVwX2xpbWl0
OwpAQCAtMzIyLDggKzMyNCw2IEBAIHN0YXRpYyB2b2lkIHJlbGVhc2VfZW5naW5lKAogCiAJc2V0
X3NwZWVkKGRjZV9pMmNfaHcsIGRjZV9pMmNfaHctPm9yaWdpbmFsX3NwZWVkKTsKIAotCS8qIFJl
bGVhc2UgSTJDICovCi0JUkVHX1VQREFURShEQ19JMkNfQVJCSVRSQVRJT04sIERDX0kyQ19TV19E
T05FX1VTSU5HX0kyQ19SRUcsIDEpOwogCiAJLyogUmVzZXQgSFcgZW5naW5lICovCiAJewpAQCAt
MzQzLDYgKzM0Myw5IEBAIHN0YXRpYyB2b2lkIHJlbGVhc2VfZW5naW5lKAogCS8qIEhXIEkyYyBl
bmdpbmUgLSBjbG9jayBnYXRpbmcgZmVhdHVyZSAqLwogCWlmICghZGNlX2kyY19ody0+ZW5naW5l
X2tlZXBfcG93ZXJfdXBfY291bnQpCiAJCVJFR19VUERBVEVfTihTRVRVUCwgMSwgRk4oU0VUVVAs
IERDX0kyQ19EREMxX0VOQUJMRSksIDApOworCS8qIFJlbGVhc2UgSTJDIGFmdGVyIHJlc2V0LCBz
byBIVyBvciBETUNVIGNvdWxkIHVzZSBpdCAqLworCVJFR19VUERBVEVfMihEQ19JMkNfQVJCSVRS
QVRJT04sIERDX0kyQ19TV19ET05FX1VTSU5HX0kyQ19SRUcsIDEsCisJCURDX0kyQ19TV19VU0Vf
STJDX1JFR19SRVEsIDApOwogCiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfaTJjX2h3LmgKaW5kZXggNTc1NTAwNzU1YjJlLi5mNzE4ZTNkMzk2ZjIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5oCkBA
IC0xMDUsNiArMTA1LDcgQEAgZW51bSB7CiAJSTJDX1NGKERDX0kyQ19EREMxX1NFVFVQLCBEQ19J
MkNfRERDMV9EQVRBX0RSSVZFX1NFTCwgbWFza19zaCksXAogCUkyQ19TRihEQ19JMkNfRERDMV9T
RVRVUCwgRENfSTJDX0REQzFfSU5UUkFfVFJBTlNBQ1RJT05fREVMQVksIG1hc2tfc2gpLFwKIAlJ
MkNfU0YoRENfSTJDX0REQzFfU0VUVVAsIERDX0kyQ19EREMxX0lOVFJBX0JZVEVfREVMQVksIG1h
c2tfc2gpLFwKKwlJMkNfU0YoRENfSTJDX0FSQklUUkFUSU9OLCBEQ19JMkNfU1dfVVNFX0kyQ19S
RUdfUkVRLCBtYXNrX3NoKSxcCiAJSTJDX1NGKERDX0kyQ19BUkJJVFJBVElPTiwgRENfSTJDX1NX
X0RPTkVfVVNJTkdfSTJDX1JFRywgbWFza19zaCksXAogCUkyQ19TRihEQ19JMkNfQVJCSVRSQVRJ
T04sIERDX0kyQ19OT19RVUVVRURfU1dfR08sIG1hc2tfc2gpLFwKIAlJMkNfU0YoRENfSTJDX0FS
QklUUkFUSU9OLCBEQ19JMkNfU1dfUFJJT1JJVFksIG1hc2tfc2gpLFwKQEAgLTE0Niw2ICsxNDcs
NyBAQCBzdHJ1Y3QgZGNlX2kyY19zaGlmdCB7CiAJdWludDhfdCBEQ19JMkNfRERDMV9JTlRSQV9U
UkFOU0FDVElPTl9ERUxBWTsKIAl1aW50OF90IERDX0kyQ19EREMxX0lOVFJBX0JZVEVfREVMQVk7
CiAJdWludDhfdCBEQ19JMkNfU1dfRE9ORV9VU0lOR19JMkNfUkVHOworCXVpbnQ4X3QgRENfSTJD
X1NXX1VTRV9JMkNfUkVHX1JFUTsKIAl1aW50OF90IERDX0kyQ19OT19RVUVVRURfU1dfR087CiAJ
dWludDhfdCBEQ19JMkNfU1dfUFJJT1JJVFk7CiAJdWludDhfdCBEQ19JMkNfU09GVF9SRVNFVDsK
QEAgLTE4NCw2ICsxODYsNyBAQCBzdHJ1Y3QgZGNlX2kyY19tYXNrIHsKIAl1aW50MzJfdCBEQ19J
MkNfRERDMV9JTlRSQV9UUkFOU0FDVElPTl9ERUxBWTsKIAl1aW50MzJfdCBEQ19JMkNfRERDMV9J
TlRSQV9CWVRFX0RFTEFZOwogCXVpbnQzMl90IERDX0kyQ19TV19ET05FX1VTSU5HX0kyQ19SRUc7
CisJdWludDMyX3QgRENfSTJDX1NXX1VTRV9JMkNfUkVHX1JFUTsKIAl1aW50MzJfdCBEQ19JMkNf
Tk9fUVVFVUVEX1NXX0dPOwogCXVpbnQzMl90IERDX0kyQ19TV19QUklPUklUWTsKIAl1aW50MzJf
dCBEQ19JMkNfU09GVF9SRVNFVDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
