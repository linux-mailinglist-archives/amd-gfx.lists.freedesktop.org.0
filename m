Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DCFBC4C6
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 11:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF43F89E33;
	Tue, 24 Sep 2019 09:26:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F4389E33
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 09:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv8JxdjX7cPTXpHgfezVWJlzeo97nPXjoQJVW1n2S3foaQ0x32+Q7NHAdPYv0OJx8JozQuGxDF9XP/s03OS9qpp4sYCQShMdjKIr94TQl3WM0DpWSwcVFJ+T4dQmjlCHaFePZ6UesMgNqTYsTcIOp1r5US9Wr9hdicD/9Y6Vua8qt0Bzk0DbOgE2RTqM6SkdibX8KG0Q35voASDF78J/tU0zt32lAEN0NLyg5KhidtDxoUuLHNp0US2WohR67pDFy3dZhL/WG6TZhi4x/NABp0Vy3TXV3Db7d6jjwU3XcnVcZQ4GLOniz6NVmx+SxaDUGoP+IucumRHzHhPSv+NlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM72gUBCnItdbW280slc7wBk5g5Xn6Et4/tZzlBCFfA=;
 b=Vio11g/3KNtaDfVcTL/Qf39W1ml9cYdn/WBGxYj/UvOUgqhQYlhQmLzyKeylDOIueb2MLl6xfLts5gyo3nwC/a9w/Ke8T2ej3gpbH7I/b7sWqW2UuJvF8xH4aL5MOg/kAehXMKBzNMKMXyzelnoof0hi+NvtZ1x3YJvF32VKTz5H619ksSF0rnrQN7fVty98xx0ccqQcgY3B/tZKdU/owozZhAyDai3G0FlFDUvGIoV7QFv6yYFaCbBNYMG9fu2earaKn8VCXlr8+QuLiWLyHuJ4wkbgsFPU4EUtAGFe1jfg2VZLJkAkKw4zENy3sN15HviphATCQjktirVzwgu9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4261.namprd12.prod.outlook.com (20.180.6.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 09:26:28 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 09:26:28 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu/psp: silence response status warning
Thread-Topic: [PATCH] drm/amdgpu/psp: silence response status warning
Thread-Index: AQHVcrkCwx7KJ9fTsUG8CMN4kHpeOKc6jpgQ
Date: Tue, 24 Sep 2019 09:26:28 +0000
Message-ID: <CH2PR12MB37679A71CA0C984C64FC0031FE840@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1569316680-12374-1-git-send-email-shirish.s@amd.com>
In-Reply-To: <1569316680-12374-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c72f55f7-2c99-4507-8337-08d740d1478a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4261; 
x-ms-traffictypediagnostic: CH2PR12MB4261:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4261E0AF3A4D4CD88BE02D45FE840@CH2PR12MB4261.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(199004)(189003)(13464003)(966005)(53546011)(478600001)(316002)(2906002)(55016002)(6116002)(66066001)(6306002)(8676002)(3846002)(4326008)(14454004)(9686003)(14444005)(81156014)(256004)(229853002)(6436002)(81166006)(74316002)(102836004)(186003)(76176011)(6636002)(33656002)(5660300002)(7696005)(54906003)(76116006)(305945005)(486006)(7736002)(446003)(86362001)(26005)(476003)(66946007)(11346002)(71200400001)(66556008)(66476007)(64756008)(99286004)(25786009)(66446008)(110136005)(52536014)(6506007)(8936002)(71190400001)(6246003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4261;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qc0GUxJLzT6ZZmAKk4z5TCymUW+KRrRnh2YBj95V+41czV+ioMpze2EYra/OTTwRv8LWCEULRWgh504o1e0nXpDyAx9HScLLDeoH15wwsLF/uihdfJgdnfAiKb2ECi7F5u/WXLUaONYCAwcqX5pHpahIhVLZ1jdBo3B5/RbF69dcU+tHm7/fMDHh3LA3X8Sq3E+ngdUHvllpLB9raARf2lRTU9nxsXGKqKDwU7NUnHmgXp7A/heKiYrs+dlzVXEAI4pPt8kEpDhBCu1WsczI9voCUSX87ztMmdNM8yut+NNZdAoI0IH5lxMzJdZOtAm7oMJiCz/eaXesd9NLGYexziT01hQiTkP3ncyMJs/sF+OsEXM6N3cyWm/oK2zSNJ2IbcLL5TeB5JQWUaTter3fJwg/TL1RFxEhC4+1B0Zwcg4ZVDgbE10OMJhAfnqY03Mp2gGb+p32/WVzyUmq6DI1GQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72f55f7-2c99-4507-8337-08d740d1478a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 09:26:28.6758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKgdowd9cRGfZZyzLn6GS08R6IpFoLZBmOHVsfls+iA/jWgVWsScjtHWKIdT8Tp8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM72gUBCnItdbW280slc7wBk5g5Xn6Et4/tZzlBCFfA=;
 b=aBGJbaioGrXvKIt54aOMbNT/WYI5LL2//GMi3WgOoj3/9WddnqwTeXVWt30r8OgpPq3llaTnxyb2OxjAEB9/8u19sJe+2Byzocbj31HBErOCQIl+/Yhmqr08tm6aKg4mcB/K9V8/0lyt9j0rqIYIa+6rYdRXjg4h7RcZSVk6KPc=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBTLCBTaGlyaXNoDQpTZW50OiBUdWVzZGF5LCBT
ZXB0ZW1iZXIgMjQsIDIwMTkgNToxOCBQTQ0KVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmln
QGFtZC5jb20+OyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IFMsIFNoaXJpc2ggPFNoaXJpc2guU0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1L3BzcDogc2lsZW5jZSByZXNwb25zZSBzdGF0dXMgd2FybmluZw0KDQpsb2cgdGhlIHJl
c3BvbnNlIHN0YXR1cyByZWxhdGVkIGVycm9yIHRvIHRoZSBkcml2ZXIncyBkZWJ1ZyBsb2cgc2lu
Y2UgIHBzcCByZXNwb25zZSBzdGF0dXMgaXMgbm90IDAgZXZlbiB0aG91Z2ggdGhlcmUgd2FzIG5v
IHByb2JsZW0gd2hpbGUgdGhlIGNvbW1hbmQgd2FzIHN1Ym1pdHRlZC4NCg0KVGhpcyB3YXJuaW5n
IG1pc2xlYWRzLCBoZW5jZSB0aGlzIGNoYW5nZS4NCg0KU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBT
IDxzaGlyaXNoLnNAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KaW5kZXgg
NzZjNTlkNS4uMzdmZmVkNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jDQpAQCAtMTcwLDcgKzE3MCw3IEBAIHBzcF9jbWRfc3VibWl0X2J1ZihzdHJ1Y3QgcHNwX2Nv
bnRleHQgKnBzcCwNCiAJCWlmICh1Y29kZSkNCiAJCQlEUk1fV0FSTigiZmFpbGVkIHRvIGxvYWQg
dWNvZGUgaWQgKCVkKSAiLA0KIAkJCQkgIHVjb2RlLT51Y29kZV9pZCk7DQotCQlEUk1fV0FSTigi
cHNwIGNvbW1hbmQgKDB4JVgpIGZhaWxlZCBhbmQgcmVzcG9uc2Ugc3RhdHVzIGlzICgweCVYKVxu
IiwNCisJCURSTV9ERUJVR19EUklWRVIoInBzcCBjb21tYW5kICgweCVYKSBmYWlsZWQgYW5kIHJl
c3BvbnNlIHN0YXR1cyBpcyANCisoMHglWClcbiIsDQogCQkJIHBzcC0+Y21kX2J1Zl9tZW0tPmNt
ZF9pZCwNCiAJCQkgcHNwLT5jbWRfYnVmX21lbS0+cmVzcC5zdGF0dXMgJiBHRlhfQ01EX1NUQVRV
U19NQVNLKTsNCiAJCWlmICghdGltZW91dCkgew0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
