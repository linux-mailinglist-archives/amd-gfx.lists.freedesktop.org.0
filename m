Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D5B4C94
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 13:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDA16EBC9;
	Tue, 17 Sep 2019 11:11:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77F6EBC9
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 11:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL/0Z0En+QaNOYQ/urp7BoCvET3fM208Y01DKK4EY14NnVvJ2IX4EusTIYYtfRBvpHDaW8pbpEMGuDmSnBgY38e4Ll0Varnk+hohmEQ/ZQ3hn5ywhDIBdu2lTMKzET5f/8Gmal0o7CSFsX0yLmZHGfNkz3FEJVHnCP2KLFfki0OEZt4bMYIHpNwCcIKGB3+fTqbycna9a8OmTMCmKN7PA9/+QJd1SfDODlnQ08psfhLfdm7GeOEmc1J6V2YxB5c+L0A5J0UcBrKLRFUdLZPvgEGIzEO1pz7jgS1YDOWz8q9JTkjAXwyUL9JsIwBOK7/OGfkIoNQJDwYVkY68kObPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QilRBneVrAVEsx3rOhfC2WPprcHBYJ1cQ09DPdNnsyo=;
 b=ifq1K8bzRBbRGD817qcgfdEZ+LAyAeyN6EqjvkkpRpKgw16NsOhZiJMJr1CkcNTpExWxaAxnPiuytSGiCxvuVKeRJFgJEP4WoGvx9J0gqHVJHLUg/MvQxmIv+unPtpDknHp8eZnOxnbV/zZRYcpTk5k3vZijUZ5nqyecMJC+WsZ+TeV7MstCe3Y8FlPbBk5/s2+YZ/sd871oHxiHD3WYYgOeYyZcbrlvHPLlJeVFQwgHQlsujDtgJDGs5wAxgVO/AbT/6G+4+CXSLRhQNyjAmOqlmYJJfr8w2yUDLuLaf75MdrUhnXVUHeL7VvMGNLPk+qVp70MrXVFzYkPokWtiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3952.namprd12.prod.outlook.com (10.255.238.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Tue, 17 Sep 2019 11:10:58 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 11:10:58 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL
 feature
Thread-Topic: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL
 feature
Thread-Index: AQHVbUe3IQsLZrI63E66gvUQs3E8Wacvtofg
Date: Tue, 17 Sep 2019 11:10:58 +0000
Message-ID: <MN2PR12MB33444F39CA00D4DFC268491EE48F0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190917110431.12559-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190917110431.12559-1-xiaojie.yuan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5547cf7a-8536-4ab3-416d-08d73b5fb7a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3952; 
x-ms-traffictypediagnostic: MN2PR12MB3952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB395238C5FED8F931436E32B2E48F0@MN2PR12MB3952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(13464003)(199004)(189003)(7696005)(2501003)(52536014)(478600001)(5660300002)(66066001)(316002)(8936002)(4326008)(256004)(14454004)(110136005)(11346002)(66556008)(486006)(66446008)(64756008)(66476007)(66946007)(446003)(6246003)(99286004)(229853002)(33656002)(54906003)(81166006)(81156014)(86362001)(25786009)(476003)(76116006)(74316002)(3846002)(6506007)(6116002)(71190400001)(102836004)(7736002)(8676002)(76176011)(9686003)(53546011)(6436002)(71200400001)(305945005)(186003)(2906002)(55016002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3952;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8zyrTgez86mBqFXq19YUuo4T0fM8rjLseGX/8mkCHxPsUmwjEwp2qM9DiuPKQ5yOKYuDthGsaOnPfcJf3zgYiWstuAvU0RgZ2dnlN9O74jZzojY3FNGcMpBnVPr1IIvgzupVpuWmypF1dySZA3KuVgfAo+IeemoMBP5xhY44golkQKrM9G6iOyZyUJodZrV7r4x+w+2E4Dkm2XDsCNU4b/QEuesy5/4UhprCu3rFrvLDvaTCHJIF374B/6pBKmV4xaCltN+k4I/x8iTDAhv8Fk6Ay51P4f6tZB/NDF/k63Ha70vudHvBxxt4a/KvaSKliUQdl7AZBV3fXyzzsbOVv4b5wham7XtwVSu2UKrgeH31KaQ5l77aXbyAGtq5udoIIV0EIK1+FRvNJYfW+k8f0nX3gkf7TXyJx5ypXqptxLY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5547cf7a-8536-4ab3-416d-08d73b5fb7a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 11:10:58.4122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcPFIbCtRynDdhlQkgIqvLzT5P/V5zjjC1lbnHvLFmFL/XjLuhBEovmtkiOz9a4l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QilRBneVrAVEsx3rOhfC2WPprcHBYJ1cQ09DPdNnsyo=;
 b=esI0DE9z6JxwJME6mbDeBe/VQo+TsISt+NQ7KcrItdRC5rsHbOFB4iqxNhIUdK1vQ5sZm5RIjpn3HXLmhSKYvtMNPkQ+7JHra2FSakUTIDZzPaUSYHXWbwBWEK8uwpL2u5HSAqYZ013ApN3QaRTklPfhNR3WT8dX+RdwOdwiWJs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CgotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQpGcm9tOiBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4g
ClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxNywgMjAxOSA3OjA1IFBNClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5j
b20+OyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IFdhbmcsIEtldmluKFlhbmcpIDxL
ZXZpbjEuV2FuZ0BhbWQuY29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS9wb3dlcnBsYXk6IGFkZCBuZXcgbWFwcGluZyBm
b3IgQVBDQ19ERkxMIGZlYXR1cmUKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2pp
ZS55dWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3Nt
dV90eXBlcy5oIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV90eXBlcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV90eXBlcy5oCmluZGV4IGFiOGM5MmE2MGZj
NC4uMTJhMWRlNTVjZTNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211X3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L3NtdV90eXBlcy5oCkBAIC0yNTIsNiArMjUyLDcgQEAgZW51bSBzbXVfY2xrX3R5cGUgewogICAg
ICAgIF9fU01VX0RVTU1ZX01BUChURU1QX0RFUEVOREVOVF9WTUlOKSwgICAgICAgICAgIAlcCiAg
ICAgICAgX19TTVVfRFVNTVlfTUFQKE1NSFVCX1BHKSwgICAgICAgICAgICAgICAgICAgICAgCVwK
ICAgICAgICBfX1NNVV9EVU1NWV9NQVAoQVRIVUJfUEcpLCAgICAgICAgICAgICAgICAgICAgICAJ
XAorICAgICAgIF9fU01VX0RVTU1ZX01BUChBUENDX0RGTEwpLCAgICAgICAgICAgICAgICAgICAg
IAlcCiAgICAgICAgX19TTVVfRFVNTVlfTUFQKFdBRkxfQ0cpLAogCiAjdW5kZWYgX19TTVVfRFVN
TVlfTUFQCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXgg
MTY2MzRlNjU3NTg5Li41YTM0ZDAxZjdmN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKQEAgLTE3Niw2ICsxNzYsNyBAQCBzdGF0aWMgc3RydWN0IHNtdV8x
MV8wX2NtbjJhaXNjX21hcHBpbmcgbmF2aTEwX2ZlYXR1cmVfbWFza19tYXBbU01VX0ZFQVRVUkVf
Q09VTgogCUZFQV9NQVAoVEVNUF9ERVBFTkRFTlRfVk1JTiksCiAJRkVBX01BUChNTUhVQl9QRyks
CiAJRkVBX01BUChBVEhVQl9QRyksCisJRkVBX01BUChBUENDX0RGTEwpLAogfTsKIAogc3RhdGlj
IHN0cnVjdCBzbXVfMTFfMF9jbW4yYWlzY19tYXBwaW5nIG5hdmkxMF90YWJsZV9tYXBbU01VX1RB
QkxFX0NPVU5UXSA9IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
