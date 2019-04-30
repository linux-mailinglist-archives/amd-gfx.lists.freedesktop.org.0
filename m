Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB610181
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3679F89258;
	Tue, 30 Apr 2019 21:10:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810045.outbound.protection.outlook.com [40.107.81.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E4A89240
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:59 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by BLUPR12MB0642.namprd12.prod.outlook.com (2a01:111:e400:594e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12; Tue, 30 Apr
 2019 21:09:57 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/20] drm/amd/display: block passive dongle EDID Emulation
 for USB-C ports
Date: Tue, 30 Apr 2019 17:09:12 -0400
Message-ID: <20190430210938.32335-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(51416003)(26005)(316002)(77096007)(4326008)(50466002)(7696005)(48376002)(86362001)(5660300002)(126002)(14444005)(476003)(446003)(11346002)(36756003)(486006)(426003)(336012)(53936002)(478600001)(16586007)(305945005)(50226002)(186003)(72206003)(47776003)(2616005)(8676002)(81156014)(70586007)(76176011)(2351001)(356004)(2906002)(1076003)(53416004)(70206006)(6666004)(68736007)(81166006)(6916009)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR12MB0642; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dea928ed-b80b-47a2-01a6-08d6cdb032d2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BLUPR12MB0642; 
X-MS-TrafficTypeDiagnostic: BLUPR12MB0642:
X-Microsoft-Antispam-PRVS: <BLUPR12MB06428EAD55936A8CC24A596DF93A0@BLUPR12MB0642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zDAlFwEXp/HSFuZZJ5A9Cu0mxTuel2vu/ezKlNnxR0k+pAC8VkwNZJnyniClRmJxk9YMAcdlffI5mBPngrcQPtRMAoDllu+y0xet2mIuX1VBq1VP0Mtt6t/SeC255B/lcJPYY9ZH89zi4WZ4LENLyEEdM85lTPNU6t+o0mp3JYbwHPnGIXes9DCZOGsf0D31GP4C0K0kBOl6iyJK3BAmUF6m501Fok0sFfW6pv18bIwPJaWFEvOD+YPalannYn4B0B7OnVvWltSzZ94vquLNVnIxRxGMSt5YrTEsHNppy7QTh0t+0yXbIByvEv/jSgMixfZSdOf6kJW6WyUnDBuKJ5lyg/O88qkN6jVWgeQit02vUAF+MHSEKmk3CLjd75TekORlvk1dDmc3q79YDSVhoaKyAyqBfRED//NcF1e8ins=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:56.8244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea928ed-b80b-47a2-01a6-08d6cdb032d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR12MB0642
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hzp7DlY09Bb8uxU18DuJVwQfNIp+fzNbfHuqteqogPo=;
 b=luUU3U5xqbdoIe6r8L2IBwLWY2meuVMFaFPR58j+BJOsx/KsJGtfYLjIN0dglvQF5HIBN7ydp8qAGEvZTbuiOy23vnFH4i6xem6EG/b3Kz7F1MWw5YLUShTBXzaRAmV3eV/tnbfvUSpyo3Xq74Xr5YBsJvPuw6yfsPSFSIrZZ34=
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
Cc: Samson Tam <Samson.Tam@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgoKW1doeV0KRW11bGF0aW5nIHBh
c3NpdmUgZG9uZ2xlIG9uIFVTQi1DIHBvcnQgY2F1c2VzIGlzc3VlIG9uIHNvbWUgYXNpY3MuCgpb
SG93XQpDaGVjayBmb3IgRFBfSVNfVVNCX0MgZmxhZyBpbiBiaW9zIHBhcnNlciBhbmQgcHJvcGFn
YXRlIGl0IHRvCmVuY29kZXIgZmVhdHVyZXMgZmxhZ3MuIElmIERQX0lTX1VTQl9DIGZsYWcgaXMg
c2V0IGFuZCBpdCBpcyB0cnlpbmcgdG8KZW11bGF0ZSBwYXNzaXZlIGRvbmdsZSwgdGhlbiByZXR1
cm4gZmFpbC4KCkNoYW5nZS1JZDogSTMyZmRlMTE3MDYyMmZiM2FjZDhiMWZlOGI4NmIzNzU1ZTk4
YjBjNjgKU2lnbmVkLW9mZi1ieTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIyLmMgICAgICAgIHwgMiArKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jIHwg
MiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9saW5rX2VuY29kZXIu
aCAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9iaW9zX3Bh
cnNlcl90eXBlcy5oICAgfCAzICsrLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvYmlvcy9iaW9zX3BhcnNlcjIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9i
aW9zL2Jpb3NfcGFyc2VyMi5jCmluZGV4IGZkNTI2NmE1ODI5Ny4uMTJiYzdlZTY2YjE4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIu
YwpAQCAtMTMxMyw2ICsxMzEzLDggQEAgc3RhdGljIGVudW0gYnBfcmVzdWx0IGJpb3NfcGFyc2Vy
X2dldF9lbmNvZGVyX2NhcF9pbmZvKAogCQkJQVRPTV9FTkNPREVSX0NBUF9SRUNPUkRfSEJSM19F
TikgPyAxIDogMDsKIAlpbmZvLT5IRE1JXzZHQl9FTiA9IChyZWNvcmQtPmVuY29kZXJjYXBzICYK
IAkJCUFUT01fRU5DT0RFUl9DQVBfUkVDT1JEX0hETUk2R2Jwc19FTikgPyAxIDogMDsKKwlpbmZv
LT5EUF9JU19VU0JfQyA9IChyZWNvcmQtPmVuY29kZXJjYXBzICYKKwkJCUFUT01fRU5DT0RFUl9D
QVBfUkVDT1JEX1VTQl9DX1RZUEUpID8gMSA6IDA7CiAKIAlyZXR1cm4gQlBfUkVTVUxUX09LOwog
fQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2xpbmtfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX2xpbmtfZW5jb2Rlci5jCmluZGV4IDAxMjZhNDRiYTAxMi4uZTI1YWU0M2Y4ZDMyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfbGlua19l
bmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2xpbmtfZW5jb2Rlci5jCkBAIC03MjYsNiArNzI2LDggQEAgdm9pZCBkY24xMF9saW5rX2VuY29k
ZXJfY29uc3RydWN0KAogCQllbmMxMC0+YmFzZS5mZWF0dXJlcy5mbGFncy5iaXRzLklTX0hCUjNf
Q0FQQUJMRSA9CiAJCQkJYnBfY2FwX2luZm8uRFBfSEJSM19FTjsKIAkJZW5jMTAtPmJhc2UuZmVh
dHVyZXMuZmxhZ3MuYml0cy5IRE1JXzZHQl9FTiA9IGJwX2NhcF9pbmZvLkhETUlfNkdCX0VOOwor
CQllbmMxMC0+YmFzZS5mZWF0dXJlcy5mbGFncy5iaXRzLkRQX0lTX1VTQl9DID0KKwkJCQlicF9j
YXBfaW5mby5EUF9JU19VU0JfQzsKIAl9IGVsc2UgewogCQlEQ19MT0dfV0FSTklORygiJXM6IEZh
aWxlZCB0byBnZXQgZW5jb2Rlcl9jYXBfaW5mbyBmcm9tIFZCSU9TIHdpdGggZXJyb3IgY29kZSAl
ZCFcbiIsCiAJCQkJX19mdW5jX18sCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvaW5jL2h3L2xpbmtfZW5jb2Rlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2luYy9ody9saW5rX2VuY29kZXIuaAppbmRleCBjOWQzZTM3ZTk1MzEuLmNhMTYyMDc5
YTQxYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9s
aW5rX2VuY29kZXIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3
L2xpbmtfZW5jb2Rlci5oCkBAIC01OSw2ICs1OSw3IEBAIHN0cnVjdCBlbmNvZGVyX2ZlYXR1cmVf
c3VwcG9ydCB7CiAJCQl1aW50MzJfdCBJU19UUFMzX0NBUEFCTEU6MTsKIAkJCXVpbnQzMl90IElT
X1RQUzRfQ0FQQUJMRToxOwogCQkJdWludDMyX3QgSERNSV82R0JfRU46MTsKKwkJCXVpbnQzMl90
IERQX0lTX1VTQl9DOjE7CiAJCX0gYml0czsKIAkJdWludDMyX3QgcmF3OwogCX0gZmxhZ3M7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9iaW9zX3BhcnNl
cl90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvYmlvc19wYXJz
ZXJfdHlwZXMuaAppbmRleCAwMWJmMDFhMzRhMDguLmMzMDQzN2FlODM5NSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvYmlvc19wYXJzZXJfdHlwZXMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9iaW9zX3BhcnNlcl90eXBl
cy5oCkBAIC0zMDcsNyArMzA3LDggQEAgc3RydWN0IGJwX2VuY29kZXJfY2FwX2luZm8gewogCXVp
bnQzMl90IERQX0hCUjJfRU46MTsKIAl1aW50MzJfdCBEUF9IQlIzX0VOOjE7CiAJdWludDMyX3Qg
SERNSV82R0JfRU46MTsKLQl1aW50MzJfdCBSRVNFUlZFRDozMDsKKwl1aW50MzJfdCBEUF9JU19V
U0JfQzoxOworCXVpbnQzMl90IFJFU0VSVkVEOjI3OwogfTsKIAogI2VuZGlmIC8qX19EQUxfQklP
U19QQVJTRVJfVFlQRVNfSF9fICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
