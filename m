Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F932984
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A218932E;
	Mon,  3 Jun 2019 07:27:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730072.outbound.protection.outlook.com [40.107.73.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAF28932E
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:27:44 +0000 (UTC)
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3704.namprd12.prod.outlook.com (52.132.244.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 07:27:41 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::9511:4305:9006:becd]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::9511:4305:9006:becd%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 07:27:41 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>,
 "Daenzer, Michel" <Michel.Daenzer@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] dri2: reply to client for WaitMSC request in any case
Thread-Topic: [PATCH v2] dri2: reply to client for WaitMSC request in any case
Thread-Index: AQHVGd2x/Bhsc7VQWkiMMpyH+IenMaaJh8Nw
Date: Mon, 3 Jun 2019 07:27:41 +0000
Message-ID: <CH2PR12MB3767FBF8BA03D185710F9928FE140@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
 <bc4571fc-6521-74d7-2d5c-1665396b50fc@amd.com>
In-Reply-To: <bc4571fc-6521-74d7-2d5c-1665396b50fc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35ba3b92-0f6a-4475-1736-08d6e7f4f6d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3704; 
x-ms-traffictypediagnostic: CH2PR12MB3704:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB370459A8D12FA8FE861B1B51FE140@CH2PR12MB3704.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(366004)(346002)(396003)(136003)(199004)(189003)(13464003)(229853002)(6506007)(8936002)(53546011)(102836004)(33656002)(76176011)(186003)(966005)(256004)(14444005)(2501003)(486006)(7696005)(7736002)(305945005)(81166006)(81156014)(9686003)(6306002)(110136005)(6246003)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(14454004)(8676002)(99286004)(53936002)(76116006)(26005)(316002)(6436002)(55016002)(5660300002)(86362001)(25786009)(66066001)(72206003)(476003)(52536014)(68736007)(446003)(2906002)(74316002)(71200400001)(71190400001)(11346002)(3846002)(478600001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3704;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lWkW6YkROgWQVUK8NBPuz1hDjN7xw4ueV3O0YopnymGwVumN04+vtVEf4CpTRQWKbohOVhyPxEeBDTAH498zM4dz3h+SVg1EZpnl0FUbGG32Q2OKL5LcFYYtLGzat3zeFRS1U/TZxZS6EibafGNJkNg4cQD3KMhmtGGka0p4spJ8PsMb2Ar98Yy5F6BcMAYW+xzw9veklZG/QgqIV4rFCRKL9FuYYDQ7aYdoCHuDRrEoyLp+6SFln0NiW/mzCtc2YdPyXc12Lu8ytstfjhC9bW/TqSsdlsm0fwfCD+qld1GjSJUajQ7w2prB6u1ocU1S6phIbY+7ywEQPkl7DDLgzy3DVeFistVHQ0Fz6ld35DbIt5qtja+csgBZmhJL9SvpVyulB168c2LeF3+DhIK8fTahGles1fDDhRpK38GE7Q8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ba3b92-0f6a-4475-1736-08d6e7f4f6d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 07:27:41.7099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3704
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zwl06qSONPcDJ4JpSgNTwsOMszwFbnMjPxZTq4nu0hQ=;
 b=HiM/O6aJ5dUCC4C3nkalNQwdP+tRwLin5t4SRY8G6qnBmIphMXaFCPGjHsUb2vCC47DwMLIIboje/btdMuhJyL8oYlBIUqOQDslFcH616kFPt22ZwP2ioBMId4Qdz+GSl4atd/9uRkEszxZKXmDXWFpuSv/JUXTXNltW+8UsS1s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNClJlZ2FyZHMsDQpGZWlm
ZWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBDdWksIEZsb3JhDQpT
ZW50OiAyMDE55bm0NuaciDPml6UgMTU6MjYNClRvOiBDdWksIEZsb3JhIDxGbG9yYS5DdWlAYW1k
LmNvbT47IERhZW56ZXIsIE1pY2hlbCA8TWljaGVsLkRhZW56ZXJAYW1kLmNvbT47IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGRyaTI6IHJlcGx5IHRv
IGNsaWVudCBmb3IgV2FpdE1TQyByZXF1ZXN0IGluIGFueSBjYXNlDQoNCnBpbmcuLi4NCg0KY29t
bWl0IDQ3NjEzZThlOGY0YTVlM2IyNTgzMGUzYzAxNWE0YTIxN2ZjYmU0NjkNCkF1dGhvcjogRmxv
cmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4NCkRhdGU6wqDCoCBXZWQgTWF5IDI5IDE0OjE4OjUw
IDIwMTkgKzA4MDANCg0KIMKgwqDCoCBkcmkyOiByZXBseSB0byBjbGllbnQgZm9yIFdhaXRNU0Mg
cmVxdWVzdCBpbiBhbnkgY2FzZQ0KDQogwqDCoMKgIG90aGVyd2lzZSBjbGllbnQgd291bGQgd2Fp
dCBmb3IgcmVwbHkgZm9yZXZlciBhbmQgZGVza3RvcCBhcHBlYXJzIGhhbmcuDQoNCiDCoMKgwqAg
U2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4NCg0KZGlmZiAtLWdp
dCBhL3NyYy9hbWRncHVfZHJpMi5jIGIvc3JjL2FtZGdwdV9kcmkyLmMgaW5kZXggNDQzMTZhYy4u
YmIzZDlkMCAxMDA2NDQNCi0tLSBhL3NyYy9hbWRncHVfZHJpMi5jDQorKysgYi9zcmMvYW1kZ3B1
X2RyaTIuYw0KQEAgLTEwNjIsNiArMTA2Miw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RyaTJfc2No
ZWR1bGVfd2FpdF9tc2MoQ2xpZW50UHRyDQpjbGllbnQsIERyYXdhYmxlUHRyIGRyYXcsDQogwqBv
dXRfY29tcGxldGU6DQogwqDCoMKgwqDCoMKgwqAgaWYgKHdhaXRfaW5mbykNCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X2RyaTJfZGVmZXJyZWRfZXZlbnQoTlVMTCwgMCwg
d2FpdF9pbmZvKTsNCivCoMKgwqDCoMKgwqAgZWxzZQ0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRFJJMldhaXRNU0NDb21wbGV0ZShjbGllbnQsIGRyYXcsIHRhcmdldF9tc2MsIDAsIDAp
Ow0KKw0KIMKgwqDCoMKgwqDCoMKgIHJldHVybiBUUlVFOw0KIMKgfQ0KDQrlnKggNS8yOS8yMDE5
IDI6MzYgUE0sIEN1aSwgRmxvcmEg5YaZ6YGTOg0KPiBvdGhlcndpc2UgY2xpZW50IHdvdWxkIHdh
aXQgZm9yIHJlcGx5IGZvcmV2ZXIgYW5kIGRlc2t0b3AgYXBwZWFycyBoYW5nLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KPiAtLS0NCj4gICBzcmMv
YW1kZ3B1X2RyaTIuYyB8IDMgKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvc3JjL2FtZGdwdV9kcmkyLmMgYi9zcmMvYW1kZ3B1X2RyaTIu
YyBpbmRleCANCj4gNDQzMTZhYy4uMzQzNTNhNyAxMDA2NDQNCj4gLS0tIGEvc3JjL2FtZGdwdV9k
cmkyLmMNCj4gKysrIGIvc3JjL2FtZGdwdV9kcmkyLmMNCj4gQEAgLTEwNjIsNiArMTA2Miw5IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X2RyaTJfc2NoZWR1bGVfd2FpdF9tc2MoQ2xpZW50UHRyIGNsaWVu
dCwgRHJhd2FibGVQdHIgZHJhdywNCj4gICBvdXRfY29tcGxldGU6DQo+ICAgCWlmICh3YWl0X2lu
Zm8pDQo+ICAgCQlhbWRncHVfZHJpMl9kZWZlcnJlZF9ldmVudChOVUxMLCAwLCB3YWl0X2luZm8p
Ow0KPiArDQo+ICsJRFJJMldhaXRNU0NDb21wbGV0ZShjbGllbnQsIGRyYXcsIHRhcmdldF9tc2Ms
IDAsIDApOw0KPiArDQo+ICAgCXJldHVybiBUUlVFOw0KPiAgIH0NCj4gICANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
