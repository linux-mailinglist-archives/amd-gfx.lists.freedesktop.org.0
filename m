Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB8A2CE4
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 04:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0303F6E0EF;
	Fri, 30 Aug 2019 02:37:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708D86E0EF
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 02:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbnqfdgR08Iu6+AhUxJMXdIsQgqFGjzf7bQz34eFqBeIlhkwRJ9frxwfLxo9NHtscGcZUeSvsUDOW96HyItuDmmEE6gMQVBAfxD4Tu2umQMLJ799hhyqCZPuI7LKMOkDcvb62lOWJ/jiKfQyG679IryqoQMtdmMRsj42C5ZvD8CDGsSRdg9JlUdyeA/UkdTFTWbVruzTc6AJm2rXyehzKwsJz4lF+Ea6/P8fihVyajKmwfphROLWOdcqL+VX3ZXYZ36I0dSHThXL320g1c070hQna6mygCCLJa+lQJt2xQMeNfh7U+c4+WpKb+fuhOOcQxHAC7P8rVm9dUYhAIdwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S/2CfK2CbYFJvHJsK1lpzmmuYvJaU4rHeAWtnSBMIM=;
 b=EZYCQySjmS9yPNUHRNOGx2rJeq3rluDrClJ3PfdD8GoC7pzuBwl4Fa6dy9GGR7D9qv39YtVly6U7ly5/GP2WB8doviJ5XiJmaWL6AllJNWH7yim9pA45iMppZKpykUwox2tSpIfIvmdk1QaQHUDm9yf96BiCwoxEYumfweEWL2+c68bOy+jDb1ZGnIM5IGz5OWnd4aocaK65nt+h/K3yyYd0QRVjEyW8JJoNejdSMEWjns8cEJPILeXX3xer+FAuQXKYjlwsdjpXgP4K7ZW4XXRp/c8kDaPE2djMhNC6Am60lS5f0+ZxQQ+JQKvIUFT+aKrMfDN5viBkrHRRvsgTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3166.namprd12.prod.outlook.com (20.179.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 02:37:31 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 02:37:31 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function
 (v2)
Thread-Topic: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback
 function (v2)
Thread-Index: AQHVXm4MrHD7VG3UcESW+D8m4Qkn4qcS+l/A
Date: Fri, 30 Aug 2019 02:37:31 +0000
Message-ID: <MN2PR12MB3054DA8327A6435C3CEE7DA6B0BD0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
 <1567085432-27452-5-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567085432-27452-5-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74f02d14-dfa8-4bcb-d12e-08d72cf301ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3166; 
x-ms-traffictypediagnostic: MN2PR12MB3166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31661769FA27920B88E75D01B0BD0@MN2PR12MB3166.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(189003)(13464003)(199004)(26005)(81166006)(52536014)(316002)(6506007)(25786009)(7736002)(7696005)(229853002)(81156014)(2906002)(5660300002)(305945005)(71190400001)(256004)(6636002)(99286004)(76116006)(4326008)(14454004)(66946007)(66476007)(76176011)(66446008)(64756008)(66556008)(3846002)(53936002)(6116002)(102836004)(53546011)(476003)(71200400001)(74316002)(55016002)(6246003)(8936002)(86362001)(66066001)(9686003)(6436002)(446003)(2501003)(110136005)(486006)(8676002)(33656002)(186003)(11346002)(478600001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3166;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZxQoFRO52LBXQUYL5eeN/Qc3tI5kpXCaEeCH3WAe/OYPxS9dOFXoee3dtJLFvCE9AcK81jyc/8NxEOFLQTPHug0VZ6y8wOHJ2DVWNJ281zQGd0zZ1TxDJfzyXpmisE9aTyUTDGu7fzNhYz/SyRdpdBKze/Qh+yV6Mill1SJU5ZneBDfg1b2RweUiyXZhpg/OhSFyz+0hp10BQ9rLNhyeehyV5Ujpbp3QEVlB0enO2vpR9EK6SyRSTU0/Nek0fvnnoGWH5Rdkl3BhacmSRQ5cm5Km1FDESobxW8HuaVxMjrs/vTzOcXKgezyrYG0KnG5qcQT96NDSruXpf4cXQwi8SidSalYnQpWMtw23Kei/qnlPmuE0YlTxrNgJvqUStreVrAOx9/zxMBiB5r9CNZ1te9csLyZohN3RQ+qnLqOwRGE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f02d14-dfa8-4bcb-d12e-08d72cf301ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 02:37:31.5808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+QtB3VADf0j6PBplP3b2cV5SP5RrpBwv9RhznxatG8crNc+sCR3IYCTPfA+UFc2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S/2CfK2CbYFJvHJsK1lpzmmuYvJaU4rHeAWtnSBMIM=;
 b=tI8O/maL7tsJ1/FTRmmuJvfndpaX05Eh6Ts5Ap1RLdFh80A6kUgAYLkl2Ihdh2oNVcSSkrk53OH+sVltmpJWfM3CoC4UtetpghByVfuCOvyz52baeYrvxZ1F2RoWa+fwMlaoDq1OI8MJMFsK0hX1D5RJTEe74ZAsz715XMXcLBo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDI55pelIDIxOjMxDQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5j
b20+OyBDaGVuLA0KPiBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQo+IENjOiBaaGFuZywg
SGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNS83XSBk
cm0vYW1kZ3B1OiBhZGQgbW1odWIgcmFzX2xhdGVfaW5pdCBjYWxsYmFjaw0KPiBmdW5jdGlvbiAo
djIpDQo+IA0KPiBUaGUgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgaW4gbGF0ZSBpbml0IHBoYXNl
IHRvIGRvIG1taHViIHJhcyBpbml0DQo+IA0KPiB2MjogY2hlY2sgcmFzX2xhdGVfaW5pdCBmdW5j
dGlvbiBwb2ludGVyIGJlZm9yZSBpbnZva2luZyB0aGUgZnVuY3Rpb24NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaCB8ICAxICsNCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgIHwgMjYgKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYyAg
IHwgMjgNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAzMyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaA0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oDQo+IGluZGV4IDJkNzVlY2YuLmRmMDRjNzEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oDQo+IEBA
IC0yMyw2ICsyMyw3IEBADQo+IA0KPiAgc3RydWN0IGFtZGdwdV9tbWh1Yl9mdW5jcyB7DQo+ICAJ
dm9pZCAoKnJhc19pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICsJaW50ICgq
cmFzX2xhdGVfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgCXZvaWQgKCpx
dWVyeV9yYXNfZXJyb3JfY291bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgCQkJ
CQl2b2lkICpyYXNfZXJyb3Jfc3RhdHVzKTsNCj4gIH07DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPiBpbmRleCA4YTdhNTZhLi43MGEwNWUzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gQEAgLTc2Miw3ICs3NjIsNiBAQCBzdGF0
aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKSAgew0KPiAgCWludCBy
Ow0KPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOw0KPiAtCXN0cnVjdCByYXNfaWhfaWYgbW1odWJfaWhfaW5mbzsNCj4gIAlzdHJ1
Y3QgcmFzX2ZzX2lmIHVtY19mc19pbmZvID0gew0KPiAgCQkuc3lzZnNfbmFtZSA9ICJ1bWNfZXJy
X2NvdW50IiwNCj4gIAkJLmRlYnVnZnNfbmFtZSA9ICJ1bWNfZXJyX2luamVjdCIsDQo+IEBAIC03
NzAsMTAgKzc2OSw2IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpo
YW5kbGUpDQo+ICAJc3RydWN0IHJhc19paF9pZiB1bWNfaWhfaW5mbyA9IHsNCj4gIAkJLmNiID0g
Z21jX3Y5XzBfcHJvY2Vzc19yYXNfZGF0YV9jYiwNCj4gIAl9Ow0KPiAtCXN0cnVjdCByYXNfZnNf
aWYgbW1odWJfZnNfaW5mbyA9IHsNCj4gLQkJLnN5c2ZzX25hbWUgPSAibW1odWJfZXJyX2NvdW50
IiwNCj4gLQkJLmRlYnVnZnNfbmFtZSA9ICJtbWh1Yl9lcnJfaW5qZWN0IiwNCj4gLQl9Ow0KPiAN
Cj4gIAlpZiAoIWFkZXYtPmdtYy51bWNfcmFzX2lmKSB7DQo+ICAJCWFkZXYtPmdtYy51bWNfcmFz
X2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0DQo+IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVM
KTsgQEAgLTc5NywyOSArNzkyLDE2IEBAIHN0YXRpYyBpbnQNCj4gZ21jX3Y5XzBfZWNjX2xhdGVf
aW5pdCh2b2lkICpoYW5kbGUpDQo+ICAJCQlnb3RvIHVtY19sYXRlX2Zpbmk7DQo+ICAJfQ0KPiAN
Cj4gLQlpZiAoIWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpIHsNCj4gLQkJYWRldi0+Z21jLm1taHVi
X3Jhc19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdA0KPiByYXNfY29tbW9uX2lmKSwgR0ZQX0tF
Uk5FTCk7DQo+IC0JCWlmICghYWRldi0+Z21jLm1taHViX3Jhc19pZikNCj4gLQkJCXJldHVybiAt
RU5PTUVNOw0KPiAtCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5ibG9jayA9DQo+IEFNREdQVV9S
QVNfQkxPQ0tfX01NSFVCOw0KPiAtCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT50eXBlID0NCj4g
QU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsNCj4gLQkJYWRldi0+Z21jLm1t
aHViX3Jhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsNCj4gLQkJc3RyY3B5KGFkZXYtPmdtYy5t
bWh1Yl9yYXNfaWYtPm5hbWUsICJtbWh1YiIpOw0KPiArCWlmIChhZGV2LT5tbWh1Yl9mdW5jcy0+
cmFzX2xhdGVfaW5pdCkgew0KPiArCQlyID0gYWRldi0+bW1odWJfZnVuY3MtPnJhc19sYXRlX2lu
aXQoYWRldik7DQo+ICsJCWlmIChyKQ0KPiArCQkJcmV0dXJuIHI7DQo+ICAJfQ0KPiAtCW1taHVi
X2loX2luZm8uaGVhZCA9IG1taHViX2ZzX2luZm8uaGVhZCA9ICphZGV2LQ0KPiA+Z21jLm1taHVi
X3Jhc19pZjsNCltUYW9dIG1taHViX2loX2luZm8uY2IgPSBOVUxMIGlzIHJlY29tbWVuZGVkIGlu
IGNhc2Ugb2YgcmFuZG9tIHZhbHVlDQoNCj4gLQlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRl
diwgYWRldi0+Z21jLm1taHViX3Jhc19pZiwNCj4gLQkJCQkgJm1taHViX2ZzX2luZm8sICZtbWh1
Yl9paF9pbmZvKTsNCj4gLQlpZiAocikNCj4gLQkJZ290byBtbWh1Yl9sYXRlX2Zpbmk7DQo+IC0N
Cj4gIAlyZXR1cm4gMDsNCj4gLW1taHViX2xhdGVfZmluaToNCj4gLQlhbWRncHVfcmFzX2xhdGVf
ZmluaShhZGV2LCBhZGV2LT5nbWMubW1odWJfcmFzX2lmLA0KPiAmbW1odWJfaWhfaW5mbyk7DQo+
ICB1bWNfbGF0ZV9maW5pOg0KPiAgCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYtPmdt
Yy51bWNfcmFzX2lmLCAmdW1jX2loX2luZm8pOw0KPiAgZnJlZToNCj4gIAlrZnJlZShhZGV2LT5n
bWMudW1jX3Jhc19pZik7DQo+IC0Ja2ZyZWUoYWRldi0+Z21jLm1taHViX3Jhc19pZik7DQo+ICAJ
cmV0dXJuIHI7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbW1odWJfdjFfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJf
djFfMC5jDQo+IGluZGV4IDA0Y2Q0YjYuLjlmN2Q1ZDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMNCj4gQEAgLTMxLDYgKzMxLDcgQEANCj4gICNpbmNsdWRl
ICJ2ZWdhMTBfZW51bS5oIg0KPiANCj4gICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCINCj4gKyNp
bmNsdWRlICJhbWRncHVfcmFzLmgiDQo+IA0KPiAgI2RlZmluZSBtbURBR0IwX0NOVExfTUlTQzJf
UlYgMHgwMDhmDQo+ICAjZGVmaW5lIG1tREFHQjBfQ05UTF9NSVNDMl9SVl9CQVNFX0lEWCAwIEBA
IC02MTUsNiArNjE2LDMzIEBADQo+IHN0YXRpYyB2b2lkIG1taHViX3YxXzBfcXVlcnlfcmFzX2Vy
cm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2LA0KPiAgCX0NCj4gIH0NCj4g
DQo+ICtzdGF0aWMgaW50IG1taHViX3YxXzBfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikgew0KPiArCWludCByOw0KPiArCXN0cnVjdCByYXNfaWhfaWYgbW1odWJfaWhf
aW5mbzsNCj4gKwlzdHJ1Y3QgcmFzX2ZzX2lmIG1taHViX2ZzX2luZm8gPSB7DQo+ICsJCS5zeXNm
c19uYW1lID0gIm1taHViX2Vycl9jb3VudCIsDQo+ICsJCS5kZWJ1Z2ZzX25hbWUgPSAibW1odWJf
ZXJyX2luamVjdCIsDQo+ICsJfTsNCj4gKw0KPiArCWlmICghYWRldi0+Z21jLm1taHViX3Jhc19p
Zikgew0KPiArCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0
DQo+IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsNCj4gKwkJaWYgKCFhZGV2LT5nbWMubW1o
dWJfcmFzX2lmKQ0KPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJCWFkZXYtPmdtYy5tbWh1Yl9y
YXNfaWYtPmJsb2NrID0NCj4gQU1ER1BVX1JBU19CTE9DS19fTU1IVUI7DQo+ICsJCWFkZXYtPmdt
Yy5tbWh1Yl9yYXNfaWYtPnR5cGUgPQ0KPiBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJF
Q1RBQkxFOw0KPiArCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAw
Ow0KPiArCQlzdHJjcHkoYWRldi0+Z21jLm1taHViX3Jhc19pZi0+bmFtZSwgIm1taHViIik7DQo+
ICsJfQ0KPiArCW1taHViX2loX2luZm8uaGVhZCA9IG1taHViX2ZzX2luZm8uaGVhZCA9ICphZGV2
LQ0KPiA+Z21jLm1taHViX3Jhc19pZjsNCj4gKwlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRl
diwgYWRldi0+Z21jLm1taHViX3Jhc19pZiwNCj4gKwkJCQkgJm1taHViX2ZzX2luZm8sICZtbWh1
Yl9paF9pbmZvKTsNCj4gKwlpZiAocikNCj4gKwkJa2ZyZWUoYWRldi0+Z21jLm1taHViX3Jhc19p
Zik7DQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4gIGNvbnN0IHN0cnVjdCBhbWRncHVfbW1o
dWJfZnVuY3MgbW1odWJfdjFfMF9mdW5jcyA9IHsNCj4gKwkucmFzX2xhdGVfaW5pdCA9IG1taHVi
X3YxXzBfcmFzX2xhdGVfaW5pdCwNCj4gIAkucXVlcnlfcmFzX2Vycm9yX2NvdW50ID0gbW1odWJf
djFfMF9xdWVyeV9yYXNfZXJyb3JfY291bnQsICB9Ow0KPiAtLQ0KPiAyLjcuNA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
