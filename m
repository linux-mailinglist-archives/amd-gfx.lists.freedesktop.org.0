Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12144B59F
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFED89244;
	Sun, 28 Apr 2019 07:44:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810073.outbound.protection.outlook.com [40.107.81.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86347891BF
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:17 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:16 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:16 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/27] drm/amdkfd: Fix a circular lock dependency
Thread-Topic: [PATCH 19/27] drm/amdkfd: Fix a circular lock dependency
Thread-Index: AQHU/ZYu/nLAnPUFnUel8sOjdf1z+Q==
Date: Sun, 28 Apr 2019 07:44:16 +0000
Message-ID: <20190428074331.30107-20-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9b9c9ed-7cec-42ef-1ad0-08d6cbad50d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933007E4829D715A30226EF92380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oZMz0/D27t5SNPF8Fj/SKfwACikotJr0H7ZHP+NDhGTkeGhsZMpwjtOvGSPSyJ40ouUn3Cp8WK2E7VPd+HJrW3K+3MF7Ml5DLOmTWCy6VUwWcpdtZGy+hp2/O8RZDsbl88qYD72JrdykVWPfK9AAv7vjMmF92EKPjIfNibpG+Czuj9+axMeD53CbcM57vt+T6AbqBjVyK6Yf7dndzE5lOAaWJvobtsmYtPGilrSKf3k009g6XHoR7sQgi4fCxkgFVSPfo8Ezua3tU/wOCuj17WUyYgghcxk/cKrLt+S5cW3ZUKikPsKt7XgWChG0/4YU51Yftk+5Hcc9NgMRGZPpotUXlI1aQt5FzgpGNUsH35gkrBcTziWWZdwG+vUex2JIEKG29DmE8mBWiAGEBovWJgupt4Mgc10yCD1IyzbyiJE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b9c9ed-7cec-42ef-1ad0-08d6cbad50d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:16.8335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfMrCDJlmC9E5C9Bp0Jy5bwu20LbSixcjljuBRtpyUQ=;
 b=A+7qJxyObKRpjjM6cfGzYuSe+et5dR4HhjnZze0WIQ3ZnYIRr6VGf9k7Qn4pKe+95O/9RvffjIWpiOOq/9aRmqI75NDDMsF5RgWdoY6nDYQhuRNXrDqc1DBqxhMeqrkwkZmhSYrAZFRPKjmptS0UmE1+oix94S0DtnUE6m2sV8s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IGEgY2lyY3VsYXIgbG9jayBkZXBlbmRlbmN5IGV4cG9zZWQgdW5kZXIgdXNlcnB0ciBtZW1v
cnkgcHJlc3N1cmUuDQpUaGUgRFFNIGxvY2sgaXMgdGhlIG9ubHkgb25lIHRha2VuIGluc2lkZSB0
aGUgTU1VIG5vdGlmaWVyLiBXZSBuZWVkDQp0byBtYWtlIHN1cmUgdGhhdCBubyByZWNsYWltIGlz
IGRvbmUgdW5kZXIgdGhpcyBsb2NrLCBhbmQgdGhhdA0Kbm8gb3RoZXIgbG9ja3MgYXJlIHRha2Vu
IHVuZGVyIHdoaWNoIHJlY2xhaW0gaXMgcG9zc2libGUuDQoNClNpZ25lZC1vZmYtYnk6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IFBoaWxpcCBZ
YW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KLS0tDQogLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgMzMgKysrKysrKysrKysrKysrKy0tLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KaW5k
ZXggMTU2MjU5MGQ4MzdlLi4wYmZkYjE0MWI2ZTcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC03OTQsMTAg
Kzc5NCwxNCBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX3Byb2Nlc3Moc3RydWN0IGRldmljZV9xdWV1
ZV9tYW5hZ2VyICpkcW0sDQogCXJldHZhbCA9IGRxbS0+YXNpY19vcHMudXBkYXRlX3FwZChkcW0s
IHFwZCk7DQogDQogCWRxbS0+cHJvY2Vzc2VzX2NvdW50Kys7DQotCWtmZF9pbmNfY29tcHV0ZV9h
Y3RpdmUoZHFtLT5kZXYpOw0KIA0KIAlkcW1fdW5sb2NrKGRxbSk7DQogDQorCS8qIE91dHNpZGUg
dGhlIERRTSBsb2NrIGJlY2F1c2UgdW5kZXIgdGhlIERRTSBsb2NrIHdlIGNhbid0IGRvDQorCSAq
IHJlY2xhaW0gb3IgdGFrZSBvdGhlciBsb2NrcyB0aGF0IG90aGVycyBob2xkIHdoaWxlIHJlY2xh
aW1pbmcuDQorCSAqLw0KKwlrZmRfaW5jX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2KTsNCisNCiAJ
cmV0dXJuIHJldHZhbDsNCiB9DQogDQpAQCAtODE4LDcgKzgyMiw2IEBAIHN0YXRpYyBpbnQgdW5y
ZWdpc3Rlcl9wcm9jZXNzKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCWxp
c3RfZGVsKCZjdXItPmxpc3QpOw0KIAkJCWtmcmVlKGN1cik7DQogCQkJZHFtLT5wcm9jZXNzZXNf
Y291bnQtLTsNCi0JCQlrZmRfZGVjX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2KTsNCiAJCQlnb3Rv
IG91dDsNCiAJCX0NCiAJfQ0KQEAgLTgyNiw2ICs4MjksMTMgQEAgc3RhdGljIGludCB1bnJlZ2lz
dGVyX3Byb2Nlc3Moc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQogCXJldHZhbCA9
IDE7DQogb3V0Og0KIAlkcW1fdW5sb2NrKGRxbSk7DQorDQorCS8qIE91dHNpZGUgdGhlIERRTSBs
b2NrIGJlY2F1c2UgdW5kZXIgdGhlIERRTSBsb2NrIHdlIGNhbid0IGRvDQorCSAqIHJlY2xhaW0g
b3IgdGFrZSBvdGhlciBsb2NrcyB0aGF0IG90aGVycyBob2xkIHdoaWxlIHJlY2xhaW1pbmcuDQor
CSAqLw0KKwlpZiAoIXJldHZhbCkNCisJCWtmZF9kZWNfY29tcHV0ZV9hY3RpdmUoZHFtLT5kZXYp
Ow0KKw0KIAlyZXR1cm4gcmV0dmFsOw0KIH0NCiANCkBAIC0xNTE5LDYgKzE1MjksNyBAQCBzdGF0
aWMgaW50IHByb2Nlc3NfdGVybWluYXRpb25fbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21h
bmFnZXIgKmRxbSwNCiAJc3RydWN0IHF1ZXVlICpxLCAqbmV4dDsNCiAJc3RydWN0IGRldmljZV9w
cm9jZXNzX25vZGUgKmN1ciwgKm5leHRfZHBuOw0KIAlpbnQgcmV0dmFsID0gMDsNCisJYm9vbCBm
b3VuZCA9IGZhbHNlOw0KIA0KIAlkcW1fbG9jayhkcW0pOw0KIA0KQEAgLTE1MzcsMTIgKzE1NDgs
MTkgQEAgc3RhdGljIGludCBwcm9jZXNzX3Rlcm1pbmF0aW9uX25vY3BzY2goc3RydWN0IGRldmlj
ZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQogCQkJbGlzdF9kZWwoJmN1ci0+bGlzdCk7DQogCQkJa2Zy
ZWUoY3VyKTsNCiAJCQlkcW0tPnByb2Nlc3Nlc19jb3VudC0tOw0KLQkJCWtmZF9kZWNfY29tcHV0
ZV9hY3RpdmUoZHFtLT5kZXYpOw0KKwkJCWZvdW5kID0gdHJ1ZTsNCiAJCQlicmVhazsNCiAJCX0N
CiAJfQ0KIA0KIAlkcW1fdW5sb2NrKGRxbSk7DQorDQorCS8qIE91dHNpZGUgdGhlIERRTSBsb2Nr
IGJlY2F1c2UgdW5kZXIgdGhlIERRTSBsb2NrIHdlIGNhbid0IGRvDQorCSAqIHJlY2xhaW0gb3Ig
dGFrZSBvdGhlciBsb2NrcyB0aGF0IG90aGVycyBob2xkIHdoaWxlIHJlY2xhaW1pbmcuDQorCSAq
Lw0KKwlpZiAoZm91bmQpDQorCQlrZmRfZGVjX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2KTsNCisN
CiAJcmV0dXJuIHJldHZhbDsNCiB9DQogDQpAQCAtMTU4OCw2ICsxNjA2LDcgQEAgc3RhdGljIGlu
dCBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAq
ZHFtLA0KIAlzdHJ1Y3QgZGV2aWNlX3Byb2Nlc3Nfbm9kZSAqY3VyLCAqbmV4dF9kcG47DQogCWVu
dW0ga2ZkX3VubWFwX3F1ZXVlc19maWx0ZXIgZmlsdGVyID0NCiAJCUtGRF9VTk1BUF9RVUVVRVNf
RklMVEVSX0RZTkFNSUNfUVVFVUVTOw0KKwlib29sIGZvdW5kID0gZmFsc2U7DQogDQogCXJldHZh
bCA9IDA7DQogDQpAQCAtMTYyNCw3ICsxNjQzLDcgQEAgc3RhdGljIGludCBwcm9jZXNzX3Rlcm1p
bmF0aW9uX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCWxpc3Rf
ZGVsKCZjdXItPmxpc3QpOw0KIAkJCWtmcmVlKGN1cik7DQogCQkJZHFtLT5wcm9jZXNzZXNfY291
bnQtLTsNCi0JCQlrZmRfZGVjX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2KTsNCisJCQlmb3VuZCA9
IHRydWU7DQogCQkJYnJlYWs7DQogCQl9DQogCX0NCkBAIC0xNjM4LDYgKzE2NTcsMTIgQEAgc3Rh
dGljIGludCBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtLA0KIA0KIAlkcW1fdW5sb2NrKGRxbSk7DQogDQorCS8qIE91dHNpZGUgdGhlIERR
TSBsb2NrIGJlY2F1c2UgdW5kZXIgdGhlIERRTSBsb2NrIHdlIGNhbid0IGRvDQorCSAqIHJlY2xh
aW0gb3IgdGFrZSBvdGhlciBsb2NrcyB0aGF0IG90aGVycyBob2xkIHdoaWxlIHJlY2xhaW1pbmcu
DQorCSAqLw0KKwlpZiAoZm91bmQpDQorCQlrZmRfZGVjX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2
KTsNCisNCiAJLyogTGFzdGx5LCBmcmVlIG1xZCByZXNvdXJjZXMuDQogCSAqIERvIHVuaW5pdF9t
cWQoKSBhZnRlciBkcW1fdW5sb2NrIHRvIGF2b2lkIGNpcmN1bGFyIGxvY2tpbmcuDQogCSAqLw0K
LS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
