Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33404D56A
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 19:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9496E5DE;
	Thu, 20 Jun 2019 17:44:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690048.outbound.protection.outlook.com [40.107.69.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA7C6E5DE
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 17:44:11 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1455.namprd12.prod.outlook.com (10.172.56.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 20 Jun 2019 17:44:09 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 17:44:09 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Fix VM handling for VMID 0 w.r.t. SYSTEM_APERTURE
Thread-Topic: [PATCH] Fix VM handling for VMID 0 w.r.t. SYSTEM_APERTURE
Thread-Index: AQHVJ4/DGfrqw+8Ykk2yzRV+XUBvyg==
Date: Thu, 20 Jun 2019 17:44:09 +0000
Message-ID: <20190620174359.20529-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN4PR10CA0015.namprd10.prod.outlook.com (2603:10b6:403::25)
 To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f3cd54f-326f-4953-c802-08d6f5a6e5ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1455; 
x-ms-traffictypediagnostic: MWHPR12MB1455:
x-microsoft-antispam-prvs: <MWHPR12MB1455759114CA3D0CC3BC7F85F7E40@MWHPR12MB1455.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(52116002)(99286004)(4326008)(316002)(72206003)(305945005)(3846002)(86362001)(25786009)(8676002)(8936002)(6506007)(386003)(50226002)(478600001)(19627235002)(81166006)(14454004)(53936002)(5660300002)(81156014)(36756003)(2501003)(64756008)(66066001)(66556008)(476003)(26005)(73956011)(2616005)(68736007)(66946007)(186003)(66446008)(2351001)(2906002)(256004)(6916009)(102836004)(6436002)(5640700003)(486006)(6116002)(6512007)(71190400001)(71200400001)(6486002)(14444005)(1076003)(7736002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1455;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ay+CmCuN3AGsQFNwsSQvfl3gCa/b6/PzErydsc+vOlzUiX5z4IwBfjjTaQk6kpODbH1JibeQN793B4vNRLLkX1NWG/1avVu7VX5RuxPebiDPakPeZ+x7i3md7i6BxKtyZNEQHTtYsmd6o5042pKnLB3P/udShWwzAWok+KIu0kEHgNftXgN2lWp3755H76+W7MBGT0a7+LnUCvfp2dYI7e03QchLj4KTk1cA2GTbcDkjcRQcC6tiNT6lbS7f8neL8fxcwDyEYhbuowwqix3RgAGS6bSpIWbVxgzxifaLyh5wbScfo0y2IV4WJP0wk9wq4u3RuWo5PM5vwf2to1Zj60GTS3RHTntiEGqi/RY3bjJ1Lk1pjbg7q7g8Xx+p3jXT4QsMAfp9ZcUwwIGpMFeOmX9Wuz4sgxIiYC++Sv6+uCY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3cd54f-326f-4953-c802-08d6f5a6e5ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 17:44:09.2435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1455
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS3gTh1iM7YX57ZL1HmtMAwHeBvJsDFzErIY/vZpcKA=;
 b=HB49MXabrWqKzttaLkLr45pg9bKlgeSs7+P69BPsNCzgpJVuBU+0EHLI/2Pz7gNrSJ75Rlhs+dmvGo0zA+03nl4+VnzXywYcVD5tgCbtpBhX3+qCxHQoB3IgvCqMkFejPvymfJL0N/JUz2sGZTO5xaQmwfrQ/spCpmQCoAvSJLc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQog
c3JjL2xpYi9yZWFkX3ZyYW0uYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc3JjL2xpYi9yZWFkX3ZyYW0uYyBiL3NyYy9saWIvcmVh
ZF92cmFtLmMNCmluZGV4IDEzMWNlYzMuLjgxMmRlOTYgMTAwNjQ0DQotLS0gYS9zcmMvbGliL3Jl
YWRfdnJhbS5jDQorKysgYi9zcmMvbGliL3JlYWRfdnJhbS5jDQpAQCAtMzAwLDcgKzMwMCw3IEBA
IHN0YXRpYyBpbnQgdW1yX2FjY2Vzc192cmFtX2FpKHN0cnVjdCB1bXJfYXNpYyAqYXNpYywgdWlu
dDMyX3Qgdm1pZCwNCiAJdWludDY0X3Qgc3RhcnRfYWRkciwgcGFnZV90YWJsZV9zdGFydF9hZGRy
LCBwYWdlX3RhYmxlX2Jhc2VfYWRkciwNCiAJCSBwYWdlX3RhYmxlX3NpemUsIHB0ZV9pZHgsIHBk
ZV9pZHgsIHB0ZV9lbnRyeSwgcGRlX2VudHJ5LA0KIAkJIHBkZV9hZGRyZXNzLCB2Z2FfYmFzZV9h
ZGRyZXNzLCB2bV9mYl9vZmZzZXQsIHZtX2ZiX2Jhc2UsDQotCQkgdmFfbWFzaywgb2Zmc2V0X21h
c2s7DQorCQkgdmFfbWFzaywgb2Zmc2V0X21hc2ssIHN5c3RlbV9hcGVydHVyZV9sb3csIHN5c3Rl
bV9hcGVydHVyZV9oaWdoOw0KIAl1aW50MzJfdCBjaHVua19zaXplLCB0bXA7DQogCWludCBwZGVf
Y250LCBjdXJyZW50X2RlcHRoLCBwYWdlX3RhYmxlX2RlcHRoLCBmaXJzdDsNCiAJc3RydWN0IHsN
CkBAIC0zMTIsNyArMzEyLDEwIEBAIHN0YXRpYyBpbnQgdW1yX2FjY2Vzc192cmFtX2FpKHN0cnVj
dCB1bXJfYXNpYyAqYXNpYywgdWludDMyX3Qgdm1pZCwNCiAJCQltbVZNX0NPTlRFWFR4X1BBR0Vf
VEFCTEVfQkFTRV9BRERSX0hJMzIsDQogCQkJbW1WR0FfTUVNT1JZX0JBU0VfQUREUkVTUywNCiAJ
CQltbVZHQV9NRU1PUllfQkFTRV9BRERSRVNTX0hJR0gsDQotCQkJbW1NQ19WTV9GQl9PRkZTRVQ7
DQorCQkJbW1NQ19WTV9GQl9PRkZTRVQsDQorCQkJbW1NQ19WTV9NWF9MMV9UTEJfQ05UTCwNCisJ
CQltbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1dfQUREUiwNCisJCQltbU1DX1ZNX1NZU1RFTV9B
UEVSVFVSRV9ISUdIX0FERFI7DQogCX0gcmVnaXN0ZXJzOw0KIAlzdHJ1Y3Qgew0KIAkJdWludDY0
X3QNCkBAIC0zODEsNiArMzg0LDExIEBAIHN0YXRpYyBpbnQgdW1yX2FjY2Vzc192cmFtX2FpKHN0
cnVjdCB1bXJfYXNpYyAqYXNpYywgdWludDMyX3Qgdm1pZCwNCiAJfQ0KIA0KIAkvLyByZWFkIHZt
IHJlZ2lzdGVycw0KKwlyZWdpc3RlcnMubW1NQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERS
ID0gdW1yX3JlYWRfcmVnX2J5X25hbWVfYnlfaXAoYXNpYywgaHViLCAibW1NQ19WTV9TWVNURU1f
QVBFUlRVUkVfSElHSF9BRERSIik7DQorCXJlZ2lzdGVycy5tbU1DX1ZNX1NZU1RFTV9BUEVSVFVS
RV9MT1dfQUREUiA9IHVtcl9yZWFkX3JlZ19ieV9uYW1lX2J5X2lwKGFzaWMsIGh1YiwgIm1tTUNf
Vk1fU1lTVEVNX0FQRVJUVVJFX0xPV19BRERSIik7DQorCXN5c3RlbV9hcGVydHVyZV9sb3cgPSAo
KHVpbnQ2NF90KXJlZ2lzdGVycy5tbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1dfQUREUikgPDwg
MTg7DQorCXN5c3RlbV9hcGVydHVyZV9oaWdoID0gKCh1aW50NjRfdClyZWdpc3RlcnMubW1NQ19W
TV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERSKSA8PCAxODsNCisJcmVnaXN0ZXJzLm1tTUNfVk1f
TVhfTDFfVExCX0NOVEwgPSB1bXJfcmVhZF9yZWdfYnlfbmFtZV9ieV9pcChhc2ljLCBodWIsICJt
bU1DX1ZNX01YX0wxX1RMQl9DTlRMIik7DQogCXNwcmludGYoYnVmLCAibW1WTV9DT05URVhUJSIg
UFJJdTMyICJfUEFHRV9UQUJMRV9TVEFSVF9BRERSX0xPMzIiLCB2bWlkKTsNCiAJCXJlZ2lzdGVy
cy5tbVZNX0NPTlRFWFR4X1BBR0VfVEFCTEVfU1RBUlRfQUREUl9MTzMyID0gdW1yX3JlYWRfcmVn
X2J5X25hbWVfYnlfaXAoYXNpYywgaHViLCBidWYpOw0KIAkJcGFnZV90YWJsZV9zdGFydF9hZGRy
ID0gKHVpbnQ2NF90KXJlZ2lzdGVycy5tbVZNX0NPTlRFWFR4X1BBR0VfVEFCTEVfU1RBUlRfQURE
Ul9MTzMyIDw8IDEyOw0KQEAgLTQyNSw3ICs0MzMsMTAgQEAgc3RhdGljIGludCB1bXJfYWNjZXNz
X3ZyYW1fYWkoc3RydWN0IHVtcl9hc2ljICphc2ljLCB1aW50MzJfdCB2bWlkLA0KIAkJCQkibW1W
R0FfTUVNT1JZX0JBU0VfQUREUkVTUz0weCUiIFBSSXgzMiAiXG4iDQogCQkJCSJtbVZHQV9NRU1P
UllfQkFTRV9BRERSRVNTX0hJR0g9MHglIiBQUkl4MzIgIlxuIg0KIAkJCQkibW1NQ19WTV9GQl9P
RkZTRVQ9MHglIiBQUkl4MzIgIlxuIg0KLQkJCQkibW1NQ19WTV9GQl9MT0NBVElPTl9CQVNFPTB4
JSIgUFJJeDY0ICJcbiIsDQorCQkJCSJtbU1DX1ZNX0ZCX0xPQ0FUSU9OX0JBU0U9MHglIiBQUkl4
NjQgIlxuIg0KKwkJCQkibW1NQ19WTV9NWF9MMV9UTEJfQ05UTD0weCUiIFBSSXgzMiAiXG4iDQor
CQkJCSJtbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1dfQUREUj0weCUiIFBSSXgzMiAiXG4iDQor
CQkJCSJtbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFI9MHglIiBQUkl4MzIgIlxuIiwN
CiAJCQl2bWlkLCByZWdpc3RlcnMubW1WTV9DT05URVhUeF9QQUdFX1RBQkxFX1NUQVJUX0FERFJf
TE8zMiwNCiAJCQl2bWlkLCByZWdpc3RlcnMubW1WTV9DT05URVhUeF9QQUdFX1RBQkxFX1NUQVJU
X0FERFJfSEkzMiwNCiAJCQl2bWlkLCByZWdpc3RlcnMubW1WTV9DT05URVhUeF9QQUdFX1RBQkxF
X0JBU0VfQUREUl9MTzMyLA0KQEAgLTQzNCwxMCArNDQ1LDM4IEBAIHN0YXRpYyBpbnQgdW1yX2Fj
Y2Vzc192cmFtX2FpKHN0cnVjdCB1bXJfYXNpYyAqYXNpYywgdWludDMyX3Qgdm1pZCwNCiAJCQly
ZWdpc3RlcnMubW1WR0FfTUVNT1JZX0JBU0VfQUREUkVTUywNCiAJCQlyZWdpc3RlcnMubW1WR0Ff
TUVNT1JZX0JBU0VfQUREUkVTU19ISUdILA0KIAkJCXJlZ2lzdGVycy5tbU1DX1ZNX0ZCX09GRlNF
VCwNCi0JCQl2bV9mYl9iYXNlKTsNCisJCQl2bV9mYl9iYXNlLA0KKwkJCXJlZ2lzdGVycy5tbU1D
X1ZNX01YX0wxX1RMQl9DTlRMLA0KKwkJCXJlZ2lzdGVycy5tbU1DX1ZNX1NZU1RFTV9BUEVSVFVS
RV9MT1dfQUREUiwNCisJCQlyZWdpc3RlcnMubW1NQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9B
RERSDQorCQkJKTsNCiANCiAJLy8gdHJhbnNmb3JtIHBhZ2VfdGFibGVfYmFzZQ0KIAlwYWdlX3Rh
YmxlX2Jhc2VfYWRkciAtPSB2bV9mYl9vZmZzZXQ7DQorDQorCWlmICh2bWlkID09IDApIHsNCisJ
CXVpbnQzMl90IHNhbSA9IHVtcl9iaXRzbGljZV9yZWdfYnlfbmFtZV9ieV9pcChhc2ljLCBodWIs
ICJtbU1DX1ZNX01YX0wxX1RMQl9DTlRMIiwgIlNZU1RFTV9BQ0NFU1NfTU9ERSIsIHJlZ2lzdGVy
cy5tbU1DX1ZNX01YX0wxX1RMQl9DTlRMKTsNCisJCS8vIGFkZHJlc3NlcyBpbiBWTUlEMCBuZWVk
IHNwZWNpYWwgaGFuZGxpbmcgdy5yLnQuIFBBR0VfVEFCTEVfU1RBUlRfQUREUg0KKwkJc3dpdGNo
IChzYW0pIHsNCisJCQljYXNlIDA6IC8vIHBoeXNpY2FsIGFjY2Vzcw0KKwkJCQlyZXR1cm4gdW1y
X2FjY2Vzc192cmFtKGFzaWMsIFVNUl9MSU5FQVJfSFVCLCBhZGRyZXNzLCBzaXplLCBkc3QsIHdy
aXRlX2VuKTsNCisJCQljYXNlIDE6IC8vIGFsd2F5cyBWTSBhY2Nlc3MNCisJCQkJYnJlYWs7DQor
CQkJY2FzZSAyOiAvLyBpbnNpZGUgc3lzdGVtIGFwZXJ0dXJlIGlzIG1hcHBlZCwgb3RoZXJ3aXNl
IHVubWFwcGVkDQorCQkJCWlmICghKGFkZHJlc3MgPj0gc3lzdGVtX2FwZXJ0dXJlX2xvdyAmJiBh
ZGRyZXNzIDwgc3lzdGVtX2FwZXJ0dXJlX2hpZ2gpKQ0KKwkJCQkJcmV0dXJuIHVtcl9hY2Nlc3Nf
dnJhbShhc2ljLCBVTVJfTElORUFSX0hVQiwgYWRkcmVzcywgc2l6ZSwgZHN0LCB3cml0ZV9lbik7
DQorCQkJCWJyZWFrOw0KKwkJCWNhc2UgMzogLy8gaW5zaWRlIHN5c3RlbSBhcGVydHVyZSBpcyB1
bm1hcHBlZCwgb3RoZXJ3aXNlIG1hcHBlZA0KKwkJCQlpZiAoYWRkcmVzcyA+PSBzeXN0ZW1fYXBl
cnR1cmVfbG93ICYmIGFkZHJlc3MgPCBzeXN0ZW1fYXBlcnR1cmVfaGlnaCkNCisJCQkJCXJldHVy
biB1bXJfYWNjZXNzX3ZyYW0oYXNpYywgVU1SX0xJTkVBUl9IVUIsIGFkZHJlc3MsIHNpemUsIGRz
dCwgd3JpdGVfZW4pOw0KKwkJCQlicmVhazsNCisJCQlkZWZhdWx0Og0KKwkJCQlhc2ljLT5tZW1f
ZnVuY3Mudm1fbWVzc2FnZSgiW1dBUk5JTkddOiBVbmhhbmRsZWQgU1lTVEVNX0FDQ0VTU19NT0RF
IG1vZGUgWyUiIFBSSXUzMiAiXVxuIiwgc2FtKTsNCisJCQkJYnJlYWs7DQorCQl9DQorCX0NCisN
CisJLy8gZmFsbHRocm91Z2gsIGFuZC9vciBWTUlEcyBmb3IgPj0gMSBhcmUgYWx3YXlzIG1hcHBl
ZA0KIAlhZGRyZXNzIC09IHBhZ2VfdGFibGVfc3RhcnRfYWRkcjsNCiANCiAJZG8gew0KLS0gDQoy
LjIxLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
