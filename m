Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43887AD110
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 00:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA55C894C9;
	Sun,  8 Sep 2019 22:40:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800052.outbound.protection.outlook.com [40.107.80.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B79894C9
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Sep 2019 22:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8KrIH4LKJnBjKw/kWGlYjYqafBv+HflShVmDxBzFEgyTcyJ9Wbw4dCkxyHsTRFmfjM2d5seSEH91/BH7b1p6ujeVEyRP3+xxxEoecmCc6q62/JCS3s6ph5N0CdnplH64VfBOLQpzizXyWycIaLzeaPqf0bdyzlWqKTqgGi7pTgYk6buWKbdue2Y0m7OvMhiCRxr6vP8NsqHmsusGxeV5fDNgc8iJAeeNbN4mJKDfhNPK/Wai/rEZX9MHHm+P5xuUpdNpVdytRKs8KIdOKHL3tR684ulyEpCkBZo2eX+5hdIo6wR44KYjgyEeJLMEd6ZaGy8gbO2LIjRpwiqQXGhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j65KC/S8v6zEdcBMrFARqEP/fSfXoawykbA9nBHtpaA=;
 b=QtnkMy88SdV/OeY9mO9k0NjqqRgiAEUW4JliKoyPgVvcB4JjV0RoyDylW3++DlE/hTDnVga1lNJkpQddZ28RyktLn++EvwvNfKJLxwdHUzaPfl4BmdogrD1ilAh0MM6ew8Hzt/xd+s2+xTFjAlZXBWGJv4MFW9+dlBK9u9M4ueL/ew+4ArTSvBMV9B9kgOcfLf5yu+xnVzcB+zYnggy10UUzPhJxBEBiV98VdKshW0UukC/WIbi/Rn684pkGoduZWuwb8JxqBWDG0wna1NjQEYIzw4sDDH3lvbuWJyyfK2k1YQEWYGTuU0A0tNxUfi2g90msOFSJ5HD77ugrIjhhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1424.namprd12.prod.outlook.com (10.169.206.135) by
 MWHPR12MB1200.namprd12.prod.outlook.com (10.169.201.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sun, 8 Sep 2019 22:40:25 +0000
Received: from MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2]) by MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2%10]) with mapi id 15.20.2241.018; Sun, 8 Sep 2019
 22:40:25 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Index: AQHVZJGMpZCKe3I0uk2UMMuuD8uPeaciXkqQgAAEQZA=
Date: Sun, 8 Sep 2019 22:40:25 +0000
Message-ID: <MWHPR12MB1424CE4253553B5228629D15FCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
 <20190906090011.20271-3-tao.zhou1@amd.com>
 <MWHPR12MB14245D0D195BBF11C91D6BDEFCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB14245D0D195BBF11C91D6BDEFCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd0fde73-fa0c-4c7f-84c8-08d734ad8aa5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1200; 
x-ms-traffictypediagnostic: MWHPR12MB1200:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB12005C0BACE47A3E994421E0FCB40@MWHPR12MB1200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0154C61618
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(13464003)(199004)(189003)(76116006)(186003)(53936002)(9686003)(7736002)(446003)(11346002)(6306002)(71200400001)(71190400001)(55016002)(33656002)(229853002)(74316002)(486006)(8676002)(476003)(6436002)(6246003)(305945005)(966005)(52536014)(99286004)(2906002)(86362001)(76176011)(14454004)(66946007)(2501003)(66476007)(66556008)(66066001)(6636002)(6116002)(8936002)(3846002)(66446008)(64756008)(102836004)(25786009)(26005)(81156014)(110136005)(6506007)(2940100002)(5660300002)(478600001)(256004)(81166006)(316002)(53546011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1200;
 H:MWHPR12MB1424.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MutV0lxK8ngSznwA2rdMVkUyHQKPQVLjuFZdlRv4Gf3m/IDnQjMgEGNN7oDXiDODN3EqE2U9eOvk/ixSvjiOHDcluPjZdM1KtG4HEDxIZDKBxDVQ1aQRH3vcHp3giaI1RMd5nrRSowNLuHhXUHvM9qd/ba3YwGlwtAJd7l53yJMgeZeXUPajloFP4PR8SNXfBbj8OEPciBXB7P3hlXKNo0Qcqbc83pXPfiu4LHjCKb9Qyv18SZb/KmtDVVdNyKmPGMYKktwPQo2GAQPsQMUOu5LSz+dMX7/L0T2/raUCBdU8WYWhm+a3IvzyUnUkiW6ctjLb/NLw6FdmephZKzqwyMMO1lTKrm21XhXszogvSM7cLmisRd05h2TCxrf77YZtA38uEzXZ1VbiN8wMuV/tGbzdOIZLsDNDm+fzrFTjCxM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0fde73-fa0c-4c7f-84c8-08d734ad8aa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2019 22:40:25.4415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0vTcN5Yw8qCGJr0uJqCYLDqNIolD/nQKja9Wt62ISGBb7N6dk/HwHjZMnzXsxB63hjFX+EJCje6Wp9pnqcm4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j65KC/S8v6zEdcBMrFARqEP/fSfXoawykbA9nBHtpaA=;
 b=4BXLWElzpYmLQ8nKjvO5He6dasRYaxo15XbStTzbyrX9Glxa8uTxTnD+jC6xgo9c9UD9iPl2z+wbm23U0lLcEIciMAzSa5IxQ+raazzPSBPX3SmF12UNM6DsDn9SdFDDMMkI3pyqGXWWHDqNHeIJTd3xPYBYqd7ZL+KAynMCKqU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

TmV2ZXIgbWluZC4gSSB3YXMgY29uZnVzZWQgYnkgdGhlIG5hbWUgInJhc19hc2ljX2luaXQiLiBU
aGUgcHJvZ3JhbW1pbmcgc2VxdWVuY2UgaXMgZXhhY3RseSB3aGF0IHdlIGRpc2N1c3NlZCBiZWZv
cmUuIEkgdGhpbmsgd2UgY2FuIHJlbmFtZSB0aGlzIGZ1bmN0aW9uIHRvICJlcnJfY250X2luaXQi
Lg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBaaGFuZywgSGF3a2luZw0KU2VudDogMjAxOeW5tDnmnIg55pelIDY6MjMNClRvOiBaaG91
MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENI
IDMvM10gZHJtL2FtZGdwdTogcmVuYW1lIHVtYyByYXNfaW5pdCB0byByYXNfYXNpY19pbml0DQoN
ClRoZSByYXMgaW5pdCAob3IgdGhlIG5ldyBhc2ljX2luaXQpIHNlZW1zIG5vdCBuZWNlc3Nhcnkg
YXMgbGFzdCB0aW1lIHdlIGRpc2N1c3NlZC4gQW55IFVNQyBSQVMgcmVnaXN0ZXIgaW5pdGlhbGl6
YXRpb24gaXMgc2FmZSBlbm91Z2ggdG8gYmUgY2VudHJhbGl6ZWQgdG8gcmFzX2xhdGVfaW5pdCBp
bnRlcmZhY2UuIEkgd291bGQgc3VnZ2VzdCB0byByZWR1Y2Ugc3VjaCBraW5kIG9mIHVuLW5lY2Vz
c2FyeSBpbnRlcmZhY2UuDQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+IA0KU2VudDogMjAx
OeW5tDnmnIg25pelIDE3OjAxDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpo
YW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1
bi5DaGVuQGFtZC5jb20+DQpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQpTdWJq
ZWN0OiBbUEFUQ0ggMy8zXSBkcm0vYW1kZ3B1OiByZW5hbWUgdW1jIHJhc19pbml0IHRvIHJhc19h
c2ljX2luaXQNCg0KdGhpcyBpbnRlcmZhY2UgaXMgcmVsYXRlZCB0byBzcGVjaWZpYyB2ZXJzaW9u
IG9mIHVtYywgZGlzdGluZ3Vpc2ggaXQgZnJvbSByYXNfbGF0ZV9pbml0DQoNClNpZ25lZC1vZmYt
Ynk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91bWMuYyB8IDQgKystLSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5oIHwgMiArLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192
Nl8xLmMgICB8IDIgKy0NCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91bWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYw0KaW5kZXgg
NTY4M2M1MTcxMGFhLi5iMWM3ZjY0M2YxOTggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdW1jLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91bWMuYw0KQEAgLTYzLDggKzYzLDggQEAgaW50IGFtZGdwdV91bWNfcmFzX2xhdGVf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pDQogCX0N
CiANCiAJLyogcmFzIGluaXQgb2Ygc3BlY2lmaWMgdW1jIHZlcnNpb24gKi8NCi0JaWYgKGFkZXYt
PnVtYy5mdW5jcyAmJiBhZGV2LT51bWMuZnVuY3MtPnJhc19pbml0KQ0KLQkJYWRldi0+dW1jLmZ1
bmNzLT5yYXNfaW5pdChhZGV2KTsNCisJaWYgKGFkZXYtPnVtYy5mdW5jcyAmJiBhZGV2LT51bWMu
ZnVuY3MtPnJhc19hc2ljX2luaXQpDQorCQlhZGV2LT51bWMuZnVuY3MtPnJhc19hc2ljX2luaXQo
YWRldik7DQogDQogCXJldHVybiAwOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91bWMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91bWMuaA0KaW5kZXggNmYyMmM5NzA0NTU1Li5hNWU0ZGYyNDQwYmUgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaA0KQEAgLTU0LDcgKzU0LDcgQEANCiAJYWRldi0+
dW1jLmZ1bmNzLT5kaXNhYmxlX3VtY19pbmRleF9tb2RlKGFkZXYpOw0KIA0KIHN0cnVjdCBhbWRn
cHVfdW1jX2Z1bmNzIHsNCi0Jdm9pZCAoKnJhc19pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7DQorCXZvaWQgKCpyYXNfYXNpY19pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7DQogCWludCAoKnJhc19sYXRlX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB2
b2lkICpyYXNfaWhfaW5mbyk7DQogCXZvaWQgKCpxdWVyeV9yYXNfZXJyb3JfY291bnQpKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJCQkJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyk7DQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMNCmluZGV4IDRjZGI1YzA0Y2QxNy4uOTJm
M2IxNDhlMTgxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2
XzEuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYw0KQEAgLTI3
Miw3ICsyNzIsNyBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikgIH0NCiANCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB1bWNf
djZfMV9mdW5jcyA9IHsNCi0JLnJhc19pbml0ID0gdW1jX3Y2XzFfcmFzX2luaXQsDQorCS5yYXNf
YXNpY19pbml0ID0gdW1jX3Y2XzFfcmFzX2luaXQsDQogCS5yYXNfbGF0ZV9pbml0ID0gYW1kZ3B1
X3VtY19yYXNfbGF0ZV9pbml0LA0KIAkucXVlcnlfcmFzX2Vycm9yX2NvdW50ID0gdW1jX3Y2XzFf
cXVlcnlfcmFzX2Vycm9yX2NvdW50LA0KIAkucXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MgPSB1bWNf
djZfMV9xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcywNCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0
DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
