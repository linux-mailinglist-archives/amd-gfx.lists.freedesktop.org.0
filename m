Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C00AD109
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 00:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA13895B4;
	Sun,  8 Sep 2019 22:23:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65B895B4
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Sep 2019 22:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts5yFNuX/Z5ZF9KzNxGq4SXDkGmi6ObHFXp/ovMbmMdYLd8zvw6gY/yK06LrdkNxcpp/fUx9bZwdIuavujSNL28jOu+UwTC0t9MGfVCuBVruWVsmEAbBTALyuzXlmMTeQDdJyThu8F5BhRwBAlHEcVFwLPXQ1Thru3pUtRaUov772O61kQJuu9UIoQzJiOKnxdKGlz30FLawfAdSL9w8QKfGccMaexsTY7TCrTbUumMZkVGyI3TM9RZf25hpL5eBPeMAlYFtfDgxTwme0TvuJNVhe0N2q+pZTYpsqCHj0mC22X4XTWZMHCJniUdj20uC840JU79vLcRtianVLuS/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LUKQdRzA6xE6/y8DKKiS3j+enI0fNim/yb4x6Qf/bg=;
 b=IPFX039f5aI4Q1sPc0YKz9hTeBYIc2ykwz98Z1aQJCxtDPdZsRkqJl6NUmit5p/t1QWli6aviNSxVFzTbkvxCnVh8vNKGXWux5XO/YWlJBymuLZn1l5rYHyVBRRIHosyUNY7dZnGIEXg72zZZxSdF0IjsccdFM1EKTjMtDYv+4EyvJcVtTADJaTpzf1igeJtqNq9h6560am1Vj90uF7aRqbKL3YnojNhjEHNg9tqo1m2QuWLFMzjBnmYqSEtQ5xym/njoX95rg4gLRJqu3gEFvJpvg/ZnDDNlf3/hfvrl7yNqUSCaSdOww+G4iYgwOb933t84hPLUr8igm4dDa9YXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1424.namprd12.prod.outlook.com (10.169.206.135) by
 MWHPR12MB1167.namprd12.prod.outlook.com (10.169.201.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sun, 8 Sep 2019 22:23:22 +0000
Received: from MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2]) by MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2%10]) with mapi id 15.20.2241.018; Sun, 8 Sep 2019
 22:23:22 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Index: AQHVZJGMpZCKe3I0uk2UMMuuD8uPeaciXkqQ
Date: Sun, 8 Sep 2019 22:23:22 +0000
Message-ID: <MWHPR12MB14245D0D195BBF11C91D6BDEFCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
 <20190906090011.20271-3-tao.zhou1@amd.com>
In-Reply-To: <20190906090011.20271-3-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce98acd9-4841-4082-c25a-08d734ab28f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1167; 
x-ms-traffictypediagnostic: MWHPR12MB1167:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB116702DB905B307326367FB5FCB40@MWHPR12MB1167.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0154C61618
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(13464003)(189003)(199004)(6246003)(8676002)(76116006)(81166006)(81156014)(2501003)(110136005)(256004)(3846002)(305945005)(6116002)(316002)(478600001)(76176011)(7696005)(74316002)(14454004)(33656002)(7736002)(2906002)(229853002)(99286004)(5660300002)(6436002)(52536014)(86362001)(66446008)(55016002)(102836004)(66556008)(66476007)(6636002)(25786009)(53546011)(6506007)(64756008)(9686003)(186003)(446003)(26005)(66066001)(486006)(53936002)(66946007)(11346002)(8936002)(476003)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1167;
 H:MWHPR12MB1424.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 72XSva/4kT59CjXZRBB0y/BTwJBSWUd5K+PLdfYV5alPln7SBLleFlMnnHUAdaWsDV3qdwcH7m5WiA66ThUlW7Zm8Ye2yFy+0QS+9glEIKqxDZ1wM+IMeKus2FYohkMST/ByuAkk1XkhUd37IeUmI6qaJ5Ri1PZ4VD3CP3puRJEKbK6+0mnls8wr5oHyjJyxMedbF60oJO8w6au3/bOumkMaqb44vlZQriQPaPWJCedCYiXq+ps+c3jIlBL4NmXFad8Z8AqUoqTTQ3bKlvYKQPOVTgtnOwBYd0APpEEaN5cJY9idmHFfnNFJNA+1aLDpdqij7er4RckcrHIl+NBPkmgmQXQ8cYKsMoTqDsuTVZllstGZaMICJtLgzVGvEw/4xh1YmFUbBZ2A9h+L1vm6Zy/l1W1DNOSCDYuU+yhT+B4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce98acd9-4841-4082-c25a-08d734ab28f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2019 22:23:22.5389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fmlbBLjlPluN9u1/H3X0MX+vRJLp5mlM9oQmSGkXGGgsEza6VZ8n1yJQTRIYyiULOwmlDaumSUufHL+9uPGGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LUKQdRzA6xE6/y8DKKiS3j+enI0fNim/yb4x6Qf/bg=;
 b=RL35Feb3IPrzuUDs4n3Au5ngxByJVaV4EWnh2hOLUWhIPgwxl2sS1AXaGiCxl1/pPE7dan6eP6V0+C4nzLMJ9xsXpeB0sCtFAhUuQ7Q81UtHHFY5IjNNDBxd9HL+3zU9XHaULsOkTEkXKmHFB2TkEcLGDhVkJ388lfipZGkxe8w=
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

VGhlIHJhcyBpbml0IChvciB0aGUgbmV3IGFzaWNfaW5pdCkgc2VlbXMgbm90IG5lY2Vzc2FyeSBh
cyBsYXN0IHRpbWUgd2UgZGlzY3Vzc2VkLiBBbnkgVU1DIFJBUyByZWdpc3RlciBpbml0aWFsaXph
dGlvbiBpcyBzYWZlIGVub3VnaCB0byBiZSBjZW50cmFsaXplZCB0byByYXNfbGF0ZV9pbml0IGlu
dGVyZmFjZS4gSSB3b3VsZCBzdWdnZXN0IHRvIHJlZHVjZSBzdWNoIGtpbmQgb2YgdW4tbmVjZXNz
YXJ5IGludGVyZmFjZS4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4gDQpTZW50OiAyMDE5
5bm0OeaciDbml6UgMTc6MDENClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IENoZW4sIEd1Y2h1biA8R3VjaHVu
LkNoZW5AYW1kLmNvbT4NCkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NClN1Ympl
Y3Q6IFtQQVRDSCAzLzNdIGRybS9hbWRncHU6IHJlbmFtZSB1bWMgcmFzX2luaXQgdG8gcmFzX2Fz
aWNfaW5pdA0KDQp0aGlzIGludGVyZmFjZSBpcyByZWxhdGVkIHRvIHNwZWNpZmljIHZlcnNpb24g
b2YgdW1jLCBkaXN0aW5ndWlzaCBpdCBmcm9tIHJhc19sYXRlX2luaXQNCg0KU2lnbmVkLW9mZi1i
eTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3VtYy5jIHwgNCArKy0tICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdW1jLmggfCAyICstDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2
XzEuYyAgIHwgMiArLQ0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQppbmRleCA1
NjgzYzUxNzEwYWEuLmIxYzdmNjQzZjE5OCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91bWMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5jDQpAQCAtNjMsOCArNjMsOCBAQCBpbnQgYW1kZ3B1X3VtY19yYXNfbGF0ZV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbykNCiAJfQ0K
IA0KIAkvKiByYXMgaW5pdCBvZiBzcGVjaWZpYyB1bWMgdmVyc2lvbiAqLw0KLQlpZiAoYWRldi0+
dW1jLmZ1bmNzICYmIGFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQpDQotCQlhZGV2LT51bWMuZnVu
Y3MtPnJhc19pbml0KGFkZXYpOw0KKwlpZiAoYWRldi0+dW1jLmZ1bmNzICYmIGFkZXYtPnVtYy5m
dW5jcy0+cmFzX2FzaWNfaW5pdCkNCisJCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2FzaWNfaW5pdChh
ZGV2KTsNCiANCiAJcmV0dXJuIDA7DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5oDQppbmRleCA2ZjIyYzk3MDQ1NTUuLmE1ZTRkZjI0NDBiZSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaA0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQpAQCAtNTQsNyArNTQsNyBAQA0KIAlhZGV2LT51
bWMuZnVuY3MtPmRpc2FibGVfdW1jX2luZGV4X21vZGUoYWRldik7DQogDQogc3RydWN0IGFtZGdw
dV91bWNfZnVuY3Mgew0KLQl2b2lkICgqcmFzX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsNCisJdm9pZCAoKnJhc19hc2ljX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsNCiAJaW50ICgqcmFzX2xhdGVfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHZv
aWQgKnJhc19paF9pbmZvKTsNCiAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkJCQl2b2lkICpyYXNfZXJyb3Jfc3RhdHVzKTsNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYw0KaW5kZXggNGNkYjVjMDRjZDE3Li45MmYz
YjE0OGUxODEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZf
MS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jDQpAQCAtMjcy
LDcgKzI3Miw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KSAgfQ0KIA0KIGNvbnN0IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHVtY192
Nl8xX2Z1bmNzID0gew0KLQkucmFzX2luaXQgPSB1bWNfdjZfMV9yYXNfaW5pdCwNCisJLnJhc19h
c2ljX2luaXQgPSB1bWNfdjZfMV9yYXNfaW5pdCwNCiAJLnJhc19sYXRlX2luaXQgPSBhbWRncHVf
dW1jX3Jhc19sYXRlX2luaXQsDQogCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSB1bWNfdjZfMV9x
dWVyeV9yYXNfZXJyb3JfY291bnQsDQogCS5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyA9IHVtY192
Nl8xX3F1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzLA0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
