Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9128103F
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 04:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644EF89DBA;
	Mon,  5 Aug 2019 02:20:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E81689DBA
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 02:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guUGokC06n2jGwRodcWDLXoJ8raGq/sqHa1MHOgRFcI5vu8iPl4rZtg50zDMHeRXW4m033cZ5Tz643c+QGue9TUyKelhX3WnpBucCLOqV66DpGZ4n0FBaoZ+KRw0NQsuXiqe7hmFiDfyKjHHQapmRs3JWO34W/33oTVwdmSX4lfjnRQfAbiBRH1Per3rfrZzjLShuH61o87oG8Pac1snyeilFSCFLlfunMaHjTtpBjk++ArmoJflKe/WLI9gNwRDs7x7laV4EfRaBBJCIHfDpRsyLJHtCzRksIwFITAf8mJJpyzAg/dwZW+WmFqIRA+e8kkPVCQa/Pr9dp1mrt78dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH9mhT+scrPs9iIV0ZdZ79ukMPkj7xgo/GjB2gnlObY=;
 b=DaQSztXPwP89rDhV8n4E4duk7mautFtuNxB9tMeVlQ+UYwZWlqm05C0kAk8QvHqL5VvJ6fOCOQt7PW67esX8ye6r7ZRadLOYj/LzvDrugvXm0ZWZSEBUoa1yn4yGdwltbk6iqvc/hiaxR9Fl5bO0XcEHWOgxsTy0Fk1p3loeyVmZPBwSO6xDYTLBoOmBlFJa1G+3OFpMj17pSjasyqQGVFjlpI5XE1nnKZ6O2BEDqusR/ie4EQHt0+6uIsNoN3FbzUVxuPmmMD9C5vCZx6xmpHFkXsN6P+MjGm+kh4MbQjZuDEqM9GoLZB7I2ACrKu7DsqKcpSMcfJJ0d083VIhW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4118.namprd12.prod.outlook.com (20.180.5.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 02:20:00 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 02:20:00 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Gao, Likun" <Likun.Gao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: pin the csb buffer on hw init for gfx v8
Thread-Topic: [PATCH] drm/amdgpu: pin the csb buffer on hw init for gfx v8
Thread-Index: AQHVSzKFqsu9j1YQo0GpBXYpt7YEqabr0hNg
Date: Mon, 5 Aug 2019 02:19:59 +0000
Message-ID: <CH2PR12MB3767F6605AC1A097D9D5586DFEDA0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1564970809-31487-1-git-send-email-likun.gao@amd.com>
In-Reply-To: <1564970809-31487-1-git-send-email-likun.gao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2ac0fec-f64c-4e85-08c5-08d7194b6ae1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4118; 
x-ms-traffictypediagnostic: CH2PR12MB4118:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB4118B6EDF802400592A5D0F8FEDA0@CH2PR12MB4118.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(13464003)(189003)(199004)(186003)(33656002)(81166006)(81156014)(8676002)(2501003)(14454004)(3846002)(966005)(6116002)(305945005)(7736002)(6436002)(5660300002)(4326008)(52536014)(68736007)(478600001)(66946007)(229853002)(66476007)(66066001)(55016002)(66446008)(64756008)(66556008)(6306002)(9686003)(6246003)(8936002)(7696005)(25786009)(53936002)(71200400001)(71190400001)(2906002)(316002)(76176011)(110136005)(26005)(74316002)(54906003)(476003)(102836004)(11346002)(76116006)(446003)(86362001)(256004)(53546011)(486006)(99286004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4118;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0PN21cHLxADAGJfkQnELUCz8xMJT2ELSW1nIzw1b0iJ9X5qZWZFmKbvi66eVMQwgGdSx9gkKSTvC9eVkEYwIxlpmxmJcmv3UvAgSsmoxzeaj4omUTtNkQfPPkdj2SzAEbTXcyD3p+ed4yGFKCjfyeKR9v9CA5frjCRkhiyvuDhcU0FPeqja2NkysbZ3sZvawTplZj9DVs7vM3mngv6cgsgL5w4M309rM1kRkiYP/5EXjayHKUxYsj9IkDKGDSAGQQgcBXuFmWjqLBC+l955A3UwTsWdmvNQW1RXKsyp2xJndUEt6qkbAirj5pl4NTms2CGpyI6pkmxWHAXnmp24NjKmyOejxyqdrjaHC+fpSgPGQSEO5MZ5Pnaa3VghzxrkXZ4Lr37r6qhYLLXX73P2hTrnV5JsYE6pk6J9/v2jjn+8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ac0fec-f64c-4e85-08c5-08d7194b6ae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 02:19:59.9520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH9mhT+scrPs9iIV0ZdZ79ukMPkj7xgo/GjB2gnlObY=;
 b=RJ/qhtSVnUd0n3NCnn7+Fty2VbacMOTC2GM2AYBnFZAnC7MLAnqmASfdg9Sao1j0eI17QXgVaC2OMoCSF1PqTCMV9UAsmtgAl6YdaST9pfJW2Sfv9IZwBcBPVx8ehcd1QmBaV1A5OeVOnlM5mENT25IPc/GeVfWIXxukuf/6MUU=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Gao,
 Likun" <Likun.Gao@amd.com>, Paul Gover <pmw.gover@yahoo.co.uk>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR2FvIExpa3VuDQpTZW50OiBNb25kYXksIEF1Z3Vz
dCA1LCAyMDE5IDEwOjA3IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBHYW8sIExp
a3VuIDxMaWt1bi5HYW9AYW1kLmNvbT47IFBhdWwgR292ZXIgPHBtdy5nb3ZlckB5YWhvby5jby51
az47IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBwaW4gdGhlIGNzYiBidWZmZXIgb24gaHcgaW5pdCBmb3IgZ2Z4IHY4DQoN
CkZyb206IExpa3VuIEdhbyA8TGlrdW4uR2FvQGFtZC5jb20+DQoNCldpdGhvdXQgdGhpcyBwaW4s
IHRoZSBjc2IgYnVmZmVyIHdpbGwgYmUgZmlsbGVkIHdpdGggaW5jb25zaXN0ZW50IGRhdGEgYWZ0
ZXIgUzMgcmVzdW1lLiBBbmQgdGhhdCB3aWxsIGNhdXNlcyBnZnggaGFuZyBvbiBnZnhvZmYgZXhp
dCBzaW5jZSB0aGlzIGNzYiB3aWxsIGJlIGV4ZWN1dGVkIHRoZW4uDQoNClNpZ25lZC1vZmYtYnk6
IExpa3VuIEdhbyA8TGlrdW4uR2FvQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjhfMC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OF8wLmMNCmluZGV4IGQyOTA3MTguLjk4ZTVhYTggMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQpAQCAtMTMxNyw2ICsxMzE3LDM5IEBAIHN0YXRpYyBp
bnQgZ2Z4X3Y4XzBfcmxjX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCXJldHVy
biAwOw0KIH0NCiANCitzdGF0aWMgaW50IGdmeF92OF8wX2NzYl92cmFtX3BpbihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikgew0KKwlpbnQgcjsNCisNCisJciA9IGFtZGdwdV9ib19yZXNlcnZl
KGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLCBmYWxzZSk7DQorCWlmICh1bmxpa2VseShy
ICE9IDApKQ0KKwkJcmV0dXJuIHI7DQorDQorCXIgPSBhbWRncHVfYm9fcGluKGFkZXYtPmdmeC5y
bGMuY2xlYXJfc3RhdGVfb2JqLA0KKwkJCUFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOw0KKwlpZiAo
IXIpDQorCQlhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dwdV9hZGRyID0NCisJCQlhbWRncHVf
Ym9fZ3B1X29mZnNldChhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7DQorDQorCWFtZGdw
dV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOw0KKw0KKwlyZXR1
cm4gcjsNCit9DQorDQorc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfY3NiX3ZyYW1fdW5waW4oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCisJaW50IHI7DQorDQorCWlmICghYWRldi0+Z2Z4LnJs
Yy5jbGVhcl9zdGF0ZV9vYmopDQorCQlyZXR1cm47DQorDQorCXIgPSBhbWRncHVfYm9fcmVzZXJ2
ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgdHJ1ZSk7DQorCWlmIChsaWtlbHkociA9
PSAwKSkgew0KKwkJYW1kZ3B1X2JvX3VucGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2Jq
KTsNCisJCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmop
Ow0KKwl9DQorfQ0KKw0KIHN0YXRpYyB2b2lkIGdmeF92OF8wX21lY19maW5pKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KSAgew0KIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5t
ZWMuaHBkX2VvcF9vYmosIE5VTEwsIE5VTEwpOyBAQCAtNDc5MSw2ICs0ODI0LDEwIEBAIHN0YXRp
YyBpbnQgZ2Z4X3Y4XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpDQogCWdmeF92OF8wX2luaXRfZ29s
ZGVuX3JlZ2lzdGVycyhhZGV2KTsNCiAJZ2Z4X3Y4XzBfY29uc3RhbnRzX2luaXQoYWRldik7DQog
DQorCXIgPSBnZnhfdjhfMF9jc2JfdnJhbV9waW4oYWRldik7DQorCWlmIChyKQ0KKwkJcmV0dXJu
IHI7DQorDQogCXIgPSBhZGV2LT5nZngucmxjLmZ1bmNzLT5yZXN1bWUoYWRldik7DQogCWlmIChy
KQ0KIAkJcmV0dXJuIHI7DQpAQCAtNDkwNyw2ICs0OTQ0LDkgQEAgc3RhdGljIGludCBnZnhfdjhf
MF9od19maW5pKHZvaWQgKmhhbmRsZSkNCiAJZWxzZQ0KIAkJcHJfZXJyKCJybGMgaXMgYnVzeSwg
c2tpcCBoYWx0IHJsY1xuIik7DQogCWFtZGdwdV9nZnhfcmxjX2V4aXRfc2FmZV9tb2RlKGFkZXYp
Ow0KKw0KKwlnZnhfdjhfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsNCisNCiAJcmV0dXJuIDA7DQog
fQ0KIA0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
