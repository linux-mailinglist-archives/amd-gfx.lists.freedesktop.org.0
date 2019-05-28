Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFD82C411
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 12:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173A89D3E;
	Tue, 28 May 2019 10:13:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810073.outbound.protection.outlook.com [40.107.81.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0B989D3E
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 10:13:56 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1934.namprd12.prod.outlook.com (10.175.56.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Tue, 28 May 2019 10:13:53 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 10:13:53 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Thread-Topic: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Thread-Index: AQHVFSxBYHqsgoR6uEW/oFZToTLUWqaAUbTQ
Date: Tue, 28 May 2019 10:13:52 +0000
Message-ID: <MWHPR12MB1326361E2C7ADE7523E3E7D48F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1559030775-19612-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1559030775-19612-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1508144e-01a9-41d3-5ccd-08d6e3552faa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1934; 
x-ms-traffictypediagnostic: MWHPR12MB1934:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1934F2AC8750F6F10708F81B8F1E0@MWHPR12MB1934.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(39860400002)(396003)(346002)(13464003)(199004)(189003)(76116006)(73956011)(66446008)(76176011)(74316002)(64756008)(66556008)(66476007)(66946007)(7696005)(446003)(99286004)(2906002)(102836004)(68736007)(229853002)(316002)(5660300002)(6506007)(52536014)(81166006)(81156014)(8676002)(110136005)(14454004)(71200400001)(71190400001)(66066001)(2501003)(8936002)(11346002)(476003)(305945005)(33656002)(7736002)(72206003)(478600001)(486006)(6116002)(26005)(6246003)(6306002)(55016002)(3846002)(9686003)(53936002)(6436002)(86362001)(256004)(14444005)(186003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1934;
 H:MWHPR12MB1326.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: smswfn60IPiP7xCgl9NFSYQhsxx7sVfu/PQHSwqao0ssLDaO71wNbUg7bLXvVxFdA51HCIrTXxLUQx1Oo1F21rekPFRGbag83rDYuPEhYJg/X7niDDy+0QaOC9Wu/8jMlhkMfkSIHjba2ZLtz6jjaTBLKC35xPyxlJZ9mcVrotRxyPYw0YJCUKOYC/4R/OWChWy7FB4sl/kFp1BPm3wyQdpbXN+YcOCYovbV879L/uvAJZpBPE397W6DxgU7RxtEIGlf6oGQCYHKML58nl0euCzFArWR+4Uu3Rdk5CwNRddinkvAxmyoqiOU78s+DtkUIb2Oa4u9Llf2k9XcDF4JBTtH3Msj9kv0Q4oyzuUxHK5FCpVBJ3iBlreKVWqfwIErnRDtGG3QMT0DpzSZyXVhR8bzxNQuJsV+mAtu9X82kOE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1508144e-01a9-41d3-5ccd-08d6e3552faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 10:13:52.9251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6tigSsaCiVBDFqHXmVwUknvjk54Nc6VDCCSsvImekg=;
 b=wxDDymiwgI5ywDhBkFQl/2YdaDgRFCPBOv5qIgib+K/cKxsNKb3+m4eZmZV1AW2LL+aRnQX6YdfaZ1BglVrA8cXEmVnHwClb1qLfQ+8bwi6DWrBgGspG0diMFJiTQn/1jUgLH3SV958PUFYILtVh7Gg3d4+VgbxvSnpvOl3N47I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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

UGluZyAuLi4uLi4NCg0KQmVzdCB3aXNoZXMNCkVtaWx5IERlbmcNCg0KDQoNCj4tLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBFbWlseQ0KPkRlbmcNCj5TZW50OiBUdWVzZGF5
LCBNYXkgMjgsIDIwMTkgNDowNiBQTQ0KPlRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPkNjOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPlN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZGdwdTpGaXggdGhlIHVucGluIHdhcm5pbmcgYWJvdXQgY3NiIGJ1ZmZlcg0KPg0K
PkFzIGl0IHdpbGwgZGVzdHJveSBjbGVhcl9zdGF0ZV9vYmosIGFuZCBhbHNvIHdpbGwgdW5waW4g
aXQgaW4gdGhlIGdmeF92OV8wX3N3X2ZpbmksDQo+c28gZG9uJ3QgbmVlZCB0byBjYWxsIGFtZGdw
dV9ib19mcmVlX2tlcm5lbCBpbiBnZnhfdjlfMF9zd19maW5pLCBvciBpdCB3aWxsDQo+aGF2ZSB1
bnBpbiB3YXJuaW5nLg0KPg0KPlNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdA
YW1kLmNvbT4NCj4tLS0NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8
IDQgKy0tLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0p
DQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMN
Cj5iL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj5pbmRleCBjNzYzNzMz
Li5jYzVhMzgyIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+QEAg
LTE3OTQsOSArMTc5NCw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfZmluaSh2b2lkICpoYW5k
bGUpDQo+DQo+IAlnZnhfdjlfMF9tZWNfZmluaShhZGV2KTsNCj4gCWdmeF92OV8wX25nZ19maW5p
KGFkZXYpOw0KPi0JYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZngucmxjLmNsZWFyX3N0
YXRlX29iaiwNCj4tCQkJCSZhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dwdV9hZGRyLA0KPi0J
CQkJKHZvaWQgKiopJmFkZXYtPmdmeC5ybGMuY3NfcHRyKTsNCj4rCWFtZGdwdV9ib191bnJlZigm
YWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOw0KPiAJaWYgKGFkZXYtPmFzaWNfdHlwZSA9
PSBDSElQX1JBVkVOKSB7DQo+IAkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZngucmxj
LmNwX3RhYmxlX29iaiwNCj4gCQkJCSZhZGV2LT5nZngucmxjLmNwX3RhYmxlX2dwdV9hZGRyLA0K
Pi0tDQo+Mi43LjQNCj4NCj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPmFtZC1nZnggbWFpbGluZyBsaXN0DQo+YW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj5odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
