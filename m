Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F158864FC
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 17:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1E96E4FB;
	Thu,  8 Aug 2019 15:00:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730059.outbound.protection.outlook.com [40.107.73.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495236E4FB
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 15:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFs+6bGoieqk86dMQfZ8FVlFYoW/Ju9lHYe1PgYxNLmyrvEDlWq6X1KYXl7FWesEYwEbjGzeorK+bP4MVriIoCGYQwrsG57V97GXzEZqyEdfCYMUyd/+wPCOZM4hK83Zvl67zoGZOQdUOBm933oVp+v5AQL5f0vGM7vVj9DJqono1fK/o5exrqg77zVrxf8hY1bx00UwgI3I8/YDpe26J6epLW+znCS2/bQ6FomwTJR+AleXL6KzaUqtlJhCAuvOZJAJBjJ/osGIFNTF8aJj0eAzrggy+RnoU5WsmMJl3d2H0CmzWDkUaq0CWyGh8TZKJIBjLoKtueBneaPAdtnPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpoqCr9iIDfijRKT/2kkyETk8f2ucwvzpBuApeQ/JAc=;
 b=lFSrgpXnYY66aFbLMsqadB40/bf6V6uOLjiQcfDcRmSwDh9Kk9osqLiCEOD1C8xnEY+69B1ETSKTZIzfG8cNrUXc6Q1M75kZTWPMp2iFGgYCwrUiyuKbMrRVo4OZ6fqnUyU/NgOaZ1jee96eIKbTZ4XmoECaEnL4InZTLIVnrFidXjwVzT+LlBDu2e63yO8C3ww9zNDZeFH/+KJq80WeblXN6Kvo3/h/n164NLfl05+iSi1Z9k2kUr5rINudiikLBwF66qFAZwYhl1ytK3FdrfRuMurzS352hf0mV84Kuw2K382BEmBlT7Z/tDSCP1cLVuxhgkXKke8DdKI+q0KKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1884.namprd12.prod.outlook.com (10.175.88.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 15:00:29 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 15:00:29 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Russell, Kent"
 <Kent.Russell@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>
Subject: RE: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Topic: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Index: AQHVS2Rt1iYG/yilwEGD8WZ3EfxSkabsNOFAgAUEOoCAAA1/4IAADKqAgAABaxA=
Date: Thu, 8 Aug 2019 15:00:28 +0000
Message-ID: <DM5PR12MB141892A269179BD41156EFBEFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
 <DM5PR12MB141855615C68E69C503AC4B7FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
 <eeb641a8-2336-e177-cb8b-bcf6c21acdef@gmail.com>
In-Reply-To: <eeb641a8-2336-e177-cb8b-bcf6c21acdef@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a53fa81-a62c-44f7-078f-08d71c1126fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1884; 
x-ms-traffictypediagnostic: DM5PR12MB1884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1884EB6872B6B1DEC10FD054FCD70@DM5PR12MB1884.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(199004)(189003)(13464003)(2501003)(256004)(8936002)(15650500001)(76116006)(66476007)(33656002)(6636002)(66946007)(66066001)(53546011)(81156014)(71200400001)(81166006)(76176011)(102836004)(71190400001)(64756008)(66556008)(8676002)(5660300002)(25786009)(7696005)(86362001)(3846002)(6116002)(99286004)(6506007)(52536014)(14454004)(6246003)(66446008)(26005)(6436002)(186003)(2906002)(11346002)(110136005)(446003)(476003)(316002)(7736002)(9686003)(74316002)(53936002)(305945005)(55016002)(478600001)(66574012)(229853002)(486006)(14444005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1884;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sljw9+wp+8JNuBkwlEh37eXPvOAWY3NKbfCNFIO/FMRiU/7X16wfHzOCO07ZJuBrKaCMjh2AqgdOh2Unm2dc6mBL+dLzW371Eomn6Y1iwoqD99GzR0ojXjLSeqn/mqO1R1K8MgqCZ17d1wNOhAXv0D3K0yTvBcpNv5efWUtrD+g/mgQku8NAgFvEsi/DzCk3T49KEceRrRwf6YEYBsGcd3CLHSaFZTz70Vw5Aa2dWppyPxeS/2mu/VyYWlU6iFVBbb1bD7wI18RaJTCldV5pjoZ6dBUP8hM46DZ9L7GZsRGuml2NWyH0DI/ebBC3emvbWRSRXPvyq8LZG/bxAMoleS0gBURRQgg4hAyF9OPwtbTb7hJJcozhdjg3BDMuEhMusXp07b86GBt5EA/ozoH8g46o2fYUc0UAbkqh/XgmXps=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a53fa81-a62c-44f7-078f-08d71c1126fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:00:28.7728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1884
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpoqCr9iIDfijRKT/2kkyETk8f2ucwvzpBuApeQ/JAc=;
 b=iO7XbTNCCX/x1Br+6MrDgm5V1TpDO90EotPldjsxI5aaeGLrjVVOX+dLJfuHgxvzA+ef0G8gT7HrzQle/3nO1VoHiXV+9OOX5U++/bK2RC823F5HAtYIS5X6VU2Rymx6TWvKYHtLGeLujoc/khpWMEam3H2DgUqyQTjr1GYNH/w=
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

SGkgQ2hyaXMsDQoNCkknbSBub3QgYXdhcmUgb2YgaG93IFJPQ00gU01JIHVzaW5nIGZlYXR1cmUg
bm9kZXMuIGJ1dCBub3QgYWxsIHRoZSBzeXNmcyBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlZCBieSB1
cHBlciBsZXZlbCBhcHBzL2xpYnMuIA0KDQpUaGVyZSBhcmUgYnVuY2hlcyBvZiBzeXNmcyBlbnRy
aWVzIHRoYXQgaGF2ZSBtdWx0aXBsZSBsaW5lIHZhbHVlLiBUaGUgbW9zdCBjb21wbGljYXRlIG9u
ZSB3b3VsZCBiZSBwcF9wb3dlcl9wcm9maWxlX21vZGUsIHdoaWNoIGxvb2tzIGxpa2UuIA0KDQow
IEJPT1RVUF9ERUZBVUxUKjoNCiAgICAgICAgICAgICAgICAgICAgMCggICAgICAgR0ZYQ0xLKSAg
ICAgICAwICAgICAgIDAgICAgICAgMSAgICAgICAwICAgICAgIDQgICAgIDgwMCA0NTg3NTIwICAt
NjU1MzYgICAgICAgMA0KICAgICAgICAgICAgICAgICAgICAxKCAgICAgICBTT0NDTEspICAgICAg
IDAgICAgICAgMCAgICAgICAxICAgICAgIDAgICAgICAgNCAgICAgODAwICAzMjc2ODAgICAtNjU1
MyAgICAgICAwDQogICAgICAgICAgICAgICAgICAgIDIoICAgICAgICAgVUNMSykgICAgICAgMCAg
ICAgICAwICAgICAgIDEgICAgICAgMCAgICAgICA0ICAgICA4MDAgIDMyNzY4MCAgLTY1NTM2ICAg
ICAgIDANCi4uLi4uLi4NCjEgM0RfRlVMTF9TQ1JFRU4gOg0KICAgICAgICAgICAgICAgICAgICAw
KCAgICAgICBHRlhDTEspICAgICAgIDAgICAgICAgMSAgICAgICAxICAgICAgIDAgICAgICAgNCAg
ICAgODAwIDQ1ODc1MjAgIC02NTUzNiAgICAgICAwDQogICAgICAgICAgICAgICAgICAgIDEoICAg
ICAgIFNPQ0NMSykgICAgICAgMCAgICAgICAxICAgICAgIDQgICAgIDg1MCAgICAgICA0ICAgICA4
MDAgIDMyNzY4MCAgLTY1NTM2ICAgICAgIDANCg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDjml6UgMjI6MjUNClRvOiBa
aGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgUnVzc2VsbCwgS2VudCA8S2Vu
dC5SdXNzZWxsQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29t
PjsgRnJlZWhpbGwsIENocmlzIDxDaHJpcy5GcmVlaGlsbEBhbWQuY29tPg0KU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL2FtZGdwdTogdXBkYXRlIHJhcyBzeXNmcyBmZWF0dXJlIGluZm8NCg0KSGkg
SGF3a2luZywNCg0KbG9va3MgbGlrZSB5b3Ugc2tpcHBlZCBteSByZXNwb25zZS4NCg0KRXZlbiB0
aGUgY3VycmVudCB3YXkgaG93IHN5c2ZzIGlzIHVzZWQgaW4gdGhlIHJhcyBjb2RlIGlzIGEgY2xl
YXIgTk8tR08gYW5kIHNob3VsZCBiZSBmaXhlZCBiZWZvcmUgdGhpcyBpcyBwdXNoZWQgdXBzdHJl
YW0uDQoNCkEgc3lzZnMgZW50cnkgc2hvdWxkIHNlcmlvdXNseSBOT1QgcmV0dXJuIGEgbXVsdGkg
bGluZSB2YWx1ZSB3aGljaCBuZWVkcyB0byBiZSBleHRlbnNpdmVseSBwYXJzZWQgYnkgdGhlIGFw
cGxpY2F0aW9uLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQpBbSAwOC4wOC4xOSB1bSAxNTo1
MCBzY2hyaWViIFpoYW5nLCBIYXdraW5nOg0KPiBVbmRlcnN0b29kIGFuZCBhZ3JlZSB3ZSBzaG91
bGQga2VlcCBzdGFibGUgaW50ZXJmYWNlcy4NCj4NCj4gQnV0IHRoZSBpbmZvcm1hdGlvbiBpbiBm
ZWF0dXJlIG5vZGUgaXMgbm90IGNvcnJlY3QgYW5kIG1ha2VzIHBlb3BsZSBjb25mdXNpbmcuIEJh
c2ljYWxseSwgZWFjaCBJUCBibG9ja3MgY2FuIHN1cHBvcnQgYWxsIHRoZSBmb3VyIGVycm9yIHR5
cGVzLCBub3QganVzdCBtdWx0aS11bmNvcnJlY3RhYmxlLiBBcyBhIHJlc3VsdCwgYW55IHVwcGVy
IGxldmVsIGFwcHMvbGlicyB0aGF0IHJlYWQgZnJvbSB0aGlzIGZpbGUgd2lsbCBqdXN0IGdldCBj
b25mdXNpbmcgaW5mb3JtYXRpb24gYXMgd2VsbC4gVGhlIGZlYXR1cmUgbWFzayBpcyBhbHJlYWR5
IGdvb2QgZW5vdWdoIGZvciB0aGlzIG5vZGUuDQo+DQo+IFJlZ2FyZHMsDQo+IEhhd2tpbmcNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUnVzc2VsbCwgS2VudCA8S2VudC5S
dXNzZWxsQGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ45pyIOOaXpSAyMDo1MQ0KPiBUbzogWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFpob3UxLCBUYW8gDQo+IDxUYW8u
WmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBQYW4sIFhpbmh1
aSANCj4gPFhpbmh1aS5QYW5AYW1kLmNvbT47IEZyZWVoaWxsLCBDaHJpcyA8Q2hyaXMuRnJlZWhp
bGxAYW1kLmNvbT4NCj4gQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiB1cGRhdGUgcmFzIHN5c2ZzIGZlYXR1cmUgaW5m
bw0KPg0KPiArQ2hyaXMgRnJlZWhpbGwNCj4NCj4gV2hpbGUgSSBjYW4gdW5kZXJzdGFuZCB0aGlz
IGNoYW5nZSwgdGhpcyBicm9rZSBvdXIgU01JIGludGVyZmFjZSwgd2hpY2ggd2FzIGV4cGVjdGlu
ZyBhIHNwZWNpZmljIHN0cmluZyBmb3JtYXQgZm9yIHRoZSByYXMvZmVhdHVyZXMgZmlsZS4gVGhp
cyBoYXMgaGFwcGVuZWQgYSBmZXcgdGltZXMgbm93LCB3aGVyZSBjaGFuZ2VzIHRvIHRoZSBSQVMg
c3lzZnMgZmlsZXMgaGFzIGJyb2tlIHRoZSBTTUkgQ0xJIGFuZC9vciBTTUkgTElCLiBDYW4gd2Ug
cGxlYXNlIGdldCBhIHN0YWJsZSBpbnRlcmZhY2UgYW5kIHN5c2ZzIGZvcm1hdCBzZXQgdXAgYmVm
b3JlIHB1Ymxpc2hpbmcgcGF0Y2hlcz8gVGhpcyBpcyBjcmVhdGluZyBhIGxvdCBvZiBleHRyYSB3
b3JrIGZvciBkZXZlbG9wZXJzIHdpdGggdGhlIFNNSSB0byBjb25zdGFudGx5IGtlZXAgdXAgd2l0
aCB0aGUgY2hhbmdlcyBiZWluZyBtYWRlIHRvIHN5c2ZzIGZpbGVzLiBUaGFuayB5b3UuDQo+DQo+
ICAgS2VudA0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+
IFpoYW5nLCBIYXdraW5nDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDUsIDIwMTkgNDoxNSBBTQ0K
PiBUbzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgDQo+IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+DQo+IENjOiBa
aG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJt
L2FtZGdwdTogdXBkYXRlIHJhcyBzeXNmcyBmZWF0dXJlIGluZm8NCj4NCj4gUmV2aWV3ZWQtYnk6
IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4NCj4gUmVnYXJkcywNCj4g
SGF3a2luZw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFvIA0K
PiBaaG91DQo+IFNlbnQ6IDIwMTnlubQ45pyINeaXpSAxNjowNA0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyANCj4g
WmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gQ2M6IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0
ZSByYXMgc3lzZnMgZmVhdHVyZSBpbmZvDQo+DQo+IHJlbW92ZSBjb25mdXNlZCByYXMgZXJyb3Ig
dHlwZSBpbmZvDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwg
MTcgKysrKystLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMNCj4gaW5kZXggZDJlOGE4NWY2ZTM4Li4zNjk2NTEyNDdiMjMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTc4NywyNSArNzg3LDE4
IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfc3lzZnNfZmVhdHVyZXNfcmVhZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsDQo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2
X3ByaXZhdGU7DQo+ICAgCXN0cnVjdCByYXNfY29tbW9uX2lmIGhlYWQ7DQo+ICAgCWludCByYXNf
YmxvY2tfY291bnQgPSBBTURHUFVfUkFTX0JMT0NLX0NPVU5UOw0KPiAtCWludCBpOw0KPiArCWlu
dCBpLCBlbmFibGVkOw0KPiAgIAlzc2l6ZV90IHM7DQo+IC0Jc3RydWN0IHJhc19tYW5hZ2VyICpv
Ymo7DQo+ICAgDQo+ICAgCXMgPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJmZWF0dXJlIG1h
c2s6IDB4JXhcbiIsIA0KPiBjb24tPmZlYXR1cmVzKTsNCj4gICANCj4gICAJZm9yIChpID0gMDsg
aSA8IHJhc19ibG9ja19jb3VudDsgaSsrKSB7DQo+ICAgCQloZWFkLmJsb2NrID0gaTsNCj4gKwkJ
ZW5hYmxlZCA9IGFtZGdwdV9yYXNfaXNfZmVhdHVyZV9lbmFibGVkKGFkZXYsICZoZWFkKTsNCj4g
ICANCj4gLQkJaWYgKGFtZGdwdV9yYXNfaXNfZmVhdHVyZV9lbmFibGVkKGFkZXYsICZoZWFkKSkg
ew0KPiAtCQkJb2JqID0gYW1kZ3B1X3Jhc19maW5kX29iaihhZGV2LCAmaGVhZCk7DQo+IC0JCQlz
ICs9IHNjbnByaW50ZigmYnVmW3NdLCBQQUdFX1NJWkUgLSBzLA0KPiAtCQkJCQkiJXM6ICVzXG4i
LA0KPiAtCQkJCQlyYXNfYmxvY2tfc3RyKGkpLA0KPiAtCQkJCQlyYXNfZXJyX3N0cihvYmotPmhl
YWQudHlwZSkpOw0KPiAtCQl9IGVsc2UNCj4gLQkJCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBB
R0VfU0laRSAtIHMsDQo+IC0JCQkJCSIlczogZGlzYWJsZWRcbiIsDQo+IC0JCQkJCXJhc19ibG9j
a19zdHIoaSkpOw0KPiArCQlzICs9IHNjbnByaW50ZigmYnVmW3NdLCBQQUdFX1NJWkUgLSBzLA0K
PiArCQkJCSIlcyByYXMgZmVhdHVyZSBtYXNrOiAlc1xuIiwNCj4gKwkJCQlyYXNfYmxvY2tfc3Ry
KGkpLCBlbmFibGVkPyJvbiI6Im9mZiIpOw0KPiAgIAl9DQo+ICAgDQo+ICAgCXJldHVybiBzOw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
