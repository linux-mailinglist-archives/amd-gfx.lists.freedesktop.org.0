Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D7CC3C0
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 21:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFC06E31D;
	Fri,  4 Oct 2019 19:48:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9316E31D
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 19:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYxhrzk1ti1S1EOjd7Y8hJwZ5P/dZtzOuQzjfCE7cSyRz3LoCOKNL4tNKIlvUaFODXDOjQ2TeSM3cFncZWelXhmg/scMVTvRQB9Vp6IdUOcnMK+69ne2eQL/CT+1l6MDC5JbUXooOnTceRmYoi72l/2tub/kyw5yaGaPB4fvNoRp7IAdzSqw25effTBJcgcsny7awyRenLH7eG8hBZL6HoWBePSuW3EAJ736P0YIl+acstVuw4Bqn0OAhmDWCSks4RJvjQFjb9/RBnxfGXcDjycKo5+2RG4oy88JT+n49U437BdZuVI5n2IXgIFDQL+5lX+QHy5Ac/JvJBQoqwQG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jYt6RwSslQJh9nFRGqnXAe+kJeynNsmHwvAYHe4kBY=;
 b=XLqoRY7RFMyyIug/GEcCAgCQIGIA/ujxs7CpMtXPRxtOp0cfHCWR4dh3hkX98gEko52s2/Z5E11t17dgl8QHjhtQr0llX0Qd0+T/0X75Fck8R1COfgZDPkrdcjKuvmDD71+ioysPIWD5hn3B0VP096udDNjm30Df9yid5ZauGgDCyiTNa/Do5ocFeoZg466XqF+tn9vbvB/32mdW/2vMvjuDQURpEgMl4kMfTSGt3FFDtVQafAZ9tB1x2g0k6KouBUygqxPamAAv9Rd5oBjHnHYNlAhCbQKOTgwWknK4eqZ7DE1kE1OJwLJr4Vq6WO5pfvO1ckrWgWv1KIAW6PeSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3836.namprd12.prod.outlook.com (10.255.173.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Fri, 4 Oct 2019 19:48:53 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 19:48:53 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Li, Roman" <Roman.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/include: add aux timeout vega registers
Thread-Topic: [PATCH] drm/amd/include: add aux timeout vega registers
Thread-Index: AQHVeuxB2NejdlNsV0CGL7XJ7qDY96dK402g
Date: Fri, 4 Oct 2019 19:48:53 +0000
Message-ID: <DM6PR12MB346612ADD147BE3B44FD5B3C9E9E0@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <1570218300-23968-1-git-send-email-Roman.Li@amd.com>
In-Reply-To: <1570218300-23968-1-git-send-email-Roman.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ca499bd-39c0-44d2-ccfc-08d74903e2c9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3836:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3836DCCA9A81FDC734CF96B89E9E0@DM6PR12MB3836.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:392;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(189003)(199004)(13464003)(256004)(52536014)(25786009)(6436002)(229853002)(8676002)(81156014)(81166006)(86362001)(5660300002)(71200400001)(71190400001)(6116002)(33656002)(3846002)(2906002)(102836004)(53546011)(6506007)(7736002)(186003)(26005)(966005)(4326008)(305945005)(99286004)(316002)(2501003)(76176011)(446003)(74316002)(7696005)(11346002)(66556008)(66066001)(14454004)(66476007)(66946007)(66446008)(55016002)(64756008)(6306002)(9686003)(76116006)(8936002)(476003)(486006)(54906003)(110136005)(6246003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3836;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U8pNCICr3GXNzPPwGStyp48fpedETW6P9kJ1rCl4KhCurnlmdN8qYrA4CuAMOlSu7iJ+aBlBL4H2eYg2LXKdWXNsCZODnnI58APMhmY/VdilZQE3yLqImXOnzFyY5RIzsXgBRlM3JItsmSS8Blyt3i8JXlEwK5+KRRfFtD7BJMUb7WnzSXNhNh6RMQHPj+FKxpBGMdhtItr0ln+YvOS95V/asA8IDH8cGj3aPXBY8+aVrpHxp10SzUC+lxrv4sUHCwp/e0fv0ZZd5B21FCgzGTYk+08KoE/jSIM84pwM5k/R2v8rGyj5bzNK+NBth1S5nV3CMfcFcE0SKrFZB3ec5s9pNxjvaPeQc7Q9FW4SzgDjzD1IgsEjg6QVU/TdHtp49JJwkIu7+ugVP15f2BKQC+CXBxl9YnOHSOpTgGiFvSVMcW1nBl8HPKPHnkINES+tDkNZoYPGL+KE/RFiWF9f7w==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca499bd-39c0-44d2-ccfc-08d74903e2c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 19:48:53.2561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfOE+Mo9wyUXMo9bpBXwCbFIJxD3Hd53TC5Avlxt1/Psl01hv7i5MOl1T9/iQtFo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3836
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jYt6RwSslQJh9nFRGqnXAe+kJeynNsmHwvAYHe4kBY=;
 b=pAdukOK+nhM5LhRa8C3gtMmJPq+pa6g/snkEjDIYTELilUora1CegSaVi7+xc9SFkLg4urPpJFzwclRzx23r1km7bT2BHZZ6IUTQmeC9byPyhRLNvF76Yf29kP9Ph6O5gE4S886nm/KwbTh/oSz77uSIsYe1hutTPykxAhT8pt0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IFpoYW4gTGl1IDx6aGFuLmxpdUBhbWQu
Y29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFJvbWFuLkxpQGFt
ZC5jb20NClNlbnQ6IDIwMTkvT2N0b2Jlci8wNCwgRnJpZGF5IDM6NDUgUE0NClRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEJlcnRoZSwgQWJkb3VsYXllIDxBYmRvdWxheWUu
QmVydGhlQGFtZC5jb20+OyBMaXUsIFpoYW4gPFpoYW4uTGl1QGFtZC5jb20+OyBMaSwgUm9tYW4g
PFJvbWFuLkxpQGFtZC5jb20+OyBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5j
b20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBMYWto
YSwgQmhhd2FucHJlZXQgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFU
Q0hdIGRybS9hbWQvaW5jbHVkZTogYWRkIGF1eCB0aW1lb3V0IHZlZ2EgcmVnaXN0ZXJzDQoNCkZy
b206IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPg0KDQpEQyBuZWVkcyB0aGVtIHRvIHN1cHBv
cnQgY29uZmlndXJhYmxlIGF1eCB0aW1lb3V0IG9uIHZlZ2ENCg0KU2lnbmVkLW9mZi1ieTogUm9t
YW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvYXNpY19yZWcvZGNlL2RjZV8xMl8wX3NoX21hc2suaCB8IDQgKysrKw0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzEyXzBfc2hfbWFzay5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2FzaWNfcmVnL2RjZS9kY2VfMTJfMF9zaF9tYXNrLmgNCmluZGV4IGJjZDE5
MGEuLjgzMmQ3YjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNp
Y19yZWcvZGNlL2RjZV8xMl8wX3NoX21hc2suaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2FzaWNfcmVnL2RjZS9kY2VfMTJfMF9zaF9tYXNrLmgNCkBAIC0zNTU0OSw3ICszNTU0
OSwxMSBAQA0KICNkZWZpbmUgRFBfQVVYMF9BVVhfRFBIWV9SWF9DT05UUk9MMF9fQVVYX1JYX0RF
VEVDVElPTl9USFJFU0hPTERfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHg3MDAwMDAwMEwNCiAvL0RQX0FVWDBfQVVYX0RQSFlfUlhfQ09OVFJPTDENCiAjZGVm
aW5lIERQX0FVWDBfQVVYX0RQSFlfUlhfQ09OVFJPTDFfX0FVWF9SWF9QUkVDSEFSR0VfU0tJUF9f
U0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MA0KKyNk
ZWZpbmUgRFBfQVVYMF9BVVhfRFBIWV9SWF9DT05UUk9MMV9fQVVYX1JYX1RJTUVPVVRfTEVOX19T
SElGVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg4DQor
I2RlZmluZSBEUF9BVVgwX0FVWF9EUEhZX1JYX0NPTlRST0wxX19BVVhfUlhfVElNRU9VVF9MRU5f
TVVMX19TSElGVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGYN
CiAjZGVmaW5lIERQX0FVWDBfQVVYX0RQSFlfUlhfQ09OVFJPTDFfX0FVWF9SWF9QUkVDSEFSR0Vf
U0tJUF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4
MDAwMDAwRkZMDQorI2RlZmluZSBEUF9BVVgwX0FVWF9EUEhZX1JYX0NPTlRST0wxX19BVVhfUlhf
VElNRU9VVF9MRU5fTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAweDAwMDA3RjAwTA0KKyNkZWZpbmUgRFBfQVVYMF9BVVhfRFBIWV9SWF9DT05UUk9M
MV9fQVVYX1JYX1RJTUVPVVRfTEVOX01VTF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMHgwMDAxODAwMEwNCiAvL0RQX0FVWDBfQVVYX0RQSFlfVFhfU1RB
VFVTDQogI2RlZmluZSBEUF9BVVgwX0FVWF9EUEhZX1RYX1NUQVRVU19fQVVYX1RYX0FDVElWRV9f
U0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweDANCiAjZGVmaW5lIERQX0FVWDBfQVVYX0RQSFlfVFhfU1RBVFVTX19BVVhfVFhfU1RBVEVf
X1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4NA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
