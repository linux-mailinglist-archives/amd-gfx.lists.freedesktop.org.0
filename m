Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B6A92D8
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 22:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172F89BFB;
	Wed,  4 Sep 2019 20:12:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690051.outbound.protection.outlook.com [40.107.69.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FE189BFB
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 20:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3w9aXWJdiY63MEDoy9tmxtHsv7vxyc0CtjCkZ3rVdMWysz2OC7uyOjeGqOjNJg4EbffzV44978HakhV1Uz9eBqe4G5Pb4Mdf+x3LiBE1va97Qsnz5i8XE+LOkNQE1aqmy1yAh8ml2QueipPaw5Yij53guYEVlJ93sgbcLb3Z+/9WoQr7tNrq6YgUQmUahzrOuAyoz9xSv5w98KkrYD5k6SHLrYmhbpLaGCMq5RnH20efKF7XbOuaQ8xD/zrXdBQg06IshYdtaBtOcpZ99iqXYo76DUqKkc4rNKi2JZO/EbG2BKVOaoXCh042zJXc5kbnr3r14U7Bdu5j5uwLwXwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byw1n0hq8n42LMr0YSAmPf8bkdZQSurKZ5zoW9dFUrg=;
 b=HedTqCsJ5AXNfhWuMGklLaEVu5+ZfVQbFISW+hqkAuFGAA3QlZ3u2aSS/5EftVc1T4JYGOPW6HB+GO9H0Oqmoe85irDKDjLoeIHylEhWFG3Vviy0DFgzYRJT4tqe8lA5oGtJ3br8VWB9i/w55CvMvq/B7g1Szpoo2z893CaECCTpWGMZDN2VuYHrijYcQmI6tAC1C7GkTS29kkAhzZ3P5N6U1fuijJ6N2HmzLoHiQVfK2dz2ytRRSOyRZUoFEQ87iBPX7dD42fnkLg6i3elKPV0R72IIbPK67IWWrUYwB6Anh6P7KyTPrUPOl3c54+yMEbdHj2BDl2lqra4T4bdphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1294.namprd12.prod.outlook.com (10.169.205.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 20:12:28 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::d1d4:fdff:728e:833b]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::d1d4:fdff:728e:833b%4]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 20:12:28 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Topic: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Index: AQHVYzHR2h3CIi5T9ECYFDcNflD/YKcb88AA
Date: Wed, 4 Sep 2019 20:12:27 +0000
Message-ID: <844c2c90-8be4-df05-9df9-c9c9cde9b186@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <20190904150230.13885-10-christian.koenig@amd.com>
In-Reply-To: <20190904150230.13885-10-christian.koenig@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::44) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8575727e-6964-4854-3716-08d731743550
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1294; 
x-ms-traffictypediagnostic: MWHPR12MB1294:
x-microsoft-antispam-prvs: <MWHPR12MB1294DC03CC749494256E9B83E6B80@MWHPR12MB1294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(478600001)(26005)(186003)(66556008)(2501003)(2616005)(476003)(66574012)(64756008)(316002)(66476007)(11346002)(2906002)(102836004)(66446008)(71190400001)(71200400001)(99286004)(7736002)(14444005)(386003)(6506007)(25786009)(53546011)(229853002)(76176011)(256004)(6486002)(6246003)(31696002)(305945005)(14454004)(66066001)(86362001)(3846002)(81156014)(81166006)(6436002)(8676002)(486006)(6116002)(6512007)(36756003)(5660300002)(52116002)(446003)(53936002)(66946007)(110136005)(8936002)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1294;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P7aPTUU+IIHKzUAibbIICJ85wX4XpDV2cXY91z2cvQyALEw2dMXGmhj2TI+Z1D1ktswyZ+7my0ePDKqqxVvP7OI63t+vKrzmG6WInn9AsGtKN12Wz6cdsKViQWPBx4sRIxeakbV3+DOCs1xjPhnG1F09jyepKAolmvvP6pHIZ8KeXJIxoJHckDSbnzyhdghbhjFUVmT/8yi8pTBsz46FFsLm2ekMFuMbWllgnSkLkmrvgTwe/3h+VtvJj1evTVwxInBlii1q1tDeud3Su0/TFvB4RVbj4JJmZDvfjaYjLpalFevwnCCYUGAr3C4M+6F4wn12aUGIGWB00zCKV27tchwe4SQnsmGJT/X8nMVE0wFZpFEsw2bbeKZ1ODm2azv+usSkToN6SFeLKwi7wx29SGG9Dbq8gt6p8urIaEKXOVA=
x-ms-exchange-transport-forked: True
Content-ID: <3C6BC799F2839746B09BC9D6A026CFC7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8575727e-6964-4854-3716-08d731743550
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 20:12:27.8730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iaz58gMMmL/JZ4L42p2yQdPpstEHTGrK4Qf+r4wmk2f03ys5ncfFr7x282G1KiMa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1294
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byw1n0hq8n42LMr0YSAmPf8bkdZQSurKZ5zoW9dFUrg=;
 b=kp19N1YVSEsuvM3GCA2VwH1qKHC0rc55oF9/t6VOPtxaPT3RObhJM+TjutAhb7vNxe/XvDEh803n3nVJGI3x0QqrNtdewGT24u6Ye5OQZafDBmuhtnXWpypdiO1cbxKM2gXPxHFfdu8q5rgztioJNRFKBQG/7NiiHffnDJzzUR8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

VGhpcyBzZXJpZXMgbG9va3MgbmljZSBhbmQgY2xlYXIgZm9yIG1lLCB0d28gcXVlc3Rpb25zIGVt
YmVkZGVkIGJlbG93Lg0KDQpBcmUgd2UgZ29pbmcgdG8gdXNlIGRlZGljYXRlZCBzZG1hIHBhZ2Ug
cXVldWUgZm9yIGRpcmVjdCBWTSB1cGRhdGUgcGF0aCANCmR1cmluZyBhIGZhdWx0Pw0KDQpUaGFu
a3MsDQpQaGlsaXANCg0KT24gMjAxOS0wOS0wNCAxMTowMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOg0KPiBOZXh0IHN0ZXAgdG93YXJkcyBITU0gc3VwcG9ydC4gRm9yIG5vdyBqdXN0IHNp
bGVuY2UgdGhlIHJldHJ5IGZhdWx0IGFuZA0KPiBvcHRpb25hbGx5IHJlZGlyZWN0IHRoZSByZXF1
ZXN0IHRvIHRoZSBkdW1teSBwYWdlLg0KPiANCj4gdjI6IG1ha2Ugc3VyZSB0aGUgVk0gaXMgbm90
IGRlc3Ryb3llZCB3aGlsZSB3ZSBoYW5kbGUgdGhlIGZhdWx0Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDc0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmggfCAgMiArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgfCAg
NCArKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gaW5kZXggOTUxNjA4ZmMxOTI1Li40MTBk
ODk5NjZhNjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+
IEBAIC0zMTQyLDMgKzMxNDIsNzcgQEAgdm9pZCBhbWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhzdHJ1
Y3QgYW1kZ3B1X3ZtICp2bSkNCj4gICAJCX0NCj4gICAJfQ0KPiAgIH0NCj4gKw0KPiArLyoqDQo+
ICsgKiBhbWRncHVfdm1faGFuZGxlX2ZhdWx0IC0gZ3JhY2VmdWwgaGFuZGxpbmcgb2YgVk0gZmF1
bHRzLg0KPiArICogQGFkZXY6IGFtZGdwdSBkZXZpY2UgcG9pbnRlcg0KPiArICogQHBhc2lkOiBQ
QVNJRCBvZiB0aGUgVk0NCj4gKyAqIEBhZGRyOiBBZGRyZXNzIG9mIHRoZSBmYXVsdA0KPiArICoN
Cj4gKyAqIFRyeSB0byBncmFjZWZ1bGx5IGhhbmRsZSBhIFZNIGZhdWx0LiBSZXR1cm4gdHJ1ZSBp
ZiB0aGUgZmF1bHQgd2FzIGhhbmRsZWQgYW5kDQo+ICsgKiBzaG91bGRuJ3QgYmUgcmVwb3J0ZWQg
YW55IG1vcmUuDQo+ICsgKi8NCj4gK2Jvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgaW50IHBhc2lkLA0KPiArCQkJICAgIHVpbnQ2
NF90IGFkZHIpDQo+ICt7DQo+ICsJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gJmFkZXYtPnNk
bWEuaW5zdGFuY2VbMF0ucGFnZTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpyb290Ow0KPiArCXVp
bnQ2NF90IHZhbHVlLCBmbGFnczsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X3ZtICp2bTsNCj4gKwlsb25n
IHI7DQo+ICsNCj4gKwlpZiAoIXJpbmctPnNjaGVkLnJlYWR5KQ0KPiArCQlyZXR1cm4gZmFsc2U7
DQo+ICsNCj4gKwlzcGluX2xvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7DQo+ICsJ
dm0gPSBpZHJfZmluZCgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBhc2lkKTsNCj4gKwlp
ZiAodm0pDQo+ICsJCXJvb3QgPSBhbWRncHVfYm9fcmVmKHZtLT5yb290LmJhc2UuYm8pOw0KPiAr
CWVsc2UNCj4gKwkJcm9vdCA9IE5VTEw7DQo+ICsJc3Bpbl91bmxvY2soJmFkZXYtPnZtX21hbmFn
ZXIucGFzaWRfbG9jayk7DQo+ICsNCj4gKwlpZiAoIXJvb3QpDQo+ICsJCXJldHVybiBmYWxzZTsN
Cj4gKw0KPiArCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShyb290LCB0cnVlKTsNCj4gKwlpZiAocikN
Cj4gKwkJZ290byBlcnJvcl91bnJlZjsNCj4gKw0KPiArCXNwaW5fbG9jaygmYWRldi0+dm1fbWFu
YWdlci5wYXNpZF9sb2NrKTsNCj4gKwl2bSA9IGlkcl9maW5kKCZhZGV2LT52bV9tYW5hZ2VyLnBh
c2lkX2lkciwgcGFzaWQpOw0KPiArCXNwaW5fdW5sb2NrKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lk
X2xvY2spOw0KPiArDQpIZXJlIGdldCB2bSBmcm9tIHBhc2lkIHNlY29uZCB0aW1lLCBhbmQgY2hl
Y2sgaWYgUEQgYm8gaXMgY2hhbmdlZCwgaXMgDQp0aGlzIHRvIGhhbmRsZSB2bSBmYXVsdCByYWNl
IHdpdGggdm0gZGVzdG9yeT8NCg0KPiArCWlmICghdm0gfHwgdm0tPnJvb3QuYmFzZS5ibyAhPSBy
b290KQ0KPiArCQlnb3RvIGVycm9yX3VubG9jazsNCj4gKw0KPiArCWFkZHIgLz0gQU1ER1BVX0dQ
VV9QQUdFX1NJWkU7DQo+ICsJZmxhZ3MgPSBBTURHUFVfUFRFX1ZBTElEIHwgQU1ER1BVX1BURV9T
Tk9PUEVEIHwNCj4gKwkJQU1ER1BVX1BURV9TWVNURU07DQo+ICsNCj4gKwlpZiAoYW1kZ3B1X3Zt
X2ZhdWx0X3N0b3AgPT0gQU1ER1BVX1ZNX0ZBVUxUX1NUT1BfTkVWRVIpIHsNCj4gKwkJLyogUmVk
aXJlY3QgdGhlIGFjY2VzcyB0byB0aGUgZHVtbXkgcGFnZSAqLw0KPiArCQl2YWx1ZSA9IGFkZXYt
PmR1bW15X3BhZ2VfYWRkcjsNCj4gKwkJZmxhZ3MgfD0gQU1ER1BVX1BURV9FWEVDVVRBQkxFIHwg
QU1ER1BVX1BURV9SRUFEQUJMRSB8DQo+ICsJCQlBTURHUFVfUFRFX1dSSVRFQUJMRTsNCj4gKwl9
IGVsc2Ugew0KPiArCQl2YWx1ZSA9IDA7DQo+ICsJfQ0KPiArDQo+ICsJciA9IGFtZGdwdV92bV9i
b191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwgdHJ1ZSwgTlVMTCwgYWRkciwgYWRkciArIDEsDQo+
ICsJCQkJCWZsYWdzLCB2YWx1ZSwgTlVMTCwgTlVMTCk7DQo+ICsJaWYgKHIpDQo+ICsJCWdvdG8g
ZXJyb3JfdW5sb2NrOw0KPiArDQpBZnRlciBmYXVsdCBhZGRyZXNzIHJlZGlyZWN0IHRvIGR1bW15
IHBhZ2UsIHdpbGwgdGhlIGZhdWx0IHJlY292ZXIgYW5kIA0KcmV0cnkgY29udGludWUgdG8gZXhl
Y3V0ZT8gSXMgdGhpcyBkYW5nZXJvdXMgdG8gdXBkYXRlIFBURSB0byB1c2Ugc3lzdGVtIA0KbWVt
b3J5IGFkZHJlc3MgMD8NCg0KPiArCXIgPSBhbWRncHVfdm1fdXBkYXRlX3BkZXMoYWRldiwgdm0s
IHRydWUpOw0KPiArDQo+ICtlcnJvcl91bmxvY2s6DQo+ICsJYW1kZ3B1X2JvX3VucmVzZXJ2ZShy
b290KTsNCj4gKwlpZiAociA8IDApDQo+ICsJCURSTV9FUlJPUigiQ2FuJ3QgaGFuZGxlIHBhZ2Ug
ZmF1bHQgKCVsZClcbiIsIHIpOw0KPiArDQo+ICtlcnJvcl91bnJlZjoNCj4gKwlhbWRncHVfYm9f
dW5yZWYoJnJvb3QpOw0KPiArDQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiBpbmRleCAwYTk3ZGM4MzlmM2IuLjRkYmJlMWI2
YjQxMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4gQEAg
LTQxMyw2ICs0MTMsOCBAQCB2b2lkIGFtZGdwdV92bV9jaGVja19jb21wdXRlX2J1ZyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgDQo+ICAgdm9pZCBhbWRncHVfdm1fZ2V0X3Rhc2tf
aW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgaW50IHBhc2lkLA0KPiAg
IAkJCSAgICAgc3RydWN0IGFtZGdwdV90YXNrX2luZm8gKnRhc2tfaW5mbyk7DQo+ICtib29sIGFt
ZGdwdV92bV9oYW5kbGVfZmF1bHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVk
IGludCBwYXNpZCwNCj4gKwkJCSAgICB1aW50NjRfdCBhZGRyKTsNCj4gICANCj4gICB2b2lkIGFt
ZGdwdV92bV9zZXRfdGFza19pbmZvKHN0cnVjdCBhbWRncHVfdm0gKnZtKTsNCj4gICANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IGluZGV4IDlkMTU2NzlkZjZlMC4uMTVh
MWNlNTFiZWZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4g
QEAgLTM1Myw2ICszNTMsMTAgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVw
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJfQ0KPiAgIA0KPiAgIAkvKiBJZiBp
dCdzIHRoZSBmaXJzdCBmYXVsdCBmb3IgdGhpcyBhZGRyZXNzLCBwcm9jZXNzIGl0IG5vcm1hbGx5
ICovDQo+ICsJaWYgKHJldHJ5X2ZhdWx0ICYmICFpbl9pbnRlcnJ1cHQoKSAmJg0KPiArCSAgICBh
bWRncHVfdm1faGFuZGxlX2ZhdWx0KGFkZXYsIGVudHJ5LT5wYXNpZCwgYWRkcikpDQo+ICsJCXJl
dHVybiAxOyAvKiBUaGlzIGFsc28gcHJldmVudHMgc2VuZGluZyBpdCB0byBLRkQgKi8NCj4gKw0K
PiAgIAlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KPiAgIAkJLyoNCj4gICAJCSAqIElz
c3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0IGZvciB0aGUgc3RhdHVzIHJlZ2lzdGVyIHRvDQo+IA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
