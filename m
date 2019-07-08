Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9D61F14
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 14:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927F589CF9;
	Mon,  8 Jul 2019 12:56:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7DD89CF9
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 12:56:56 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3624.namprd12.prod.outlook.com (20.178.54.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Mon, 8 Jul 2019 12:56:55 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 12:56:55 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: properly guard DC support in navi code
Thread-Topic: [PATCH] drm/amdgpu: properly guard DC support in navi code
Thread-Index: AQHVM3IY9qvsNXm2Z0qc3t1+eMqFeqbAdGkAgAA97AA=
Date: Mon, 8 Jul 2019 12:56:54 +0000
Message-ID: <25d7a737-534d-8200-2b24-60080218db64@amd.com>
References: <20190705204142.10231-1-alexander.deucher@amd.com>
 <c62c35e2-a920-081b-6dfc-7fdab8a8b1ba@daenzer.net>
In-Reply-To: <c62c35e2-a920-081b-6dfc-7fdab8a8b1ba@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0149a80-2065-4163-a549-08d703a3c0d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3624; 
x-ms-traffictypediagnostic: BYAPR12MB3624:
x-microsoft-antispam-prvs: <BYAPR12MB36243DFADD72C6387307FE65ECF60@BYAPR12MB3624.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(4326008)(73956011)(66946007)(64756008)(66446008)(66556008)(5660300002)(36756003)(6116002)(14454004)(76176011)(66476007)(52116002)(6246003)(386003)(6506007)(8676002)(3846002)(102836004)(446003)(26005)(53546011)(86362001)(186003)(478600001)(2906002)(72206003)(305945005)(66066001)(81156014)(81166006)(7736002)(31696002)(71200400001)(71190400001)(8936002)(68736007)(25786009)(66574012)(6512007)(53936002)(99286004)(54906003)(110136005)(31686004)(476003)(11346002)(486006)(2616005)(256004)(14444005)(229853002)(6436002)(6486002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3624;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PLDQyLC7FvDQGRddwL0Kgp3pRjhUHo7xhj3+7+KFpzuZdkO/kY3AW/RGWiyIwvFy3zA/QsO299Qwx10iJP+3DaQPgjbPezz5BB1gkEgdK3vyvD/7kQ+rUZzgVkUVGzoJaOpM7FSKrggJqkj30N0S5dHetRtLcUowxKEEjdt3SCqg+5S+ceuM34HnO64gDw2EA00z5SbILKnqH/Ef0cABd1+3hbqHtEG8+5+4GkPsz8BjkVbsGJ/K4Cjsx3JJSs3/Qtt8bGvgFvbKaLh9y/2CnqpvvZlH7sMGQ8Y16BhmUfpQcilCuglq4aYGirx04TeXrtOLjC89PbiMmwbVsuUC8osGGs20EJ70MuZMqC1pHkbqb2CJ0UBRbrUlV5HH5DSC5fCzc5wfv5vi6hC5J87kKWqmkBsFGeyj7GK5INOIsCk=
Content-ID: <544BC1816D1D394AA82C222498F82F4C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0149a80-2065-4163-a549-08d703a3c0d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 12:56:54.9054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3624
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoeRY7VlT9sxEugLjNp0s3jkt6RIA7V33066vXwnOrk=;
 b=iXVCpHpvjbJgUP/qNF7MNkdwjTbc9ZObluUQH5iT0KgoxbSyvK5WBPDWQKuyHPJZhA1s/76LIpffYEZP2kEIvVSI04b9VdgtQ8r24+gOM/rX2QN9KtE4LiW8Z4vJcBgmaBWI5b6TRaJn4evCVA1thFwlRrz0N7Mc8Z2iGDaEEPc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy84LzE5IDU6MTUgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiBPbiAyMDE5LTA3LTA1
IDEwOjQxIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4+IE5lZWQgdG8gYWRkIGFwcHJvcHJp
YXRlIGlmZGVmLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9udi5jIHwgNCArKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCj4+IGluZGV4IGEwOTBlM2ZkYzc2Mi4uZWUzOWNi
NzQwZDQxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYw0KPj4gQEAgLTM1Miw4ICsz
NTIsMTIgQEAgaW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQo+PiAgIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBf
YmxvY2spOw0KPj4gICAJCWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdw
dV9zcmlvdl92ZihhZGV2KSkNCj4+ICAgCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJmRjZV92aXJ0dWFsX2lwX2Jsb2NrKTsNCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FN
RF9EQykNCj4+ICAgCQllbHNlIGlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYp
KQ0KPj4gICAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZG1faXBfYmxvY2sp
Ow0KPj4gKyNlbHNlDQo+PiArIwl3YXJuaW5nICJFbmFibGUgQ09ORklHX0RSTV9BTURfREMgZm9y
IGRpc3BsYXkgc3VwcG9ydCBvbiBuYXZpLiINCj4+ICsjZW5kaWYNCj4+ICAgCQlhbWRncHVfZGV2
aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3YxMF8wX2lwX2Jsb2NrKTsNCj4+ICAgCQlhbWRn
cHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8wX2lwX2Jsb2NrKTsNCj4+ICAg
CQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX0RJUkVDVCAm
Jg0KPj4NCj4gDQo+IElzIENPTkZJR19EUk1fQU1EX0RDIHN0aWxsIG5lZWRlZD8gV2hhdCBmb3I/
IChPdGhlciB0aGFuIGFjY2lkZW50YWxseQ0KPiBkaXNhYmxpbmcgZGlzcGxheSB3aXRoIGN1cnJl
bnQgaGFyZHdhcmUgOykNCj4gDQo+IA0KDQpJdCB3b3VsZCBzbGltIGRvd24gbW9kdWxlIHNpemUg
YW5kIGNvbXBpbGUgdGltZXMgaWYgeW91IGp1c3QgbmVlZGVkIA0KUmFkZW9uIGFuZCBub3RoaW5n
IGVsc2UsIGJ1dCBpdCdzIGtpbmQgb2YgYSBuaWNoZSB1c2UgY2FzZS4NCg0KSSB0aGluayB0aGUg
b25seSB0aGluZyBpdCBkb2VzIHJpZ2h0IG5vdyBpcyBhdXRvc2VsZWN0IERDTiBiYXNlZCBvbiAN
CndoZXRoZXIgd2UgdGhpbmsgd2UgaGF2ZSBGUCBzdXBwb3J0IG9yIG5vdCwgYnV0IHRoYXQgY291
bGQgcHJvYmFibHkgYmUgDQptb3ZlZCBlbHNld2hlcmUuDQoNCk5pY2hvbGFzIEthemxhdXNrYXMN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
