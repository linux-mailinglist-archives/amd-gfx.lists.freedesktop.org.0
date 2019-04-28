Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E1B5A3
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937ED8915B;
	Sun, 28 Apr 2019 07:44:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141EF891C3
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:19 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:18 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:18 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/27] drm/amdkfd: Preserve wave state after instruction fetch
 MEM_VIOL
Thread-Topic: [PATCH 21/27] drm/amdkfd: Preserve wave state after instruction
 fetch MEM_VIOL
Thread-Index: AQHU/ZYvIx0iHyX67UeBvVyI1hNJdg==
Date: Sun, 28 Apr 2019 07:44:18 +0000
Message-ID: <20190428074331.30107-22-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: 18865f31-e13f-4781-6383-08d6cbad51af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB293333F3F6E88A5B8860A4CD92380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G5RQbHzeOj78iesRVrrHOX9u8lqnIyEHcrp+J4ryir/BwBE9QNVA8ipQbTGnweC19e0Kq/ALaVC/lmcpcxvn90akerGZu6gd7G9tX1BgRfT4LSOr6hRFySCKKwbJp/MEYB5VfbfVjzcNWCsalDcUfXAPxyx9X1b0spc0aeyGZOjEnZyqTll2N1U3k6e0DGZmX0fmqsIafiVwIZMqcnzCViy9V8FTqCnmHYziCIz8rW9dDliUgb9cLbRHCCTD/Zr6CFWBBUkdCh2fz1pf4hqKZMk0Nw1hxhhyzS6XgnwsTTIfaHZky1nWK/onnMo5cCOgwcdovKL+QOPpFPGNfyP0kuX0WBHHhGaCqpWfd7cWMrNNn7Ea/lj4p4IzfGAHfIF9DzC898lpEBBYhDuRyc/WL27UevN5jfVDEhUtUt5kd94=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18865f31-e13f-4781-6383-08d6cbad51af
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:18.1554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nficmPYuLLj6etz8ftI/pueM3oEJTVglz15Z2iAKgas=;
 b=ObW037ujYk9BMl2sL1mmspy2uAGIlj0DS8YghzhdGvDEuLwnYZ3chHoSHS+lfk/1rGEHxAgJcra0LzXroGTuDlYsOhwVlmSstZzXPwXKHuuyGJ2B/N3DoJqdDlSJZWRuj1/TYHdqpD4tghM2bw/ntmnuoE9WxWtfiLls97mmZmU=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Cornwall,
 Jay" <Jay.Cornwall@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmF5IENvcm53YWxsIDxKYXkuQ29ybndhbGxAYW1kLmNvbT4NCg0KSWYgaW5zdHJ1Y3Rp
b24gZmV0Y2ggZmFpbHMgdGhlIHdhdmUgY2Fubm90IGJlIGhhbHRlZCBhbmQgcmV0dXJuZWQgdG8N
CnRoZSBzaGFkZXIgd2l0aG91dCByYWlzaW5nIE1FTV9WSU9MIGFnYWluLiBDdXJyZW50bHkgdGhl
IHdhdmUgaXMNCnRlcm1pbmF0ZWQgaWYgdGhpcyBvY2N1cnMsIGJ1dCB0aGlzIGxvc2VzIGluZm9y
bWF0aW9uIGFib3V0IHRoZSBjYXVzZQ0Kb2YgdGhlIGZhdWx0LiBUaGUgZGVidWdnZXIgd291bGQg
cHJlZmVyIHRoZSBmYXVsdGluZyB3YXZlIHN0YXRlIHRvIGJlDQpjb250ZXh0LXNhdmVkLg0KDQpQ
b2xsIGluc2lkZSB0aGUgdHJhcCBoYW5kbGVyIHVudGlsIFRSQVBTVFMuU0FWRUNUWCBpbmRpY2F0
ZXMgY29udGV4dA0Kc2F2ZSBpcyByZWFkeS4gRXhpdCB0aGUgcG9sbCBsb29wIGFuZCBjb21wbGV0
ZSB0aGUgcmVtYWluZGVyIG9mIHRoZQ0KZXhjZXB0aW9uIGhhbmRsZXIsIHRoZW4gcmV0dXJuIHRv
IHRoZSBzaGFkZXIuIFRoZSBuZXh0IGluc3RydWN0aW9uDQpmZXRjaCB3aWxsIGJlIGZyb20gdGhl
IHRyYXAgaGFuZGxlciBhbmQgbm90IHRoZSBmYXVsdGluZyBQQy4gQ29udGV4dA0Kc2F2ZSB3aWxs
IHRoZW4gZGVzY2hlZHVsZSB0aGUgd2F2ZSBhbmQgc2F2ZSBpdHMgc3RhdGUuDQoNClNpZ25lZC1v
ZmYtYnk6IEpheSBDb3Jud2FsbCA8SmF5LkNvcm53YWxsQGFtZC5jb20+DQpSZXZpZXdlZC1ieTog
RmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmggICAgICAgIHwgMTAgKysrKysrLS0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDkuYXNt
IHwgMTAgKysrKysrKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3
c3JfdHJhcF9oYW5kbGVyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBf
aGFuZGxlci5oDQppbmRleCBlYzlhOWE5OWY4MDguLjA5N2RhMGRkM2IwNCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgNCkBAIC0yNzQsMTUg
KzI3NCwxNyBAQCBzdGF0aWMgY29uc3QgdWludDMyX3QgY3dzcl90cmFwX2dmeDhfaGV4W10gPSB7
DQogDQogDQogc3RhdGljIGNvbnN0IHVpbnQzMl90IGN3c3JfdHJhcF9nZng5X2hleFtdID0gew0K
LQkweGJmODIwMDAxLCAweGJmODIwMTVkLA0KKwkweGJmODIwMDAxLCAweGJmODIwMTYxLA0KIAkw
eGI4ZjhmODAyLCAweDg5Nzg4Njc4LA0KIAkweGI4ZjFmODAzLCAweDg2NmVmZjcxLA0KLQkweDAw
MDAwNDAwLCAweGJmODUwMDM3LA0KKwkweDAwMDAwNDAwLCAweGJmODUwMDNiLA0KIAkweDg2NmVm
ZjcxLCAweDAwMDAwODAwLA0KIAkweGJmODUwMDAzLCAweDg2NmVmZjcxLA0KLQkweDAwMDAwMTAw
LCAweGJmODQwMDA4LA0KKwkweDAwMDAwMTAwLCAweGJmODQwMDBjLA0KIAkweDg2NmVmZjc4LCAw
eDAwMDAyMDAwLA0KLQkweGJmODQwMDAxLCAweGJmODEwMDAwLA0KKwkweGJmODQwMDA1LCAweGJm
OGUwMDEwLA0KKwkweGI4ZWVmODAzLCAweDg2NmVmZjZlLA0KKwkweDAwMDAwNDAwLCAweGJmODRm
ZmZiLA0KIAkweDg3NzhmZjc4LCAweDAwMDAyMDAwLA0KIAkweDgwZWM4ODZjLCAweDgyZWQ4MDZk
LA0KIAkweGI4ZWVmODA3LCAweDg2NmZmZjZlLA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDkuYXNtIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXJfZ2Z4OS5hc20NCmluZGV4IDBiYjljNTc3YjNh
Mi4uNmEwMTBjOWU1NWRlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
Y3dzcl90cmFwX2hhbmRsZXJfZ2Z4OS5hc20NCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDkuYXNtDQpAQCAtMjY2LDEwICsyNjYsMTYgQEAgaWYg
KCFFTVVfUlVOX0hBQ0spDQogDQogTF9IQUxUX1dBVkU6DQogICAgIC8vIElmIFNUQVRVUy5IQUxU
IGlzIHNldCB0aGVuIHRoaXMgZmF1bHQgbXVzdCBjb21lIGZyb20gU1FDIGluc3RydWN0aW9uIGZl
dGNoLg0KLSAgICAvLyBXZSBjYW5ub3QgcHJldmVudCBmdXJ0aGVyIGZhdWx0cyBzbyBqdXN0IHRl
cm1pbmF0ZSB0aGUgd2F2ZWZyb250Lg0KKyAgICAvLyBXZSBjYW5ub3QgcHJldmVudCBmdXJ0aGVy
IGZhdWx0cy4gU3BpbiB3YWl0IHVudGlsIGNvbnRleHQgc2F2ZWQuDQogICAgIHNfYW5kX2IzMiAg
ICAgICB0dG1wMiwgc19zYXZlX3N0YXR1cywgU1FfV0FWRV9TVEFUVVNfSEFMVF9NQVNLDQogICAg
IHNfY2JyYW5jaF9zY2MwICBMX05PVF9BTFJFQURZX0hBTFRFRA0KLSAgICBzX2VuZHBnbQ0KKw0K
K0xfV0FJVF9DVFhfU0FWRToNCisgICAgc19zbGVlcCAgICAgICAgIDB4MTANCisgICAgc19nZXRy
ZWdfYjMyICAgIHR0bXAyLCBod3JlZyhIV19SRUdfVFJBUFNUUykNCisgICAgc19hbmRfYjMyICAg
ICAgIHR0bXAyLCB0dG1wMiwgU1FfV0FWRV9UUkFQU1RTX1NBVkVDVFhfTUFTSw0KKyAgICBzX2Ni
cmFuY2hfc2NjMCAgTF9XQUlUX0NUWF9TQVZFDQorDQogTF9OT1RfQUxSRUFEWV9IQUxURUQ6DQog
ICAgIHNfb3JfYjMyICAgICAgICBzX3NhdmVfc3RhdHVzLCBzX3NhdmVfc3RhdHVzLCBTUV9XQVZF
X1NUQVRVU19IQUxUX01BU0sNCiANCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
