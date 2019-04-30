Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D110195
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6800089309;
	Tue, 30 Apr 2019 21:10:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AD889264
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:15 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 BLUPR12MB0644.namprd12.prod.outlook.com (2a01:111:e400:594e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12; Tue, 30 Apr
 2019 21:10:13 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:12 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:56 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/20] drm/amd/display: move back vbios cmd table for set
 dprefclk
Date: Tue, 30 Apr 2019 17:09:33 -0400
Message-ID: <20190430210938.32335-36-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(426003)(72206003)(26005)(50226002)(50466002)(8936002)(316002)(16586007)(48376002)(81156014)(305945005)(8676002)(6916009)(53936002)(4326008)(36756003)(81166006)(478600001)(53416004)(47776003)(186003)(51416003)(7696005)(5660300002)(2351001)(2616005)(11346002)(76176011)(1076003)(486006)(476003)(68736007)(86362001)(126002)(70586007)(77096007)(336012)(446003)(70206006)(356004)(6666004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR12MB0644; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e02090fb-7baa-49a6-8175-08d6cdb03c3e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BLUPR12MB0644; 
X-MS-TrafficTypeDiagnostic: BLUPR12MB0644:
X-Microsoft-Antispam-PRVS: <BLUPR12MB06446181F4DAD535A0BBB799F93A0@BLUPR12MB0644.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: s4izBHQuUSjVVjuBMLm7XGO/93YWDGHpK6xiWIFczR7jhG2eyycBvy0M1vODS7hOND/sJu7qVu+txuJ0oNJkQWaWQ1cpfT7u4NhzefnSSkFW+gbGDByR3Xp0bcA0lIv5BL8qoq208QCuYuDQD8VJL8b0ecJ9leyjFpnkXIVkznXbd1v8fDWgECq5LZRgekihEHXK8v3nbiz1kcrDkVKKZsrzXx0+BP9RWmC+BgkuvwK0qIhdgEg4Q/AtvRXXLjDFCR+pwi3mnNFkgnCrPgqGzFE77EJB4SN3U7FCW+BG93PgGlNLPhTKWwBqm5BPGAjKh9ygX6tbD9xwygjLMPgfn5v9kh3CoUwX4+7YVY9YfZeeSv6YgcEnw1yVeYW5sKulscwBrue5U+vNZvek6uMDeLCRwQKq5/BUq4IAxBUZrK0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:12.5989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e02090fb-7baa-49a6-8175-08d6cdb03c3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR12MB0644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwhiVrGZ7Aj6alOvXON9/D36DOhFyz1fMMkAKfTWn4A=;
 b=T2xEu9C1Y5K7R1iBNtJHYIN7ebIfi0N3qKGF8gW0jpHB2zKX6E0YNiYWCq1LaldSNNkJ1jS3xNl9+8QYsrAla/7fle5Rke6HKv5UvUo+BM4uURFQQChgdwQgoLyGAKJ2LHDYku+XqyPnFIvpYfUq1A4zGs+WQFQTvXEfkGanNPU=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpVcG9uIGNsb3NlciBp
bnNwZWN0aW9uLCBvdXIgcHJldmlvdXMgaW1wbGVtZW50YXRpb24gaXMgbWlzc2luZwpjb2RlIGZv
ciBwcm9ncmFtbWluZyBkZS1zcHJlYWQgYW5kIERQIERUTy4gUG9ydGluZyB0aGlzIGxvZ2ljCmlu
dG8gZHJpdmVyIGlzIHJhdGhlciBpbnZvbHZlZCwgYXMgdGhlcmUgYXJlIGEgbG90IG9mIHRhYmxl
Cmxvb2sgdXBzLiBTbyBmb3Igbm93IG1vdmUgYmFjayB0byBjYWxsaW5nIHZiaW9zIGNtZCB0YWJs
ZQoKW0hvd10KR28gYmFjayB0byBjYWxsaW5nIHZiaW9zIGNtZCB0YWJsZSBmb3Igc2V0IGRwX3Jl
ZmNsawoKQ2hhbmdlLUlkOiBJZTQ3ODAwY2NlNDBjMTgwNjczMTQwOTc2Zjg2Mjg0N2IwMzI5ZDll
MwpTaWduZWQtb2ZmLWJ5OiBFcmljIFlhbmcgPEVyaWMuWWFuZzJAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0
IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5jICB8IDcwICsrKysrKysrKysrKysrKysrKysKIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5oICB8ICAyICsKIDIgZmls
ZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2Nsa19tZ3IuYwppbmRleCAzNjVjMTA4NDg3OTcuLjZiMmUyMDc3
NzdmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
Y2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Ns
a19tZ3IuYwpAQCAtMjQxLDYgKzI0MSw3IEBAIHN0YXRpYyBlbnVtIGRtX3BwX2Nsb2Nrc19zdGF0
ZSBkY2VfZ2V0X3JlcXVpcmVkX2Nsb2Nrc19zdGF0ZSgKIAlyZXR1cm4gbG93X3JlcV9jbGs7CiB9
CiAKKy8qIFRPRE86IHJlbW92ZSB1c2UgdGhlIHR3byBicm9rZW4gZG93biBmdW5jdGlvbnMgKi8K
IHN0YXRpYyBpbnQgZGNlX3NldF9jbG9jaygKIAlzdHJ1Y3QgY2xrX21nciAqY2xrX21nciwKIAlp
bnQgcmVxdWVzdGVkX2Nsa19raHopCkBAIC0zMzYsNiArMzM3LDc1IEBAIGludCBkY2UxMTJfc2V0
X2Nsb2NrKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyLCBpbnQgcmVxdWVzdGVkX2Nsa19raHopCiAJ
cmV0dXJuIGFjdHVhbF9jbG9jazsKIH0KIAoraW50IGRjZTExMl9zZXRfZGlzcGNsayhzdHJ1Y3Qg
Y2xrX21nciAqY2xrX21nciwgaW50IHJlcXVlc3RlZF9jbGtfa2h6KQoreworCXN0cnVjdCBkY2Vf
Y2xrX21nciAqY2xrX21ncl9kY2UgPSBUT19EQ0VfQ0xLX01HUihjbGtfbWdyKTsKKwlzdHJ1Y3Qg
YnBfc2V0X2RjZV9jbG9ja19wYXJhbWV0ZXJzIGRjZV9jbGtfcGFyYW1zOworCXN0cnVjdCBkY19i
aW9zICpicCA9IGNsa19tZ3ItPmN0eC0+ZGNfYmlvczsKKwlzdHJ1Y3QgZGMgKmNvcmVfZGMgPSBj
bGtfbWdyLT5jdHgtPmRjOworCXN0cnVjdCBkbWN1ICpkbWN1ID0gY29yZV9kYy0+cmVzX3Bvb2wt
PmRtY3U7CisJaW50IGFjdHVhbF9jbG9jayA9IHJlcXVlc3RlZF9jbGtfa2h6OworCS8qIFByZXBh
cmUgdG8gcHJvZ3JhbSBkaXNwbGF5IGNsb2NrKi8KKwltZW1zZXQoJmRjZV9jbGtfcGFyYW1zLCAw
LCBzaXplb2YoZGNlX2Nsa19wYXJhbXMpKTsKKworCS8qIE1ha2Ugc3VyZSByZXF1ZXN0ZWQgY2xv
Y2sgaXNuJ3QgbG93ZXIgdGhhbiBtaW5pbXVtIHRocmVzaG9sZCovCisJaWYgKHJlcXVlc3RlZF9j
bGtfa2h6ID4gMCkKKwkJcmVxdWVzdGVkX2Nsa19raHogPSBtYXgocmVxdWVzdGVkX2Nsa19raHos
CisJCQkJY2xrX21ncl9kY2UtPmRlbnRpc3RfdmNvX2ZyZXFfa2h6IC8gNjIpOworCisJZGNlX2Ns
a19wYXJhbXMudGFyZ2V0X2Nsb2NrX2ZyZXF1ZW5jeSA9IHJlcXVlc3RlZF9jbGtfa2h6OworCWRj
ZV9jbGtfcGFyYW1zLnBsbF9pZCA9IENMT0NLX1NPVVJDRV9JRF9ERlM7CisJZGNlX2Nsa19wYXJh
bXMuY2xvY2tfdHlwZSA9IERDRUNMT0NLX1RZUEVfRElTUExBWV9DTE9DSzsKKworCWJwLT5mdW5j
cy0+c2V0X2RjZV9jbG9jayhicCwgJmRjZV9jbGtfcGFyYW1zKTsKKwlhY3R1YWxfY2xvY2sgPSBk
Y2VfY2xrX3BhcmFtcy50YXJnZXRfY2xvY2tfZnJlcXVlbmN5OworCisJLyoKKwkgKiBmcm9tIHBv
d2VyIGRvd24sIHdlIG5lZWQgbWFyayB0aGUgY2xvY2sgc3RhdGUgYXMgQ2xvY2tzU3RhdGVOb21p
bmFsCisJICogZnJvbSBIV1Jlc2V0LCBzbyB3aGVuIHJlc3VtZSB3ZSB3aWxsIGNhbGwgcHBsaWIg
dm9sdGFnZSByZWd1bGF0b3IuCisJICovCisJaWYgKHJlcXVlc3RlZF9jbGtfa2h6ID09IDApCisJ
CWNsa19tZ3JfZGNlLT5jdXJfbWluX2Nsa3Nfc3RhdGUgPSBETV9QUF9DTE9DS1NfU1RBVEVfTk9N
SU5BTDsKKworCisJaWYgKCFJU19GUEdBX01BWElNVVNfREMoY29yZV9kYy0+Y3R4LT5kY2VfZW52
aXJvbm1lbnQpKSB7CisJCWlmIChkbWN1ICYmIGRtY3UtPmZ1bmNzLT5pc19kbWN1X2luaXRpYWxp
emVkKGRtY3UpKSB7CisJCQlpZiAoY2xrX21ncl9kY2UtPmRmc19ieXBhc3NfZGlzcF9jbGsgIT0g
YWN0dWFsX2Nsb2NrKQorCQkJCWRtY3UtPmZ1bmNzLT5zZXRfcHNyX3dhaXRfbG9vcChkbWN1LAor
CQkJCQkJYWN0dWFsX2Nsb2NrIC8gMTAwMCAvIDcpOworCQl9CisJfQorCisJY2xrX21ncl9kY2Ut
PmRmc19ieXBhc3NfZGlzcF9jbGsgPSBhY3R1YWxfY2xvY2s7CisJcmV0dXJuIGFjdHVhbF9jbG9j
azsKKworfQorCitpbnQgZGNlMTEyX3NldF9kcHJlZmNsayhzdHJ1Y3QgY2xrX21nciAqY2xrX21n
cikKK3sKKwlzdHJ1Y3QgYnBfc2V0X2RjZV9jbG9ja19wYXJhbWV0ZXJzIGRjZV9jbGtfcGFyYW1z
OworCXN0cnVjdCBkY19iaW9zICpicCA9IGNsa19tZ3ItPmN0eC0+ZGNfYmlvczsKKworCW1lbXNl
dCgmZGNlX2Nsa19wYXJhbXMsIDAsIHNpemVvZihkY2VfY2xrX3BhcmFtcykpOworCisJLypQcm9n
cmFtIERQIHJlZiBDbG9jayovCisJLypWQklPUyB3aWxsIGRldGVybWluZSBEUFJFRkNMSyBmcmVx
dWVuY3ksIHNvIHdlIGRvbid0IHNldCBpdCovCisJZGNlX2Nsa19wYXJhbXMudGFyZ2V0X2Nsb2Nr
X2ZyZXF1ZW5jeSA9IDA7CisJZGNlX2Nsa19wYXJhbXMucGxsX2lkID0gQ0xPQ0tfU09VUkNFX0lE
X0RGUzsKKwlkY2VfY2xrX3BhcmFtcy5jbG9ja190eXBlID0gRENFQ0xPQ0tfVFlQRV9EUFJFRkNM
SzsKKwlpZiAoIUFTSUNSRVZfSVNfVkVHQTIwX1AoY2xrX21nci0+Y3R4LT5hc2ljX2lkLmh3X2lu
dGVybmFsX3JldikpCisJCWRjZV9jbGtfcGFyYW1zLmZsYWdzLlVTRV9HRU5MT0NLX0FTX1NPVVJD
RV9GT1JfRFBSRUZDTEsgPQorCQkJKGRjZV9jbGtfcGFyYW1zLnBsbF9pZCA9PQorCQkJCQlDTE9D
S19TT1VSQ0VfQ09NQk9fRElTUExBWV9QTEwwKTsKKwllbHNlCisJCWRjZV9jbGtfcGFyYW1zLmZs
YWdzLlVTRV9HRU5MT0NLX0FTX1NPVVJDRV9GT1JfRFBSRUZDTEsgPSBmYWxzZTsKKworCWJwLT5m
dW5jcy0+c2V0X2RjZV9jbG9jayhicCwgJmRjZV9jbGtfcGFyYW1zKTsKKworCS8qIFJldHVybnMg
dGhlIGRwX3JlZmNsayB0aGF0IHdhcyBzZXQgKi8KKwlyZXR1cm4gZGNlX2Nsa19wYXJhbXMudGFy
Z2V0X2Nsb2NrX2ZyZXF1ZW5jeTsKK30KKwogc3RhdGljIHZvaWQgZGNlX2Nsb2NrX3JlYWRfaW50
ZWdyYXRlZF9pbmZvKHN0cnVjdCBkY2VfY2xrX21nciAqY2xrX21ncl9kY2UpCiB7CiAJc3RydWN0
IGRjX2RlYnVnX29wdGlvbnMgKmRlYnVnID0gJmNsa19tZ3JfZGNlLT5iYXNlLmN0eC0+ZGMtPmRl
YnVnOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
Y2xrX21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21n
ci5oCmluZGV4IDM2OTQyYWIwMjJhMi4uY2NhMGM5NWQ4Y2M4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbGtfbWdyLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5oCkBAIC0xODksNiArMTg5LDgg
QEAgdm9pZCBkY2UxMTBfZmlsbF9kaXNwbGF5X2NvbmZpZ3MoCiAJc3RydWN0IGRtX3BwX2Rpc3Bs
YXlfY29uZmlndXJhdGlvbiAqcHBfZGlzcGxheV9jZmcpOwogCiBpbnQgZGNlMTEyX3NldF9jbG9j
ayhzdHJ1Y3QgY2xrX21nciAqZGNjZywgaW50IHJlcXVlc3RlZF9jbGtfa2h6KTsKK2ludCBkY2Ux
MTJfc2V0X2Rpc3BjbGsoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3IsIGludCByZXF1ZXN0ZWRfY2xr
X2toeik7CitpbnQgZGNlMTEyX3NldF9kcHJlZmNsayhzdHJ1Y3QgY2xrX21nciAqY2xrX21ncik7
CiAKIHN0cnVjdCBjbGtfbWdyICpkY2VfY2xrX21ncl9jcmVhdGUoCiAJc3RydWN0IGRjX2NvbnRl
eHQgKmN0eCwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
