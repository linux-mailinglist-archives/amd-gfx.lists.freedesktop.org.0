Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD0863AD
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 15:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896D96E83D;
	Thu,  8 Aug 2019 13:50:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BD76E83B
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 13:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVfML5xkPqM94T2zRdhOLcQ96sMJFaebNj+pNefsYQBvXyqwItR5H2KC7osZZmwvWciqFWp/HELuaqvp0ZJfCW5pAk1/4afmsuMOBk4Yr+4Iijap3fERo09ghSwCRxKRpB5licr18H474m6IqW1ciDwOYdJT6041Ieev7DK/yQURuYa1mstiO3dmUA01b93Lxk/A+qDygOfqf1iTgCteI3fYZP58lgjTPSbMPQucmHQWu2RYYChl6O0pBSXOZCyjpLaOe9yflz5egNPexHa9OdVSQ5U/s801b6Xl1EYztO11PFh/OPpQOHqpAjVIzLiiKKIpbZQYO8U91cEaxQQBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Z4BVopn3j8l5FNQj+YSX3qK78Q3mdj+o4saB59Azo=;
 b=AyYwWd4242ghms9Uzxv94lH9lBy+oEBeHTGXZEEgnLvXXtTY6l0nNvj9TMxLyvdDPXqbsfs5S93nXY/JowE/zV/C3/94/C9dyRgIEf/SwmxGdKz4QDGZU6LZIqgSGaN9PWmb2o5mMAdnlZUAiZKXSHT/B65ULGXRbw7fjOp9dNFIRfP4CrO/TdYsNsHDRzFrfHxdzj9OJVdKhF9yjSQR2FXtQwvdskGhW7x310Aw+WKzl2xlmv8U7ynmlVXBvp501iNHz/T4/Vpkak64Sv8s6bOC8tfjENTlmzj5hSsYZC/R7aNnPwi8YkS7Httextr6eq4eYjksiEhfH9ebqhzrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1450.namprd12.prod.outlook.com (10.172.33.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 13:50:46 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 13:50:46 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>
Subject: RE: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Topic: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Index: AQHVS2Rt1iYG/yilwEGD8WZ3EfxSkabsNOFAgAUEOoCAAA1/4A==
Date: Thu, 8 Aug 2019 13:50:45 +0000
Message-ID: <DM5PR12MB141855615C68E69C503AC4B7FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e19afc0e-5c92-431a-e469-08d71c0769d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1450; 
x-ms-traffictypediagnostic: DM5PR12MB1450:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB145033D3D285407C9CAFD2E4FCD70@DM5PR12MB1450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(13464003)(199004)(189003)(64756008)(11346002)(486006)(446003)(6306002)(229853002)(476003)(4326008)(66066001)(8676002)(2906002)(53936002)(6246003)(316002)(6436002)(26005)(102836004)(14454004)(81166006)(186003)(9686003)(81156014)(33656002)(55016002)(53546011)(6506007)(110136005)(7696005)(15650500001)(66946007)(76176011)(5660300002)(76116006)(99286004)(71190400001)(66476007)(52536014)(66446008)(66556008)(25786009)(2501003)(6636002)(14444005)(8936002)(305945005)(86362001)(71200400001)(74316002)(966005)(256004)(7736002)(3846002)(6116002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1450;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AiLf20LJASYwRn6wz4/Bkenpk7l47fWiT+9CM9PkYwb3jE7IN63OXs04eTCN1T+U4mSVHvJaibPF/jgYM5Yg7AMUJulfVOt+VPnEfl9W5Qh70QPx8JtY4TfXZ1z+QRsIUkGfd/K74MxUkQSK0wHPSsh+CJdxRd6euBuerwMzyP6RVIgIzX+dFSLlyK7XQpl2BdkNFZbsoF1+lVM+eiENZu0ZyFxDNMJz2tMACwGbU+dJ19LyNLFk8w0DtT0II2Hio2SNkau5LZVzuvB2zLMaZfINDqMl251CM8hgzvkZG9rFtrwVXtuUbwgJqmSrMu7GGbU62JtwAu3J73JWslbyKy3caj4NSuRmVOLWFnTKDQyGUxqjd1s68t28L1ZWe9j6EmjXYBahEw3zUZ25t/2T0ZR+SWDOLzUoX9E+Smi7uSE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19afc0e-5c92-431a-e469-08d71c0769d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 13:50:45.9871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1450
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Z4BVopn3j8l5FNQj+YSX3qK78Q3mdj+o4saB59Azo=;
 b=kcDpzdGKM+d5siOKBPD1LYopM5NEPLb62QTPjt87F5ip6a1Zjdp2Rl4cPmeEeEfsnRiXtVTjJz10MgpaOl0nnkj4Dhdb56gAIARJiZClCGrYzJ0MH1K/DTiFqM9+NLlSUbr1rWLi1FHcyMlPbBDsBLtoCR75BlaN+qVvZcZisko=
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW5kZXJzdG9vZCBhbmQgYWdyZWUgd2Ugc2hvdWxkIGtlZXAgc3RhYmxlIGludGVyZmFjZXMuIA0K
DQpCdXQgdGhlIGluZm9ybWF0aW9uIGluIGZlYXR1cmUgbm9kZSBpcyBub3QgY29ycmVjdCBhbmQg
bWFrZXMgcGVvcGxlIGNvbmZ1c2luZy4gQmFzaWNhbGx5LCBlYWNoIElQIGJsb2NrcyBjYW4gc3Vw
cG9ydCBhbGwgdGhlIGZvdXIgZXJyb3IgdHlwZXMsIG5vdCBqdXN0IG11bHRpLXVuY29ycmVjdGFi
bGUuIEFzIGEgcmVzdWx0LCBhbnkgdXBwZXIgbGV2ZWwgYXBwcy9saWJzIHRoYXQgcmVhZCBmcm9t
IHRoaXMgZmlsZSB3aWxsIGp1c3QgZ2V0IGNvbmZ1c2luZyBpbmZvcm1hdGlvbiBhcyB3ZWxsLiBU
aGUgZmVhdHVyZSBtYXNrIGlzIGFscmVhZHkgZ29vZCBlbm91Z2ggZm9yIHRoaXMgbm9kZS4NCg0K
UmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSdXNz
ZWxsLCBLZW50IDxLZW50LlJ1c3NlbGxAYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDjml6Ug
MjA6NTENClRvOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWmhvdTEs
IFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
UGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IEZyZWVoaWxsLCBDaHJpcyA8Q2hyaXMu
RnJlZWhpbGxAYW1kLmNvbT4NCkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NClN1
YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0ZSByYXMgc3lzZnMgZmVhdHVyZSBp
bmZvDQoNCitDaHJpcyBGcmVlaGlsbA0KDQpXaGlsZSBJIGNhbiB1bmRlcnN0YW5kIHRoaXMgY2hh
bmdlLCB0aGlzIGJyb2tlIG91ciBTTUkgaW50ZXJmYWNlLCB3aGljaCB3YXMgZXhwZWN0aW5nIGEg
c3BlY2lmaWMgc3RyaW5nIGZvcm1hdCBmb3IgdGhlIHJhcy9mZWF0dXJlcyBmaWxlLiBUaGlzIGhh
cyBoYXBwZW5lZCBhIGZldyB0aW1lcyBub3csIHdoZXJlIGNoYW5nZXMgdG8gdGhlIFJBUyBzeXNm
cyBmaWxlcyBoYXMgYnJva2UgdGhlIFNNSSBDTEkgYW5kL29yIFNNSSBMSUIuIENhbiB3ZSBwbGVh
c2UgZ2V0IGEgc3RhYmxlIGludGVyZmFjZSBhbmQgc3lzZnMgZm9ybWF0IHNldCB1cCBiZWZvcmUg
cHVibGlzaGluZyBwYXRjaGVzPyBUaGlzIGlzIGNyZWF0aW5nIGEgbG90IG9mIGV4dHJhIHdvcmsg
Zm9yIGRldmVsb3BlcnMgd2l0aCB0aGUgU01JIHRvIGNvbnN0YW50bHkga2VlcCB1cCB3aXRoIHRo
ZSBjaGFuZ2VzIGJlaW5nIG1hZGUgdG8gc3lzZnMgZmlsZXMuIFRoYW5rIHlvdS4NCg0KIEtlbnQN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBaaGFuZywgSGF3a2luZw0K
U2VudDogTW9uZGF5LCBBdWd1c3QgNSwgMjAxOSA0OjE1IEFNDQpUbzogWmhvdTEsIFRhbyA8VGFv
Llpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5o
dWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4NCkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNv
bT4NClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0ZSByYXMgc3lzZnMgZmVh
dHVyZSBpbmZvDQoNClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFRhbyBaaG91DQpTZW50OiAyMDE55bm0OOaciDXml6UgMTY6MDQNClRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNv
bT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQpDYzogWmhvdTEsIFRh
byA8VGFvLlpob3UxQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0
ZSByYXMgc3lzZnMgZmVhdHVyZSBpbmZvDQoNCnJlbW92ZSBjb25mdXNlZCByYXMgZXJyb3IgdHlw
ZSBpbmZvDQoNClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE3ICsrKysrLS0t
LS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCmluZGV4IGQyZThh
ODVmNmUzOC4uMzY5NjUxMjQ3YjIzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMNCkBAIC03ODcsMjUgKzc4NywxOCBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFz
X3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LA0KIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IGRkZXYtPmRldl9wcml2YXRlOw0KIAlzdHJ1Y3QgcmFzX2NvbW1vbl9p
ZiBoZWFkOw0KIAlpbnQgcmFzX2Jsb2NrX2NvdW50ID0gQU1ER1BVX1JBU19CTE9DS19DT1VOVDsN
Ci0JaW50IGk7DQorCWludCBpLCBlbmFibGVkOw0KIAlzc2l6ZV90IHM7DQotCXN0cnVjdCByYXNf
bWFuYWdlciAqb2JqOw0KIA0KIAlzID0gc2NucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiZmVhdHVy
ZSBtYXNrOiAweCV4XG4iLCBjb24tPmZlYXR1cmVzKTsNCiANCiAJZm9yIChpID0gMDsgaSA8IHJh
c19ibG9ja19jb3VudDsgaSsrKSB7DQogCQloZWFkLmJsb2NrID0gaTsNCisJCWVuYWJsZWQgPSBh
bWRncHVfcmFzX2lzX2ZlYXR1cmVfZW5hYmxlZChhZGV2LCAmaGVhZCk7DQogDQotCQlpZiAoYW1k
Z3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRldiwgJmhlYWQpKSB7DQotCQkJb2JqID0gYW1k
Z3B1X3Jhc19maW5kX29iaihhZGV2LCAmaGVhZCk7DQotCQkJcyArPSBzY25wcmludGYoJmJ1Zltz
XSwgUEFHRV9TSVpFIC0gcywNCi0JCQkJCSIlczogJXNcbiIsDQotCQkJCQlyYXNfYmxvY2tfc3Ry
KGkpLA0KLQkJCQkJcmFzX2Vycl9zdHIob2JqLT5oZWFkLnR5cGUpKTsNCi0JCX0gZWxzZQ0KLQkJ
CXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBBR0VfU0laRSAtIHMsDQotCQkJCQkiJXM6IGRpc2Fi
bGVkXG4iLA0KLQkJCQkJcmFzX2Jsb2NrX3N0cihpKSk7DQorCQlzICs9IHNjbnByaW50ZigmYnVm
W3NdLCBQQUdFX1NJWkUgLSBzLA0KKwkJCQkiJXMgcmFzIGZlYXR1cmUgbWFzazogJXNcbiIsDQor
CQkJCXJhc19ibG9ja19zdHIoaSksIGVuYWJsZWQ/Im9uIjoib2ZmIik7DQogCX0NCiANCiAJcmV0
dXJuIHM7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
