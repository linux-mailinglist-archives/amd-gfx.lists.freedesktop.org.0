Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE867A98A8
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 05:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1772C893A3;
	Thu,  5 Sep 2019 03:01:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BF2893A3
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 03:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9YkdIR9eS4NyFofwUjrU9XMRtMJqMJooUsWaV9n1t3gPvxSOvBBgMb9C3BDP8r1S4g5FfDXxtBhE/RW0ghzV5BIA4Ol0aH5bcz+ZAAafmbgj45IjA5+EkP12RB2ZVcmV2VVRa2MnCkCR2Yi7vroo+5CupE1xydv9oEjQ9r675qkRzDxwhuZqcKs6LeO7Vs7WJ2fQPD3XRN6h6zOkP5fGdVzaf5EkspIPDFa51dYSdTWtpmmdnTD4ZEeR9nkTgYJyyE/WFZ0F7cxwMkgXz9IpfGkA6n7xkZ3/pR1dIxb+Tzrs0yPTRrSw//HJBHPco4P7+vXfQ2HI8WlLsunu9RttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XGhBHuHdrT+oiTfYisDAa+MGU2F1hijMqgLnfuiBDE=;
 b=Nc5N10WVzpSRurRAGXiyxye8BDf/jvRR/QIjLGys+mw7PiwMmpme77wdN01AUJ7MJzkFT0LH9QicDWuoLVW6meO7q1vOfcQWN6To2m+giOWFgcVHqMCHp7kZfxGdwD0gaiGqARjYwdk8H+EgBYOXuvrGkumiS1+sVlV8/dDAskojRc88hGc84HHRZXvaQaLg2hN4lPrdVsmx4O8+F+1UMqd3ZVYxQXE1mSB2rblpB+IMNkKybcZ36HCP+wBtDLPW6ZnC4oLnPJO4V7sTZkP9QegdOFwpmSq45Kl2KvUe8QMU1wKPoeLKv3PQAMyUNOSxVs6UpTEr2TYDWUcyt2wbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3694.namprd12.prod.outlook.com (10.255.86.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 03:01:54 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 03:01:54 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: Remove clock gating restore.
Thread-Topic: [PATCH 2/3] drm/amdgpu: Remove clock gating restore.
Thread-Index: AQHVY5SyxbVuFnWYB0q1bbvqgAJiq6ccZOAg
Date: Thu, 5 Sep 2019 03:01:54 +0000
Message-ID: <MN2PR12MB305457F3A71630EFE3950803B0BB0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
 <1567651818-7911-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567651818-7911-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebf8e1a4-b295-4030-3681-08d731ad6849
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3694; 
x-ms-traffictypediagnostic: MN2PR12MB3694:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36948FAB430ACDC121FF8F93B0BB0@MN2PR12MB3694.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(13464003)(189003)(199004)(66066001)(8936002)(486006)(446003)(53936002)(7736002)(81156014)(81166006)(11346002)(74316002)(8676002)(110136005)(2906002)(54906003)(55016002)(102836004)(316002)(186003)(26005)(305945005)(53546011)(6506007)(478600001)(9686003)(6246003)(76176011)(476003)(52536014)(5660300002)(71200400001)(71190400001)(99286004)(33656002)(3846002)(6116002)(6436002)(256004)(66476007)(14444005)(86362001)(66946007)(229853002)(4326008)(7696005)(66446008)(2501003)(66556008)(76116006)(25786009)(14454004)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3694;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2eUHgkBg+h3+h/mww/zporbInCkp58qcc2v34vhwmj8a2NyPhF2LQ7bvjhAPwpCNh0IbtR4wRam6d4ZMwT4+gzR2/wB8lu+W0ICtNHvzoE3HdiEOD/j5bohM//6sGdpKFJRKgGYUPhzrfxzaBYCnBPDkZcL/JlHeRX5gmuzqNnNRZyDIicNd0YctOb++5jZ4HiOD4u8uD8UecFi+M5txzI59axGIg4LCdHZtCP0yVRzZEfMP8+5xmthsvq/hzNgUP2+Db4Nhsl72LDB8HtMB63JhAUk/b8xtLtlPosMC9COv5l1Lc+MzJNrDgyWOG9MbQ0NtoFgOAoNpYFgNHJCH0uJbvp10T4M6wZUhj4QrCtUrYVJV0xsxt7FZgPt51hIlMXm9xYfjTwOJWh78Sly1jMUio10Uce9oFZPjiR46UEg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf8e1a4-b295-4030-3681-08d731ad6849
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 03:01:54.4276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gRjYykGaEQ3HSGBumQrZ4Hen/5A4XynWyfBzfCpZ6QKIECEkiTn5ReU7uG9oPv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XGhBHuHdrT+oiTfYisDAa+MGU2F1hijMqgLnfuiBDE=;
 b=H23LNsnbWCfzGgw6SdCF0w6Yt8uV+c/MNFtMgZl5a1Ct/u+mjRk7mAmxAt3GfxbnGSWIo7l+Mo2A/a8vII4hNW4G614BpxX2uP26NzD3FPFqULElp6NQLFRqPmWpU6gad9Y01OjyoTyQhaNNRzQIVxvCkVX2RYwPEDQKUJ2wChI=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Saceleanu,
 Cristian" <Cristian.Saceleanu@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQncyBiZXR0ZXIgdG8gYWRkIHNwYWNlIGFmdGVyICIqIiBpbiBjb21tZW50LCB3aXRoIHRoaXMg
Zml4ZWQsIHRoZSBzZXJpZXMgaXM6DQoNClJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3Ux
QGFtZC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV5
IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ5
5pyINeaXpSAxMDo1MA0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IGFsZXhkZXVjaGVyQGdtYWlsLmNvbTsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT47DQo+IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgQ2hlbiwgR3VjaHVuDQo+
IDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgU2FjZWxlYW51LCBDcmlzdGlhbg0KPiA8Q3Jpc3RpYW4u
U2FjZWxlYW51QGFtZC5jb20+OyBHcm9kem92c2t5LCBBbmRyZXkNCj4gPEFuZHJleS5Hcm9kem92
c2t5QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAyLzNdIGRybS9hbWRncHU6IFJlbW92ZSBj
bG9jayBnYXRpbmcgcmVzdG9yZS4NCj4gDQo+IFJlc3RvcmluZyBjbG9jayBnYXRpbmcgYnJlYWsg
U01VIG9wZWFydGlvbiBhZnRlcndhcmRzLCBhdm9pZCB0aGlzIHVudGlsIHRoaXMNCj4gZnVydGhl
ciBpbnZpc3RpZ2F0ZWQgd2l0aCBTTVUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMgfCAxMCArKysrKysrKystDQo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jDQo+IGluZGV4IDdkMGQ0YzUu
Ljk1MjY2ZmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92
MTFfMF9pMmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBf
aTJjLmMNCj4gQEAgLTQ5MSw3ICs0OTEsMTUgQEAgc3RhdGljIHZvaWQgc211X3YxMV8wX2kyY19m
aW5pKHN0cnVjdCBpMmNfYWRhcHRlcg0KPiAqY29udHJvbCkNCj4gIAl9DQo+IA0KPiAgCS8qIFJl
c3RvcmUgY2xvY2sgZ2F0aW5nICovDQo+IC0Jc211X3YxMV8wX2kyY19zZXRfY2xvY2tfZ2F0aW5n
KGNvbnRyb2wsIHRydWUpOw0KPiArDQo+ICsJLyoNCj4gKwkgKlRPRE8gUmVlbmFibGluZyBjbG9j
ayBnYXRpbmcgc2VlbXMgdG8gYnJlYWsgc3Vic2VxdWVudCBTTVUNCj4gb3BlcmF0aW9uDQo+ICsJ
ICpvbiB0aGUgSTJDIGJ1cy4gTXkgZ3Vlc3MgaXMgdGhhdCBTTVUgZG9lc24ndCBkaXNhYmxlIGNs
b2NrIGdhdGluZw0KPiBsaWtlDQo+ICsJICp3ZSBkbyBoZXJlIGJlZm9yZSB3b3JraW5nIHdpdGgg
dGhlIGJ1cy4gU28gZm9yIG5vdyBqdXN0IGRvbid0DQo+IHJlc3RvcmUNCj4gKwkgKml0IGJ1dCBs
YXRlciB3b3JrIHdpdGggU01VIHRvIHNlZSBpZiB0aGV5IGhhdmUgdGhpcyBpc3N1ZSBhbmQgY2Fu
DQo+ICsJICp1cGRhdGUgdGhlaXIgY29kZSBhcHByb3ByaWF0ZWx5DQo+ICsJICovDQo+ICsJLyog
c211X3YxMV8wX2kyY19zZXRfY2xvY2tfZ2F0aW5nKGNvbnRyb2wsIHRydWUpOyAqLw0KPiANCj4g
IH0NCj4gDQo+IC0tDQo+IDIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
