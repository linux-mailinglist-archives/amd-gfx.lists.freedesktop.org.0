Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396711A22F
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DBF89F6D;
	Fri, 10 May 2019 17:20:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800084.outbound.protection.outlook.com [40.107.80.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E84B89F3C
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:18 +0000 (UTC)
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 MWHPR1201MB0061.namprd12.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Fri, 10 May
 2019 17:20:16 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:15 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:10 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/16] drm/amd/display: Hook up CRC capture support for dce120
Date: Fri, 10 May 2019 13:19:21 -0400
Message-ID: <20190510171935.19792-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(16586007)(1076003)(316002)(53416004)(86362001)(446003)(11346002)(476003)(2616005)(5660300002)(70586007)(2351001)(70206006)(48376002)(50466002)(36756003)(50226002)(14444005)(6916009)(68736007)(72206003)(478600001)(53936002)(51416003)(8676002)(7696005)(2906002)(8936002)(81156014)(81166006)(76176011)(186003)(6666004)(356004)(77096007)(26005)(126002)(336012)(426003)(486006)(305945005)(47776003)(4326008)(52103002)(158003001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0061; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ba9607-4def-4ced-01dd-08d6d56bc4a4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR1201MB0061; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0061:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0061F7731C2C2F906F3842F8F90C0@MWHPR1201MB0061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FtGyP/MsxBhE0N+C4By7l4m5r7LwAq+ps3+QEPSitnaiSeDkcbmFXnKVWFq8utCTk7wPlGx9mfjPc8aPuEtgS3OFa0gsZ0t8r4p8IMYr59dOFFFpkTTt+bBhd80s4jyLIRPGxCXV79o26sNzWOQEvZxBaLTXj0v0+7fihPuUI4yoYZ+TTPsY41FV3maQCzamCkBqW0nApXH79LnXMTzG/ivXQA3ClLLWdbaBEYwqFdllLdILuNODfsLVVCX3+n77FbFE5aWhtxv2QAElRd2qiXZIyycsjp9HIK7F+n2pMs8QzgjLIx02AGtXdCOf0fzhTuYy/e0xWpsdhmsE4uBYgU7dFcdHdYurALqiXvd2sVDOM2RdzmCwpKdoXWmgTlQAs+xE50eVEwef8qgoo9MZjARTcCGhNzScXDOKfTf3zQs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:15.4041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ba9607-4def-4ced-01dd-08d6d56bc4a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0061
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaaiwAYgBwHHljMm+hCmv6oEGKkF8QRV1WT9NtvL7rY=;
 b=trd5tleRnfWYquRSqLmTQjeiMp+SRW0JfcojzufkmHQC8pYsdU7mhu26WKHaUwSwmQnpC1TID5zK9/SLfqZoSVyq6ni/Nw1sFC2EW+vSmSh0q6ljPuxjK8TwGuod/y4uMWOYjjo69BKHpnPzSvr7EAQWCjc7jq4mDrj29yIMrP4=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KTWFueSBJR1QgdGVzdHMgcmVxdWlyZSBDUkMgY2FwdHVyZSBpbiBvcmRlciB0byBjb25m
aXJtIHRoYXQgdGhlIG91dHB1dAppcyB2aXN1YWxseSBjb3JyZWN0LgoKVGhlc2Ugc2tpcCBvbiBk
Y2UxMjAgYmVjYXVzZSBjb25maWd1cmVfY3JjIGFuZCBnZXRfY3JjIGFyZW4ndCBzZXQuCgpbSG93
XQpIb29rIHVwIGlzX3RnX2VuYWJsZWQsIGNvbmZpZ3VyZV9jcmMgYW5kIGdldF9jcmMgZnVuY3Rp
b25zIG9uIGRjZTEyMCdzCnRpbWluZyBnZW5lcmF0b3IuCgpUaGUgbG9naWMgc2hvdWxkIGJlIHRo
ZSBzYW1lIGFzIERDRSBhbmQgRENOIHdpdGggc29tZSBtaW5vciByZWdpc3RlcgpuYW1pbmcgZGlm
ZmVyZW5jZXMuCgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFu
Y2lzQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFr
aGFAYW1kLmNvbT4KLS0tCiAuLi4vZGMvZGNlMTIwL2RjZTEyMF90aW1pbmdfZ2VuZXJhdG9yLmMg
ICAgICAgfCA4OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Ux
MjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IuYwppbmRleCA1ZWJiYmRhNzcwMjEu
LjA5OGU1Njk2MmYyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZTEyMC9kY2UxMjBfdGltaW5nX2dlbmVyYXRvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IuYwpAQCAtMTExNCw2
ICsxMTE0LDkyIEBAIHN0YXRpYyBib29sIGRjZTEyMF9hcm1fdmVydF9pbnRyKAogCXJldHVybiB0
cnVlOwogfQogCisKK3N0YXRpYyBib29sIGRjZTEyMF9pc190Z19lbmFibGVkKHN0cnVjdCB0aW1p
bmdfZ2VuZXJhdG9yICp0ZykKK3sKKwlzdHJ1Y3QgZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IgKnRn
MTEwID0gRENFMTEwVEdfRlJPTV9URyh0Zyk7CisJdWludDMyX3QgdmFsdWUsIGZpZWxkOworCisJ
dmFsdWUgPSBkbV9yZWFkX3JlZ19zb2MxNSh0Zy0+Y3R4LCBtbUNSVEMwX0NSVENfQ09OVFJPTCwK
KwkJCQkgIHRnMTEwLT5vZmZzZXRzLmNydGMpOworCWZpZWxkID0gZ2V0X3JlZ19maWVsZF92YWx1
ZSh2YWx1ZSwgQ1JUQzBfQ1JUQ19DT05UUk9MLAorCQkJCSAgICBDUlRDX0NVUlJFTlRfTUFTVEVS
X0VOX1NUQVRFKTsKKworCXJldHVybiBmaWVsZCA9PSAxOworfQorCitzdGF0aWMgYm9vbCBkY2Ux
MjBfY29uZmlndXJlX2NyYyhzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcsCisJCQkJIGNvbnN0
IHN0cnVjdCBjcmNfcGFyYW1zICpwYXJhbXMpCit7CisJc3RydWN0IGRjZTExMF90aW1pbmdfZ2Vu
ZXJhdG9yICp0ZzExMCA9IERDRTExMFRHX0ZST01fVEcodGcpOworCisJLyogQ2Fubm90IGNvbmZp
Z3VyZSBjcmMgb24gYSBDUlRDIHRoYXQgaXMgZGlzYWJsZWQgKi8KKwlpZiAoIWRjZTEyMF9pc190
Z19lbmFibGVkKHRnKSkKKwkJcmV0dXJuIGZhbHNlOworCisJLyogRmlyc3QsIGRpc2FibGUgQ1JD
IGJlZm9yZSB3ZSBjb25maWd1cmUgaXQuICovCisJZG1fd3JpdGVfcmVnX3NvYzE1KHRnLT5jdHgs
IG1tQ1JUQzBfQ1JUQ19DUkNfQ05UTCwKKwkJCSAgIHRnMTEwLT5vZmZzZXRzLmNydGMsIDApOwor
CisJaWYgKCFwYXJhbXMtPmVuYWJsZSkKKwkJcmV0dXJuIHRydWU7CisKKwkvKiBQcm9ncmFtIGZy
YW1lIGJvdW5kYXJpZXMgKi8KKwkvKiBXaW5kb3cgQSB4IGF4aXMgc3RhcnQgYW5kIGVuZC4gKi8K
KwlDUlRDX1JFR19VUERBVEVfMihDUlRDMF9DUlRDX0NSQzBfV0lORE9XQV9YX0NPTlRST0wsCisJ
CQkgIENSVENfQ1JDMF9XSU5ET1dBX1hfU1RBUlQsIHBhcmFtcy0+d2luZG93YV94X3N0YXJ0LAor
CQkJICBDUlRDX0NSQzBfV0lORE9XQV9YX0VORCwgcGFyYW1zLT53aW5kb3dhX3hfZW5kKTsKKwor
CS8qIFdpbmRvdyBBIHkgYXhpcyBzdGFydCBhbmQgZW5kLiAqLworCUNSVENfUkVHX1VQREFURV8y
KENSVEMwX0NSVENfQ1JDMF9XSU5ET1dBX1lfQ09OVFJPTCwKKwkJCSAgQ1JUQ19DUkMwX1dJTkRP
V0FfWV9TVEFSVCwgcGFyYW1zLT53aW5kb3dhX3lfc3RhcnQsCisJCQkgIENSVENfQ1JDMF9XSU5E
T1dBX1lfRU5ELCBwYXJhbXMtPndpbmRvd2FfeV9lbmQpOworCisJLyogV2luZG93IEIgeCBheGlz
IHN0YXJ0IGFuZCBlbmQuICovCisJQ1JUQ19SRUdfVVBEQVRFXzIoQ1JUQzBfQ1JUQ19DUkMwX1dJ
TkRPV0JfWF9DT05UUk9MLAorCQkJICBDUlRDX0NSQzBfV0lORE9XQl9YX1NUQVJULCBwYXJhbXMt
PndpbmRvd2JfeF9zdGFydCwKKwkJCSAgQ1JUQ19DUkMwX1dJTkRPV0JfWF9FTkQsIHBhcmFtcy0+
d2luZG93Yl94X2VuZCk7CisKKwkvKiBXaW5kb3cgQiB5IGF4aXMgc3RhcnQgYW5kIGVuZC4gKi8K
KwlDUlRDX1JFR19VUERBVEVfMihDUlRDMF9DUlRDX0NSQzBfV0lORE9XQl9ZX0NPTlRST0wsCisJ
CQkgIENSVENfQ1JDMF9XSU5ET1dCX1lfU1RBUlQsIHBhcmFtcy0+d2luZG93Yl95X3N0YXJ0LAor
CQkJICBDUlRDX0NSQzBfV0lORE9XQl9ZX0VORCwgcGFyYW1zLT53aW5kb3diX3lfZW5kKTsKKwor
CS8qIFNldCBjcmMgbW9kZSBhbmQgc2VsZWN0aW9uLCBhbmQgZW5hYmxlLiBPbmx5IHVzaW5nIENS
QzAqLworCUNSVENfUkVHX1VQREFURV8zKENSVEMwX0NSVENfQ1JDX0NOVEwsCisJCQkgIENSVENf
Q1JDX0VOLCBwYXJhbXMtPmNvbnRpbnVvdXNfbW9kZSA/IDEgOiAwLAorCQkJICBDUlRDX0NSQzBf
U0VMRUNULCBwYXJhbXMtPnNlbGVjdGlvbiwKKwkJCSAgQ1JUQ19DUkNfRU4sIDEpOworCisJcmV0
dXJuIHRydWU7Cit9CisKK3N0YXRpYyBib29sIGRjZTEyMF9nZXRfY3JjKHN0cnVjdCB0aW1pbmdf
Z2VuZXJhdG9yICp0ZywgdWludDMyX3QgKnJfY3IsCisJCQkgICB1aW50MzJfdCAqZ195LCB1aW50
MzJfdCAqYl9jYikKK3sKKwlzdHJ1Y3QgZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IgKnRnMTEwID0g
RENFMTEwVEdfRlJPTV9URyh0Zyk7CisJdWludDMyX3QgdmFsdWUsIGZpZWxkOworCisJdmFsdWUg
PSBkbV9yZWFkX3JlZ19zb2MxNSh0Zy0+Y3R4LCBtbUNSVEMwX0NSVENfQ1JDX0NOVEwsCisJCQkJ
ICB0ZzExMC0+b2Zmc2V0cy5jcnRjKTsKKwlmaWVsZCA9IGdldF9yZWdfZmllbGRfdmFsdWUodmFs
dWUsIENSVEMwX0NSVENfQ1JDX0NOVEwsIENSVENfQ1JDX0VOKTsKKworCS8qIEVhcmx5IHJldHVy
biBpZiBDUkMgaXMgbm90IGVuYWJsZWQgZm9yIHRoaXMgQ1JUQyAqLworCWlmICghZmllbGQpCisJ
CXJldHVybiBmYWxzZTsKKworCXZhbHVlID0gZG1fcmVhZF9yZWdfc29jMTUodGctPmN0eCwgbW1D
UlRDMF9DUlRDX0NSQzBfREFUQV9SRywKKwkJCQkgIHRnMTEwLT5vZmZzZXRzLmNydGMpOworCSpy
X2NyID0gZ2V0X3JlZ19maWVsZF92YWx1ZSh2YWx1ZSwgQ1JUQzBfQ1JUQ19DUkMwX0RBVEFfUkcs
IENSQzBfUl9DUik7CisJKmdfeSA9IGdldF9yZWdfZmllbGRfdmFsdWUodmFsdWUsIENSVEMwX0NS
VENfQ1JDMF9EQVRBX1JHLCBDUkMwX0dfWSk7CisKKwl2YWx1ZSA9IGRtX3JlYWRfcmVnX3NvYzE1
KHRnLT5jdHgsIG1tQ1JUQzBfQ1JUQ19DUkMwX0RBVEFfQiwKKwkJCQkgIHRnMTEwLT5vZmZzZXRz
LmNydGMpOworCSpiX2NiID0gZ2V0X3JlZ19maWVsZF92YWx1ZSh2YWx1ZSwgQ1JUQzBfQ1JUQ19D
UkMwX0RBVEFfQiwgQ1JDMF9CX0NCKTsKKworCXJldHVybiB0cnVlOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHRpbWluZ19nZW5lcmF0b3JfZnVuY3MgZGNlMTIwX3RnX2Z1bmNzID0gewogCQku
dmFsaWRhdGVfdGltaW5nID0gZGNlMTIwX3RnX3ZhbGlkYXRlX3RpbWluZywKIAkJLnByb2dyYW1f
dGltaW5nID0gZGNlMTIwX3RnX3Byb2dyYW1fdGltaW5nLApAQCAtMTE0NSw2ICsxMjMxLDkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yX2Z1bmNzIGRjZTEyMF90Z19mdW5j
cyA9IHsKIAkJLnNldF9zdGF0aWNfc2NyZWVuX2NvbnRyb2wgPSBkY2UxMjBfdGltaW5nX2dlbmVy
YXRvcl9zZXRfc3RhdGljX3NjcmVlbl9jb250cm9sLAogCQkuc2V0X3Rlc3RfcGF0dGVybiA9IGRj
ZTEyMF90aW1pbmdfZ2VuZXJhdG9yX3NldF90ZXN0X3BhdHRlcm4sCiAJCS5hcm1fdmVydF9pbnRy
ID0gZGNlMTIwX2FybV92ZXJ0X2ludHIsCisJCS5pc190Z19lbmFibGVkID0gZGNlMTIwX2lzX3Rn
X2VuYWJsZWQsCisJCS5jb25maWd1cmVfY3JjID0gZGNlMTIwX2NvbmZpZ3VyZV9jcmMsCisJCS5n
ZXRfY3JjID0gZGNlMTIwX2dldF9jcmMsCiB9OwogCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
