Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058248633
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 16:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D94E890A5;
	Mon, 17 Jun 2019 14:55:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820074.outbound.protection.outlook.com [40.107.82.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A99890A5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 14:55:51 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Mon, 17 Jun 2019 14:55:48 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332%7]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 14:55:48 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
Thread-Topic: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
Thread-Index: AQHVJRtINCXoZMZ3kUmyU/RChnTlRaaf7zzA
Date: Mon, 17 Jun 2019 14:55:48 +0000
Message-ID: <BN6PR12MB1618E1A9E81348998A17932085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190617144500.29491-1-alexander.deucher@amd.com>
In-Reply-To: <20190617144500.29491-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:9d6f:eb5c:5991:9000]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00e33dda-ae30-45f8-3c52-08d6f333e289
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1618; 
x-ms-traffictypediagnostic: BN6PR12MB1618:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB16188700952D6E8FB814636485EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(366004)(376002)(189003)(199004)(13464003)(4326008)(486006)(66446008)(229853002)(14454004)(71200400001)(74316002)(66946007)(73956011)(11346002)(81166006)(81156014)(476003)(7736002)(305945005)(6246003)(8936002)(446003)(6436002)(33656002)(53936002)(25786009)(55016002)(76116006)(66476007)(66556008)(64756008)(8676002)(46003)(86362001)(2906002)(72206003)(5660300002)(6116002)(9686003)(14444005)(256004)(6306002)(99286004)(53546011)(316002)(478600001)(186003)(52536014)(102836004)(7696005)(110136005)(2501003)(76176011)(68736007)(71190400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1618;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PkKK730fxZ69ib4T/obXBvNzvg+V6Z0WK8fkJV7quRW1K9X3G4AsIpAgFDVFqmtdoSsodTcvfFwYEILdVy6CpViB13vY04qcZ42uvujUQqQ+QkIhvLtqox3SupadI3BEBBS+/I/efXvdFCfoDAiHksswEKWawMEm8inPCY7EYLNfpKWlXxHhYOupeOpslKq+XfD3NMZFS/56ThMCkj69vaNKLdrVu0C1ZtQdSMTHwJUn1YzDI1ysGHPb5laFZgAQzu8tLHwrjvsAzTDTjTkhZ87DX6IB/kIpQnSXF07/8YfrH7GhRCeuNy9uy4yho6A8J+mHNN6U1Lfbc1jXEXftO9NDd6kHFUxY4iD0Vq8dPZHMzaBF9KGp/T0RBqApZS12qA3maS7m+H4UJwX1+TBsvPm2vpJEQaL0S5wk3UqYd/o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e33dda-ae30-45f8-3c52-08d6f333e289
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 14:55:48.6508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1618
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we6hHGauU+g1GyLRqk18//nOeJkLX2wmllZXLSFm+CM=;
 b=SWJ1CXCTxakNdYjXqC853m/UKveK2A0e9k50gF2D3rtIdV9tYCqlVYF/2iORUc+u/9wmN1aEw54tdXvABspBznS7IrZdmiF+GCVPQ1JaU8OlKsNFvZfEnU+PhLTChynZlFq4Q1E7yt+z1WfDVonyl8ZOgrd2suPjz4vPfE4EjIo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEFsZXgsIEkgYW0gdGVzdGluZyBpdCBvdXQgbm93Lg0KDQogS2VudA0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXggRGV1Y2hlcg0KU2VudDogTW9uZGF5
LCBKdW5lIDE3LCAyMDE5IDEwOjQ1IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHdhaXQgdG8gZmV0Y2ggdGhlIHZiaW9zIHVudGls
IGFmdGVyIGNvbW1vbiBpbml0DQoNCldlIG5lZWQgdGhlIGFzaWNfZnVuY3Mgc2V0IGZvciB0aGUg
Z2V0IHJvbSBjYWxsYmFja3MgaW4gc29tZSBjYXNlcy4NCg0KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KaW5kZXggNGE4MzZkYjEw
MDBmLi5lMjYzMDNiYzU2N2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYw0KQEAgLTE1MzQsMTcgKzE1MzQsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZp
Y2VfaXBfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJaWYgKGFtZGdw
dV9zcmlvdl92ZihhZGV2KSkNCiAJCWFkZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9N
QVNLOw0KIA0KLQkvKiBSZWFkIEJJT1MgKi8NCi0JaWYgKCFhbWRncHVfZ2V0X2Jpb3MoYWRldikp
DQotCQlyZXR1cm4gLUVJTlZBTDsNCi0NCi0JciA9IGFtZGdwdV9hdG9tYmlvc19pbml0KGFkZXYp
Ow0KLQlpZiAocikgew0KLQkJZGV2X2VycihhZGV2LT5kZXYsICJhbWRncHVfYXRvbWJpb3NfaW5p
dCBmYWlsZWRcbiIpOw0KLQkJYW1kZ3B1X3ZmX2Vycm9yX3B1dChhZGV2LCBBTURHSU1fRVJST1Jf
VkZfQVRPTUJJT1NfSU5JVF9GQUlMLCAwLCAwKTsNCi0JCXJldHVybiByOw0KLQl9DQotDQogCWZv
ciAoaSA9IDA7IGkgPCBhZGV2LT5udW1faXBfYmxvY2tzOyBpKyspIHsNCiAJCWlmICgoYW1kZ3B1
X2lwX2Jsb2NrX21hc2sgJiAoMSA8PCBpKSkgPT0gMCkgew0KIAkJCURSTV9FUlJPUigiZGlzYWJs
ZWQgaXAgYmxvY2s6ICVkIDwlcz5cbiIsIEBAIC0xNTY2LDYgKzE1NTUsMTkgQEAgc3RhdGljIGlu
dCBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQogCQkJCWFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMudmFsaWQgPSB0cnVlOw0KIAkJCX0NCiAJ
CX0NCisJCS8qIGdldCB0aGUgdmJpb3MgYWZ0ZXIgdGhlIGFzaWNfZnVuY3MgYXJlIHNldCB1cCAq
Lw0KKwkJaWYgKGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT50eXBlID09IEFNRF9JUF9CTE9D
S19UWVBFX0NPTU1PTikgew0KKwkJCS8qIFJlYWQgQklPUyAqLw0KKwkJCWlmICghYW1kZ3B1X2dl
dF9iaW9zKGFkZXYpKQ0KKwkJCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJCQlyID0gYW1kZ3B1X2F0
b21iaW9zX2luaXQoYWRldik7DQorCQkJaWYgKHIpIHsNCisJCQkJZGV2X2VycihhZGV2LT5kZXYs
ICJhbWRncHVfYXRvbWJpb3NfaW5pdCBmYWlsZWRcbiIpOw0KKwkJCQlhbWRncHVfdmZfZXJyb3Jf
cHV0KGFkZXYsIEFNREdJTV9FUlJPUl9WRl9BVE9NQklPU19JTklUX0ZBSUwsIDAsIDApOw0KKwkJ
CQlyZXR1cm4gcjsNCisJCQl9DQorCQl9DQogCX0NCiANCiAJYWRldi0+Y2dfZmxhZ3MgJj0gYW1k
Z3B1X2NnX21hc2s7DQotLQ0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
